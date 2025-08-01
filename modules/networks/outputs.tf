output "public_subnet_ids" {
  value = aws_subnet.public[*].id

}

output "private_subnet_ids" {
  value = aws_subnet.private[*].id

}

output "igw_id" {
  value = aws_internet_gateway.this.id

}
