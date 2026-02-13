# main.tf
provider "aws" {
  region = var.aws_region
}

module "networking" {
    source = "./modules/networking"
    cluster_name = var.cluster_name
    vpc_cidr = var.vpc_cidr
    public_subnets = var.public_subnets
    private_subnets = var.private_subnets
  
}

module "eks" {
    source = "./modules/eks"
    cluster_name = var.cluster_name
    kubernetes_version = var.kubernetes_version
    vpc_id = module.networking.vpc_id
    private_subnet_ids = module.networking.private_subnet_ids
    allowed_cidrs = var.allowed_cidrs
    desired_nodes = var.desired_nodes
    max_nodes = var.max_nodes
    min_nodes = var.min_nodes
    instance_types = var.instance_types

}