terraform {
  backend "s3" {
    bucket = "python-app"
    key = "./terraform/terraform.tfstate"
    region = var.aws_region
  }
}