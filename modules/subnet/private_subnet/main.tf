resource "aws_subnet" "private_subnets" {
  count = var.num_private_subnets

  vpc_id = var.vpc_id
  cidr_block = var.private_subnet_ipv4_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]

  tags = {
    Name = "private_subnet_${count.index + 1}"
    Tier = "private"
    AZ = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}
