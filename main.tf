resource "tls_private_key" "ssh-key" {
  algorithm = "RSA"
  rsa_bits  = "4096"
}

resource "aws_key_pair" "key-pair" {
  key_name   = "my-key" # Create a "my-key" to AWS!!
  public_key = tls_private_key.ssh-key.public_key_openssh
}

resource "local_file" "pem_file" {
  filename             = "${aws_key_pair.key-pair.key_name}.pem"
  content              = tls_private_key.ssh-key.private_key_pem
  file_permission      = "600"
  directory_permission = "700"
}

resource "aws_instance" "sql_server_instance" {
  ami                    = var.ec2_ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key-pair.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
  tags = {
    Name = "sql_server_instance"
  }
  provisioner "remote-exec" {
    connection {
      host        = aws_instance.sql_server_instance.public_ip
      type        = "ssh"
      user        = "ec2-user"
      agent       = false
      private_key = file("${aws_key_pair.key-pair.key_name}.pem")
    }
    inline = [
      "sudo yum install -y python3"
    ]
  }
}

resource "local_file" "inventory" {
  filename   = "./ansible/hosts.ini"
  content    = <<EOF
    ${aws_instance.sql_server_instance.public_ip}
  EOF
  depends_on = [aws_instance.sql_server_instance]
}

resource "null_resource" "ansible" {
  provisioner "local-exec" {
    command     = "ansible-playbook main.yml -i hosts.ini --private-key=~/terraform-rds-sql/${aws_key_pair.key-pair.key_name}.pem --user ec2-user"
    working_dir = "ansible"
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
  }

  depends_on = [aws_instance.sql_server_instance]
}
