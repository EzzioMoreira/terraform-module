data "aws_ami" "my-ami" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_name]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [var.owners_ami]
}

resource "aws_instance" "devops-test" {
  count                       = var.count-instance
  ami                         = data.aws_ami.my-ami.id
  instance_type               = var.instance_type
  key_name                    = "devops-test"
  subnet_id                   = element(aws_subnet.public.*.id, count.index)
  associate_public_ip_address = true

  vpc_security_group_ids = [aws_security_group.devops-test.id]

  tags = var.default_tags
}