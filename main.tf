terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region
}

# ========================================================

module "vpc" {
  source = "./modules/vpc"
  vpc_ipv4_cidr_block = var.vpc_ipv4_cidr_block
  vpc_name = var.vpc_name
}

module "private_subnets" {
  source = "./modules/subnet/private_subnet"
  num_private_subnets = var.num_private_subnets
  vpc_id = module.vpc.vpc_id
  private_subnet_ipv4_cidr_blocks = var.private_subnet_ipv4_cidr_blocks
}

module "public_subnets" {
  source = "./modules/subnet/public_subnet"
  num_public_subnets = var.num_public_subnets
  vpc_id = module.vpc.vpc_id
  public_subnet_ipv4_cidr_blocks = var.public_subnet_ipv4_cidr_blocks
}

module "elastic_ips" {
  source = "./modules/elastic_ip"
  num_elastic_ips = var.num_elastic_ips
}

module "internet_gateway" {
  source = "./modules/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

module "nat_gateways" {
  source = "./modules/nat_gateway"
  num_nat_gateways = var.num_nat_gateways
  elastic_ip_ids = module.elastic_ips.elastic_ip_ids
  public_subnets_info = module.public_subnets.public_subnets_info
  depends_on = [module.internet_gateway.igw_id]
}

module "public_route_table" {
  source = "./modules/route_table/public_route_table"
  vpc_id = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.igw_id
  num_public_subnets = var.num_public_subnets
  depends_on = [module.public_subnets.public_subnet_ids_and_names]
}

module "private_route_table" {
  source = "./modules/route_table/private_route_table"
  vpc_id = module.vpc.vpc_id
  num_private_subnets = var.num_private_subnets
  private_subnets_info = module.private_subnets.private_subnets_info
  nat_gateways_info = module.nat_gateways.nat_gateways_info
}