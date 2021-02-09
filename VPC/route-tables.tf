# Resource: aws_route_table
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_route_table" "Test-VPC-Public-Route" {
  vpc_id = aws_vpc.Test-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Test-VPC-InternetGW.id
  }

  tags = {
    Name = "Test-VPC-Public-Route"
  }
}

resource "aws_route_table" "Test-VPC-Private-Route" {
  vpc_id = aws_vpc.Test-VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.Test-VPC-NATGW.id
  }

  tags = {
    Name = "Test-VPC-Private-Route"
  }
}
