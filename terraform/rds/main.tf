resource "aws_db_subnet_group" "default" {
  name = "${var.project_name}-db-subnet-group"
  subnet_ids = var.subnet_ids

   tags = {
    Name = "${var.project_name}-db"
    Environment = var.environment
  }
}


resource "aws_db_instance" "default" {
  identifier = "${var.project_name}-db"
  allocated_storage    = var.db_storage_size
  storage_type = var.db_storage_type
  multi_az = true
  db_name              = var.db_name
  engine               = var.db_engine
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  username             = var.db_name
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  apply_immediately = true
  backup_retention_period = 0
  deletion_protection = false
  vpc_security_group_ids = var.rds_mysql_sg_id
  db_subnet_group_name = aws_db_subnet_group.default.name

  tags = {
    Name = "${var.project_name}-db"
    Environment = var.environment
  }
}