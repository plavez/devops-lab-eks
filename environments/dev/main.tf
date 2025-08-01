terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.3"

    }
  }
  backend "local" {}
  required_version = ">=1.3.0, < 2.0.0"
}

provider "aws" {
  region  = "eu-central-1"
  profile = "terraform_user"

  default_tags {
    tags = {
      Owner     = "vlad-team"
      ManagedBy = "Terraform"
    }
  }
}

### IAM role for cluster EKS
resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
  })

}

resource "aws_iam_role_policy_attachment" "eks_cluster_AmazonEKSClusterPolicy" {
  role       = aws_iam_role.eks_cluster.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

}

### IAM roles for Node Group
resource "aws_iam_role" "eks_nodes" {
  name = "eks-nodes-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })

}

resource "aws_iam_role_policy_attachment" "eks_nodes_AmazonEKSWorkerNodePolicy" {
  role       = aws_iam_role.eks_nodes.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

}

resource "aws_iam_role_policy_attachment" "eks_nodes_AmazonEC2ContainerRegistryReadOnly" {
  role       = aws_iam_role.eks_nodes.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

}

resource "aws_iam_role_policy_attachment" "eks_nodes_AmazonEKS_CNI_Policy" {
  role       = aws_iam_role.eks_nodes.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

}

# VPC (virtual private cloud )
module "network" {
  source = "../../modules/networks"

  name                 = "devops-lab-dev"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs

}

# EKS (elastic kubernetes service)
module "eks" {
  source = "../../modules/eks"

  cluster_name     = "devops-lab-dev"
  cluster_role_arn = aws_iam_role.eks_cluster.arn
  node_role_arn    = aws_iam_role.eks_nodes.arn
  subnet_ids       = module.network.private_subnet_ids
  k8s_version      = var.k8s_version


}

# ECR(elastic container repository) repository 
module "ecr_service_a" {
  source = "../../modules/ecr"
  name   = "devops-lab-service-a"
}

module "ecr_service_b" {
  source = "../../modules/ecr"
  name   = "devops-lab-service-b"

}
