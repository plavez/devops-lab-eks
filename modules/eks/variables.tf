variable "cluster_name" {
  description = "Name of EKS cluster"
  type        = string
}

variable "cluster_role_arn" {
  description = "IAM role for conrol-plane EKS "
  type        = string
}

variable "node_role_arn" {
  description = "IAM rolefor EC2-node"
  type        = string
}

variable "subnet_ids" {
  description = "ID of the private subnets"
  type        = list(string)
}

variable "k8s_version" {
  description = "version of Kubernetes"
  type        = string
  default     = "1.29"

}

variable "min_size" {
  description = "Minimum number of nodes to have in the EKS cluster"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of nodes to have in the EKS cluster"
  type        = number
  default     = 3
}

variable "desired_size" {
  description = "Desired number of nodes to have in the EKS cluster"
  type        = number
  default     = 2

}

variable "instance_types" {
  description = "The types of EC2 instances to run in the node group"
  type        = list(string)
  default     = ["t3.small", "t3.micro"]

}
