variable "num_private_subnets" {
	description = "Number of private subnets to be created"
	type = number
}

variable "vpc_id" {
	description = "VPC Id in which subnet has to be created"
	type = string
}

variable "private_subnet_ipv4_cidr_blocks" {
	description = "IPv4 CIDR blocks for each private subnet"
	type = list(string)
}

