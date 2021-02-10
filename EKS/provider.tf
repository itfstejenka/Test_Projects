# Provider: aws
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs

provider "aws" {
    region = "eu-central-1"
}

terraform {
  required_version = ">= 0.12.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}