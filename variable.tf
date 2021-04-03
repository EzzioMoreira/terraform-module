variable "environment" {
  default = "production"
}

variable "plus" {
  default = 1
}

variable "instance_type" {
  type        = list(string)
  default     = ["t2.micro","t3.medium"]
  description = "The list of instance type."  
}

variable "tag_name" {
  type = list(number)
  default = [1,2]
  
}

variable "blocks" {
  type = list(object(
    {
      device_name = string
      volume_size = string
      volume_type = string
    }))
}