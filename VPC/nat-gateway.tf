# Resource: aws_nat_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

resource "aws_nat_gateway" "Test-VPC-NATGW" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.Test-VPC-Public[0].id
  depends_on = [aws_internet_gateway.Test-VPC-InternetGW]

  tags = {
    Name = "Test-VPC-NATGW"
  }
}