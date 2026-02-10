# modules/networking/variables.tf

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default = "10.0.0.0/16"
}

variable "public_subnet_tags" {
  description = "Public subnet tags"
  type = map(string)
  default = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
 
  }
