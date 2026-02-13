# variabes.tf 

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type = string
}

variable "kubernetes_version" {
  description = "kubernetes version to use"
  type = string
  default = "1.28"
}

variable "desired_nodes" {
  description = "Desired number of worker nodes"
  type = number
  default = 2
}