output "ec2_sg_ssh_http" {
  value = aws_security_group.ec2_sg_ssh_http.id
}

output "rds_mysql_sg_id" {
  value = aws_security_group.rds_mysql_sg.id
}


output "ec2_sg_python_api" {
  value = aws_security_group.ec2_sg_python_api.id
}