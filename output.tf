# outputs.tf
output "cluster_endpoint" {
    description = "Endpoint for EKS control plane"
    value = module.eks.cluster_endpoint
}

output "cluster_name" {
    description = "Kubernetes cluster name"
    value = module.eks.cluster_name
}

output "kubeconfig_command" {
    description = "Command to get kubeconfig for EKS cluster"
    value = "aws eks update-kubeconfig --name ${module.eks.cluster_name} --region ${var.aws_region}"
}