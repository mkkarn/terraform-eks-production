# terraform-eks-production
Production-ready EKS cluster with Terraform IaC
Infrastructure as Code for AWS EKS

# Production-Ready EKS Cluster with Terraform

## 🎯 Problem Statement
Managing Kubernetes infrastructure manually leads to configuration drift and makes disaster recovery difficult. This project provides a fully automated, production-ready EKS cluster deployment.

## 🏗️ Architecture
![Architecture Diagram](docs/architecture.png)

### Features
- ✅ Multi-AZ deployment for HA
- ✅ Private node groups with public API endpoint
- ✅ Auto-scaling enabled (Cluster Autoscaler ready)
- ✅ EBS CSI driver for persistent volumes
- ✅ SPOT instance support for cost optimization
- ✅ IRSA (IAM Roles for Service Accounts) enabled

## 🛠️ Tech Stack
- **Terraform**: 1.5+
- **AWS EKS**: 1.28
- **Provider Versions**: AWS Provider 5.0+

## 📋 Prerequisites
- AWS CLI configured
- Terraform 1.5+
- kubectl 1.28+
- aws-iam-authenticator

## 🚀 Quick Start


## Deployment Plan

This Terraform configuration creates:
- 1 VPC with 3 public and 3 private subnets
- EKS cluster version 1.28
- 2-node autoscaling group (t3.small SPOT instances)
- NAT Gateway for private subnet internet access
- IAM roles with IRSA support

![Terraform Plan Output](docs/terraform-plan.png)

> Note: This is a demonstration project. Full deployment costs ~$120/month.

Explanation of Each Value
Variable	            Your Value	            Why This Value
aws_region	            ap-south-1	            Most common region, lowest cost
cluster_name	        demo-eks-cluster	    Descriptive name (you can change to anything)
kubernetes_version	    1.28	                Latest stable version as of now
vpc_cidr	            10.0.0.0/16	            Standard private network range (65,536 IPs)
private_subnets	        10.0.1-3.0/24	        3 subnets across 3 AZs (256 IPs each)
public_subnets	        10.0.101-103.0/24	    3 public subnets (for load balancers)
desired_nodes	        2	                    Minimum for HA (high availability)
min_nodes	            1	                    Can scale down to 1 to save cost
max_nodes	            4	                    Can scale up to 4 if traffic increases
instance_types	        t3.small	            2 vCPU, 2GB RAM - sufficient for demos
capacity_type	        SPOT	                70% cheaper than ON_DEMAND
allowed_cidrs	        YOUR_IP/32	            Security: only you can access the cluster
single_nat_gateway	    true	                Save $32/month (use false for production)

## Infrastructure Preview

Running `terraform plan` shows this will create:

![Terraform Plan](docs/plan-output.png)

**Resources Created:**
- VPC with 6 subnets across 3 AZs
- EKS cluster with managed node group
- Auto-scaling configuration
- IAM roles and policies
- Security groups
- NAT Gateway