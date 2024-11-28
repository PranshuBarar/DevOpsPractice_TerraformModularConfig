resource "aws_route_table" "private_route_tables" {
  count = var.num_private_subnets
  vpc_id = var.vpc_id

  tags = {
    Name = "private_rtb_subnet_${var.private_subnets_info[count.index].name}"
    AZ = var.private_subnets_info[count.index].AZ
  }
}


# ==============================================================================



resource "aws_route" "nat_gateway_route" {
  count = length(var.nat_gateways_info) > 0 ? var.num_private_subnets : 0

  route_table_id            = aws_route_table.private_route_tables[count.index].id
  destination_cidr_block    = "0.0.0.0/0"

  nat_gateway_id = coalesce(
      lookup(
        { for ng in var.nat_gateways_info : ng.AZ => ng.id },
        var.private_subnets_info[count.index].AZ,
        null
      ),
      length(var.nat_gateways_info) > 0 ? var.nat_gateways_info[0].id : null
  )
}


resource "aws_route_table_association" "a" {
  count = var.num_private_subnets

  route_table_id = aws_route_table.private_route_tables[count.index].id
  subnet_id      = var.private_subnets_info[count.index].id
}