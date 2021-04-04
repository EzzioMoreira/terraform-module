data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server*"]
  }

  owners = [var.owners_ami] # ID conta AWS Ubuntu
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  for_each      = toset(var.instance_type)
  instance_type = each.value

dynamic "ebs_block_device" {
  for_each = var.blocks
  content {
    device_name = ebs_block_device.value["device_name"]
    volume_size = ebs_block_device.value["volume_size"]
    volume_type = ebs_block_device.value["volume_type"]
  }
}
  volume_tags = {
    Name    = "WEB ${each.value}"
    Tipo    = "Homologacao"
    Sistema = "Teste"
}
  tags = {
    Name    = "WEB ${each.value}"
    Tipo    = "Homologacao"
    Sistema = "Teste"
  }
}