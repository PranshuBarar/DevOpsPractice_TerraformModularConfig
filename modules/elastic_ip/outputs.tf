output "elastic_ip_ids" {
  value = aws_eip.elastic_ip[*].id
}