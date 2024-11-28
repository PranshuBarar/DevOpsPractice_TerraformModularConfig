resource "aws_nat_gateway" "nat_gateway" {
  count = var.num_nat_gateways
  
  allocation_id = var.elastic_ip_ids[count.index]
  subnet_id     = var.public_subnets_info[count.index].id

  tags = {
    Name = "nat_gateway_${var.public_subnets_info[count.index].name}"
    AZ = var.public_subnets_info[count.index].AZ
  }
}
