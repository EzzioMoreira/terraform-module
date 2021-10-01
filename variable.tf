####  The variables for backend ####
variable "aws_region" {
  default     = "us-east-2"
  description = "Region to AWS"
}

####  The variables for EC2 ####
variable "app_name" {
  type        = string
  default     = "DevOps-Test"
  description = "The name of product"
}

variable "ami_name" {
  type        = string
  default     = "ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64*"
  description = "The name of the AMI AWS"
}

variable "owners_ami" {
  type        = string
  default     = "099720109477"
  description = "The owner of the AMI"
}

variable "count-instance" {
  default     = "1"
  description = "The number of instance"
}

variable "instance_type" {
  type        = string
  default     = "t3a.small"
  description = "The instance type."
}

variable "default_tags" {
  type = map(any)
  default = {
    Name : "DevOps-Test",
    Team : "IAC",
    Application : "Rapadura",
    Environment : "Production",
    Terraform : "Yes",
    Owner : "Metal.Corp"
  }
}

####  The variables for network ####
variable "vpc_cidr_block" {
  default     = "10.10.0.0/16"
  description = "The IPv4 address for the VPC."
}

variable "zones" {
  type        = list(string)
  default     = ["a"]
  description = "Desired AZs"
}

variable "ingress_ports" {
  type        = list(number)
  default     = [22, 80, 443]
  description = "List of ingress ports"
}

variable "egress_ports" {
  type        = list(number)
  default     = [22, 80, 443]
  description = "List of egress ports"
}
