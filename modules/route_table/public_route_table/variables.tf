variable "vpc_id" {
	description = "VPC in which this public route table will reside"
	type = string
}

variable "internet_gateway_id" {
	description = "IGW Id where public route table will route all the internet bound traffic"
	type = string
}

variable "num_public_subnets" {
	description = "Number of public subnets"
	type = number
}