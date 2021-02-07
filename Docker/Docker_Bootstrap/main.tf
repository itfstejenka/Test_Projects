#MAIN
provider "aws" {
  region = var.aws_region
}

#DATA VPC

data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"
    values = ["Test-VPC"]
  }
}

data "aws_subnet" "selected" {
  filter {
    name = "tag:Name"
    values = ["Public-1a"]
  }
}

#EC2
resource "aws_instance" "docker_ubuntu" {
  count                  = var.ec2_count
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.az
  key_name               = aws_key_pair.terraform_aws_docker.key_name
  vpc_security_group_ids = aws_security_group.aws_ssh_docker.*.id
  subnet_id              = data.aws_subnet.selected.id



  tags = {
    "Name" = "docker-EC2-${terraform.workspace}-${count.index + 1}"
  }

  lifecycle {
    create_before_destroy = true
  }

  connection {
    type = "ssh"
    user = "ubuntu"
    host = self.public_ip
  }

  provisioner "file" {
    source      = "docker.sh"
    destination = "/tmp/docker.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/docker.sh",
      "/tmp/docker.sh",
    ]
  }
}

#SSH KEY
resource "aws_key_pair" "terraform_aws_docker" {
  key_name   = "terraform_aws_docker2"
  public_key = file("~/.ssh/id_rsa.pub")
}

#Security Group
resource "aws_security_group" "aws_ssh_docker" {
  vpc_id      = data.aws_vpc.selected.id
  name        = "aws_ssh_docker"
  description = "Allow SSH to AWS Docker EC2"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["83.25.162.73/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
