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
  default = "ami-0502e817a62226e03"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "az" {
  default = "eu-central-1a"
}

