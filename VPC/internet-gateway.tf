# Resource: aws_internet_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

resource "aws_internet_gateway" "Test-VPC-InternetGW" {
  vpc_id = aws_vpc.Test-VPC.id

  tags = {
    Name = "Test-VPC-InternetGW"
  }
}