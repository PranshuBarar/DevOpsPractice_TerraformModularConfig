resource "aws_route_table" "public_route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }

  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route_table_association" "a" {
  count = var.num_public_subnets

  subnet_id      = data.aws_subnets.public.ids[count.index]
  route_table_id = aws_route_table.public_route_table.id
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    Tier = "public"
  }
}