# Resource: aws_subnet
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

variable "public_subnet" {
  type    = list(any)
  default = ["192.168.0.0/24", "192.168.1.0/24"]
}

variable "private_subnet" {
  type    = list(any)
  default = ["192.168.2.0/24", "192.168.3.0/24"]
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "Test-VPC-Public" {
  count                   = length(var.public_subnet)
  vpc_id                  = aws_vpc.Test-VPC.id
  cidr_block              = var.public_subnet[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name                        = "Public-${count.index + 1}"
    "kubernetes.io/cluster/test-eks" = "shared"
    "kubernetes.io/role/elb"    = 1
  }
}

resource "aws_subnet" "Test-VPC-Private" {
  count                   = length(var.private_subnet)
  vpc_id                  = aws_vpc.Test-VPC.id
  cidr_block              = var.private_subnet[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name                        = "Private-${count.index + 1}"
    "kubernetes.io/cluster/test-eks" = "shared"
    "kubernetes.io/role/internal-elb"    = 1
  }
}
