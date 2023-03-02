### Subnet group variables ###

variable "subnet_group_name" {
  default = "my-rds-subnet"
}
variable "subnet_id_list" {
  default = ["subnet-01743e26ea2d0d255", "subnet-07c48f7049935a61d", "subnet-046b4f38903f8ed68"]
}

### Parameter group variables ###

variable "parameter_group_name" {
  default = "my-rds-parameter-group"
}
variable "pg_family" {
  default = "sqlserver-se-15.0"
}

### Option group variables ###

variable "option_group_name" {
  default = "my-rds-option-group"
}
variable "option_group_engine" {
  default = "sqlserver-se"
}
variable "major_engine_version" {
  default = "15.00"
}

### KMS KEY VARIABLE ###

variable "is_enabled" {
  default = "true"
}
variable "enable_key_rotation" {
  default = "false"
}
variable "deletion_window_in_days" {
  default = "7"
}

### RDS DB instance variables ###

variable "allocated_storage" {
  default = "20"
}
variable "identifier" {
  default = "my-rds-instance"
}
variable "db_name" {
  default = ""
}
variable "db_engine" {
  default = "sqlserver-se"
}
variable "db_engine_version" {
  default = "15.00.4236.7.v1"
}
variable "instance_class" {
  default = "db.t3.xlarge"
}
/*variable "user_name" {
  default = "root"
}
variable "user_password" {
  default = "rootroot"
}*/
variable "kms_key_id" {
  default = "arn:aws:kms:us-east-1:107506015003:key/09d4cad7-ad01-46cd-b0b0-85b9d79462ba"
}
variable "vpc_security_group_ids" {
  default = ["sg-02fd56de814d79e7a"]
}
variable "deletion_protection" {
  default = "false"
}
variable "timezone" {
  default = "UTC"
}
variable "storage_type" {
  default = "gp2"
}
variable "storage_encrypted" {
  default = "true"
}
variable "skip_final_snapshot" {
  default = "true"
}
variable "port" {
  default = "1433"
}
variable "publicly_accessible" {
  default = "false"
}
variable "allow_major_version_upgrade" {
  default = "true"
}
variable "auto_minor_version_upgrade" {
  default = "true"
}
variable "backup_retention_period" {
  default = "0"
}
variable "iam_database_authentication_enabled" {
  default = "false"
}
variable "max_allocated_storage" {
  default = "100"
}
variable "multi_az" {
  default = "false"
}
variable "apply_immediately" {
  default = "true"
}
