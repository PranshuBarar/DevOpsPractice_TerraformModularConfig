variable "vpc_id" {
	description = "VPC in which this public route table will reside"
	type = string
}

variable "num_private_subnets" {
	description = "Number of private subnets"
	type = number
}

variable "nat_gateways_info" {
	description = "List of NAT Gateways"
	type = list(object({
		id = string
		name = string
		AZ = string
	}))
}

variable "private_subnets_info" {
	description = "List of Private Subnets"
	type = list(object({
		id   = string
      	name = string
      	tier = string
      	AZ = string
	}))
}

