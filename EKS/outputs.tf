output "vpc_id" {
  value       = aws_vpc.Test-VPC.id
  description = "VPC id."
}

output "subnet_public_1" {
  value = aws_subnet.Test-VPC-Public[0].id
}

output "subnet_public_2" {
  value = aws_subnet.Test-VPC-Public[1].id
}

output "subnet_private_1" {
  value = aws_subnet.Test-VPC-Private[0].id
}

output "subnet_private_2" {
  value = aws_subnet.Test-VPC-Private[1].id
}
