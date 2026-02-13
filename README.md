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