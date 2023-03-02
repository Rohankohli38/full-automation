output "public_ip" {
  description = "AWS Instance Public IP"
  value       = aws_instance.sql_server_instance.public_ip
}
/*
output "rds_endpoint" {
  description = "RDS Enpoint"
  value       = aws_db_instance.rds-sql-instance.address
}
output "rds_username" {
  description = "RDS Username"
  value       = local.db_creds.username
  sensitive   = true
}
output "rds_password" {
  description = "RDS password"
  value       = local.db_creds.password
  sensitive   = true
}*/
