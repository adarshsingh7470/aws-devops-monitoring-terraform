variable "aws_region" {
  description = "Region to deploy resource"
  type        = string
  default     = "ap-south-1"
}

variable "aws_security_group" {
  type    = string
  default = "ec2-sg"
}
variable "aws_instance" {
  description = "Name of intance"
  type        = string
  default     = "my-server"
}

variable "keyname" {
  description = "Private key"
  type        = string
  default     = "key"
}

