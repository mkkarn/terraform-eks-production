#modules/networking/vpc/tf

# This module creates the VPC and subnets for EKS

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"
  
  name = var.cluster_name
  cidr = var.vpc_cidr

  azs = data.aws_availability_zones.available.names
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets

  enable_nat_gateway = true
  single_nat_gateway = false
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    
  }

  pubelic_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }

}