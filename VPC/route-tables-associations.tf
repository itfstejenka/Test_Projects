# Resource: aws_route_table_association
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association

resource "aws_route_table_association" "Test-VPC-Public-1-Association" {
  subnet_id = aws_subnet.Test-VPC-Public[0].id
  route_table_id = aws_route_table.Test-VPC-Public-Route.id
}

resource "aws_route_table_association" "Test-VPC-Public-2-Association" {
  subnet_id = aws_subnet.Test-VPC-Public[1].id
  route_table_id = aws_route_table.Test-VPC-Public-Route.id
}

resource "aws_route_table_association" "Test-VPC-Private-1-Association" {
  subnet_id = aws_subnet.Test-VPC-Private[0].id
  route_table_id = aws_route_table.Test-VPC-Private-Route.id
}

resource "aws_route_table_association" "Test-VPC-Private-2-Association" {
  subnet_id = aws_subnet.Test-VPC-Private[1].id
  route_table_id = aws_route_table.Test-VPC-Private-Route.id
}