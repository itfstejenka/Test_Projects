#Main Variables
variable "aws_region" {
  description = "Region for the VPC"
  default     = "eu-central-1"
}

#EC2 Variables
variable "ec2_count" {
  default = 2
}

variable "ami" {
  default = "ami-00f5d019a71cb0d82"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "az" {
  default = "eu-central-1a"
}

