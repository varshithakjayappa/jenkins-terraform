variable "project_name" {
  description = "name of the project"
  type        = string
}

variable "vpc_id" {
  description = "vpc id"
  type        = string
}

variable "ec2_instance_id" {
  
}

variable "environment" {
  description = "The environment for this project"
  type        = string
}
variable "load_balancer_type" {}
variable "ec2_sg_ssh_http" {}
variable "subnets_ids" {}