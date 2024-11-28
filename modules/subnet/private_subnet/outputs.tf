output "private_subnets_info" {
  value = [
    for subnet in aws_subnet.private_subnets :
    {
      id   = subnet.id
      name = subnet.tags["Name"]
      tier = subnet.tags["Tier"]
      AZ = subnet.tags["AZ"]
    }
  ]
}