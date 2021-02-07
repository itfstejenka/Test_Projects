output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, this is only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.docker_ubuntu.*.public_dns
}

output "availability_zone" {
  description = "List of availability zones of instances"
  value       = aws_instance.docker_ubuntu.0.availability_zone
}