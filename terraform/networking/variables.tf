variable "vpc_cidr_block" {
  description = "CIDR block for vpc"
  type        = string
}

variable "project_name" {
  description = "name of vpc"
  type        = string
}

variable "environment" {
  description = "environment name"
  type        = string
}

variable "cidr_public_subnet" {
  description = "cidr block for public subnet"
  type        = list(string)
}

variable "cidr_private_subnet" {
  description = "cidr block for private subnet"
  type        = list(string)
}

variable "availability_zone" {
  description = "name of availaility zone"
  type        = list(string)
}

variable "public" {}
variable "Private" {}