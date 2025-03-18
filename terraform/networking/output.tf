output "vpc_id" {
  description = "id of vpc"
  value       = aws_vpc.main_id.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id
}

output "nat_gateway_id" {
  description = "IDs of NAT Gateway"
  value       = aws_nat_gateway.nat_gateway.id
}

output "public_subnet_cidr_block" {
  value = aws_subnet.public[*].cidr_block
}

