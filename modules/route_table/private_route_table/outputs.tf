output "private_route_table_ids_and_zones" {
	value = [
		for private_route_table in aws_route_table.private_route_tables:
		{
			id = private_route_table.id
			name = private_route_table.tags["Name"]
			AZ = private_route_table.tags["AZ"]
		}
		
	]
}