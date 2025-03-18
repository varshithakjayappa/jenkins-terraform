variable "project_name" {
  description = "name of the project"
  type = string
}

variable "environment" {
  description = "environment name"
  type = string
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
   description = "RDS MySQL security group ID"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Subnet IDs for RDS"
  type        = list(string)
}
