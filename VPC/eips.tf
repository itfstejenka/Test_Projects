# Resource: aws_eip
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip

resource "aws_eip" "nat1" {
  depends_on = [aws_internet_gateway.Test-VPC-InternetGW]
}