output "public_ip" {
  description = "AWS Instance Public IP"
  value       = aws_instance.sql_server_instance.public_ip
}
