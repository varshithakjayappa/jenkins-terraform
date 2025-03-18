resource "aws_security_group" "ec2_sg_ssh_http" {
  name        = "${var.project_name}-ec2-sg"
  description = "Enable the Port 22(SSH) & Port 80(http)"
  vpc_id      = var.vpc_id
  # ssh for terraform remote exec
  ingress {
    description = "HTTP from Internet"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  # enable http
  ingress {
    description = "Allow HTTP request from anywhere"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  # enable https
  ingress {
    description = "Allow HTTP request from anywhere"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }

  #Outgoing request
  egress {
    description = "Allow outgoing request"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Security Groups to allow SSH(22) and HTTP(80)"
  }
}

# Security Group for RDS
resource "aws_security_group" "rds_mysql_sg" {
  name        = "${var.project_name}-rds-sg"
  description = "Allow access to RDS from EC2 present in public subnet"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }
}

resource "aws_security_group" "ec2_sg_python_api" {
  name        = "${var.project_name}-python-api-sg"
  description = "Enable the Port 5000 for python api"
  vpc_id      = var.vpc_id

  # ssh for terraform remote exec
  ingress {
    description = "Allow traffic on port 5000"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
  }

  tags = {
    Name = "Security Groups to allow traffic on port 5000"
  }
}