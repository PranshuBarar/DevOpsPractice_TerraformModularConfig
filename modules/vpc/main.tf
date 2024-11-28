resource "aws_vpc" "this" {
  cidr_block = var.vpc_ipv4_cidr_block

  tags = {
    Name = var.vpc_name
  }
}