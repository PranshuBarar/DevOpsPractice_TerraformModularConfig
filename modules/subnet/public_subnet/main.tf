resource "aws_subnet" "public_subnets" {
  count = var.num_public_subnets

  vpc_id = var.vpc_id
  cidr_block = var.public_subnet_ipv4_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]

  tags = {
    Name = "public_subnet_${count.index + 1}"
    Tier = "public"
    AZ = data.aws_availability_zones.available.names[count.index % length(data.aws_availability_zones.available.names)]
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}