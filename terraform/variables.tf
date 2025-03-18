variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block of vpc"
  type        = string
}

variable "cidr_public_subnet" {
  description = "public subnet CIDR values"
  type        = list(string)
}

variable "cidr_private_subnet" {
  description = "private subnet CIDR values"
  type        = list(string)
}

variable "availability_zone" {
  description = "name of availaility zone"
  type        = list(string)
}

variable "environment" {
  description = "The environment for this project"
  type        = string
}

variable "ec2_instance_type" {
  description = "ec2 instance type"
  type        = string
}

variable "db_name" {
  description = "name of the database"
  type = string
}

variable "db_username" {
  description = "database username"
  type = string
}

variable "db_password" {
  description = "database password"
  type = string
}

variable "db_engine" {
  description = "database engine type"
  type = string
}

variable "db_storage_type" {
  description = "Database Storage Type"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_storage_size" {
  description = "RDS storage size in GB"
  type        = number
}

variable "db_engine_version" {
  description = "RDS MySQL engine version"
  type        = string
}

variable "rds_mysql_sg_id" {
  description = "RDS MySQL security id"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for RDS"
  type        = list(string)
}
