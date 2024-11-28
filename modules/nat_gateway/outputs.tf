output "nat_gateways_info" {
	value = [
		for nat_gateway in aws_nat_gateway.nat_gateway:
		{
			id = nat_gateway.id
			name = nat_gateway.tags["Name"]
			AZ = nat_gateway.tags["AZ"]
		}
	]
}