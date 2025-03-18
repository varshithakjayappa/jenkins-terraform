module "networking" {
  source = "./networking"
  vpc_cidr_block = var.vpc_cidr_block
  project_name = var.project_name
  cidr_public_subnet = var.cidr_public_subnet
  cidr_private_subnet = var.cidr_private_subnet
  availability_zone = var.availability_zone
  environment = var.environment
  public             = var.cidr_public_subnet 
  Private            = var.cidr_private_subnet 
}

module "security" {
  source = "./security-groups"
  vpc_id = module.networking.vpc_id
  project_name = var.project_name

}

module "ec2" {
  source = "./ec2"
  ec2_instance_type = var.ec2_instance_type
  subnet_id = module.networking.public_subnet_ids[0]
  ec2_sg_python_api = module.security.ec2_sg_python_api
  ec2_sg_ssh_http = module.security.ec2_sg_ssh_http
  enable_public_ip_address = true
  vpc_id = module.networking.vpc_id
  project_name = var.project_name
  environment = var.environment
 } 

module "rds" {
  source = "./rds"
  db_engine = var.db_engine
  db_engine_version = var.db_engine_version
  db_instance_class = var.db_instance_class
  db_storage_size = var.db_storage_size
  db_storage_type = var.db_storage_type
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  subnet_ids = module.networking.public_subnet_ids
  environment = var.environment
  project_name = var.project_name
  rds_mysql_sg_id = module.security.rds_mysql_sg_id  # Pass the output here
}

