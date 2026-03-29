output "aws_vpc" {
  value = aws_vpc.main-vpc.id
}

output "aws_instance-public-ip" {
  value = aws_instance.my-server.public_ip
}

output "aws_instance-private-ip" {
  value = aws_instance.my-server.private_ip
}


