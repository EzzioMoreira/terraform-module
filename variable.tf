# Id owner conta aws
variable "owners_ami" {
  description = "Id owner conta aws."
  type = number
  default = 099720109477
}
# Variavel staging
variable "environment" {
  default = "production"
}

# Variavel tipo e quantidade de instância
variable "instance_type" {
  type        = list(string)
  default     = ["t2.micro","t3.medium"]
  description = "The list of instance type."  
}

# Variavel TAGS
variable "tag_name" {
  type = list(number)
  default = [1,2]
  
}

# Variavel EBS
variable "blocks" {
  default = false
  type = list(object(
    {
      device_name = string
      volume_size = string
      volume_type = string
    }))
}

# Variavel nome do produto
variable "name" {
  type        = string
  description = "Name of product"
}