output "vpc_id" {
  description = "ID of vpc"
  value = module.networking.vpc_id
}

output "rds_mysql_sg_id" {
  value = [aws_security_group.rds_mysql_sg.id]  # Output as a list
}
