variable "ec2_instance_type" {
  description = "ec2 instance type"
  type        = string
}

variable "project_name" {
  description = "name of the project"
  type        = string
}

variable "subnet_id" {
  description = "subnet id where ec2 will be launched"
  type        = string
}

variable "ec2_sg_python_api" {
  description = "security group ids for python api"
  type        = string
}

variable "vpc_id" {
  description = "vpc id"
  type        = string
}

variable "ec2_sg_ssh_http" {
  description = "security group ids for ssh and http"
  type = string
}


variable "enable_public_ip_address" {}
variable "environment" {}
variable "aws_key_pair_private_key" {
  description = "Base64 encoded private key for AWS EC2"
  type        = string
  sensitive   = true
}
