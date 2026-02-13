# modules/eks/main.tf
  
module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id = var.vpc_id

    subnet_ids = var.private_subnet_ids

    # Security
    cluster_endpoint_private_access = true
    cluster_endpoint_public_access = true
    cluster_endpoint_public_access_cidrs = var.allowed_cidrs

    # Node groups
    eks_managed_node_groups = {
        primary = {
            desired_capacity = var.desired_capacity
            max_capacity     = var.max_capacity
            min_capacity     = var.min_capacity

            instance_types   = var.instance_types
            capacity_type    = var.capacity_type  # On-Demand or Spot
        
        labels = {
            "k8s.io/cluster-autoscaler/enabled" = "true"
            "k8s.io/cluster-autoscaler/${var.cluster_name}" = "owned"
        }
    }
    }
}