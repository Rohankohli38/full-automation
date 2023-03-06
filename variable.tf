variable "ec2_ami_id" {
  default = "ami-05c8ca4485f8b138a"
}

variable "vpc_security_group_ids" {
  default = ["sg-0d7bab2165530489e"]
}

variable "subnet_id" {
  default = "subnet-023bb16a82a3f6565"
}

variable "instance_type" {
  default = "t2.medium"
}
