variable "num_public_subnets" {
	description = "Number of public subnets to be created"
	type = number
}

variable "vpc_id" {
	description = "VPC Id in which subnet has to be created"
	type = string
}

variable "public_subnet_ipv4_cidr_blocks" {
	description = "IPv4 CIDR blocks for each public subnet"
	type = list(string)
}