resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = var.default_tags
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = var.default_tags
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = var.default_tags
}

resource "aws_main_route_table_association" "main" {
  vpc_id         = aws_vpc.main.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route" "default" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main.id
}

resource "aws_subnet" "public" {
  count = length(var.zones)

  vpc_id = aws_vpc.main.id

  cidr_block        = cidrsubnet(var.vpc_cidr_block, 8, count.index)
  availability_zone = "${var.aws_region}${element(var.zones, count.index)}"

  map_public_ip_on_launch = true

  tags = var.default_tags
}

resource "aws_route_table_association" "public" {
  count = length(var.zones)

  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "devops-test" {
  vpc_id      = aws_vpc.main.id
  name        = var.app_name
  description = "Trafego HTTP, HTTS and SSH"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egress_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}