# Setup VPC
resource "aws_vpc" "main_id" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "${var.project_name}-vpc"
    environment = var.environment
  }
}

# Setup public subnet
resource "aws_subnet" "public" {
  count                   = length(var.public)
  vpc_id                  = aws_vpc.main_id.id
  cidr_block              = element(var.cidr_public_subnet, count.index)
  availability_zone       = element(var.availability_zone, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-public-subnet-${count.index + 1}"
  }
}

# Setup private subnet
resource "aws_subnet" "private" {
  count             = length(var.cidr_private_subnet)
  vpc_id            = aws_vpc.main_id.id
  cidr_block        = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.availability_zone, count.index)
  tags = {
    Name = "${var.project_name}-private-subnet-${count.index + 1}"
  }
}

# Setup Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_id.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

#setup NAT gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.project_name}-nat"
  }
   depends_on = [aws_internet_gateway.igw] 
}

#setup Elastic IP for NAT gateway
resource "aws_eip" "nat" {
  domain = "vpc"
  tags = {
    Name = "${var.project_name}-eip"
  }
}

# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main_id.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.project_name}-public_route_table"
  }
}

# Public Route Table and Public Subnet Association
resource "aws_route_table_association" "public_subnet_association" {
  count          = length(aws_subnet.public)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

# Private Route Table
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main_id.id
  route {
    cidr_block = "0.0.0.0/0"
     nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "${var.project_name}-private_route_table"
  }
}

# Private Route Table and Private Subnet Association
resource "aws_route_table_association" "private_subnet_association" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}

