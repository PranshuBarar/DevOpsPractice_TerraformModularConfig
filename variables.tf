variable "vpc_ipv4_cidr_block" {
	description = "IPv4 CIDR block for the VPC"
	type = string
	default = "172.16.0.0/16"
}

variable "vpc_name" {
	description = "Name of the VPC"
	type = string
	default = "DemoVPC"
}

variable "region" {
	description = "Region for creating resources"
	type = string
	default = "ap-south-1"
}

variable "num_private_subnets" {
	description = "Number of private subnets to be created"
	type = number
	default = 1
}

variable "num_public_subnets" {
	description = "Number of public subnets to be created"
	type = number
	default = 1
}

variable "private_subnet_ipv4_cidr_blocks" {
	description = "IPv4 CIDR block for the each private subnets"
	type = list(string)
	default = ["10.0.0.0/20"]
}

variable "public_subnet_ipv4_cidr_blocks" {
	description = "IPv4 CIDR block for the each public subnets"
	type = list(string)
	default = ["10.0.16.0/20"]
}

variable "num_elastic_ips" {
	description = "Number of elastic ip to be created"
	type = number
	default = 1
}

variable "num_nat_gateways" {
	description = "Number of NAT Gateways to be made"
	type = number
	default = 1
}