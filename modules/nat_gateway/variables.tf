variable "num_nat_gateways" {
	description = "Number of NAT Gateways to be created"
	type = number
	default = 1
}

variable "elastic_ip_ids" {
	description = "Elastic IPs which have to be allocated to NAT Gateways"
	type = list(string)
}

variable "public_subnets_info" {
	description = "Public Subnets in which NAT Gateways has to be made"
	type = list(object({
		id = string
		name = string
		tier = string
		AZ = string
	}))
}

