#  DevOps Lab on AWS EKS with Terraform
### English

##  Project: `devops-lab-eks`

This is a DevOps project to deploy a complete cloud infrastructure on AWS using Terraform. It includes deploying a Kubernetes cluster (EKS), network infrastructure, IAM roles, and provisioning for GitOps.
## Project structure

```bash
devops-lab-eks/
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── terraform.tfvars
│       └── backend.tf
├── modules/
│   ├── networks/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── README.md
│   └── eks/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── README.md
```

### Network module (`modules/networks`)

- VPC
- Public и Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables and Associations

###  Module EKS (`modules/eks`)
- EKS Cluster
- Node Group (2 nodes t3.small)
- IAM roles and policies for cluster and nodes

###  IAM
- `eks_cluster_role` with politics `AmazonEKSClusterPolicy`
- `eks_nodes_role` with politics:
  - `AmazonEKSWorkerNodePolicy`
  - `AmazonEC2ContainerRegistryReadOnly`
  - `AmazonEKS_CNI_Policy`

###  Terraform
- Version Terraform: `>=1.3.0`
- AWS Provider: `~> 6.3`
- Region: `eu-central-1`
- Backend: local
- Profile: `terraform_user`





### Russian
##  Проект: `devops-lab-eks`

This DevOps project is for deploying a full cloud operation on AWS using Terraform. It includes deploying a Kubernetes cluster (EKS), networking, IAM roles, and GitOps preparation.

##  Структура проекта

```bash
devops-lab-eks/
├── environments/
│   └── dev/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── terraform.tfvars
│       └── backend.tf
├── modules/
│   ├── networks/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── README.md
│   └── eks/
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── README.md
```

###  Модуль сети (`modules/networks`)
- VPC
- Public и Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables и ассоциации

###  Модуль EKS (`modules/eks`)
- EKS Cluster
- Node Group (2 узла t3.small)
- IAM роли и политики для кластера и нод

###  IAM
- `eks_cluster_role` с политикой `AmazonEKSClusterPolicy`
- `eks_nodes_role` с политиками:
  - `AmazonEKSWorkerNodePolicy`
  - `AmazonEC2ContainerRegistryReadOnly`
  - `AmazonEKS_CNI_Policy`

###  Terraform
- Версия Terraform: `>=1.3.0`
- AWS Provider: `~> 6.3`
- Регион: `eu-central-1`
- Backend: локальный
- Профиль: `terraform_user`

---

##  Status: Infrastructure Prepared (Pending Apply)

- Конфигурация прошла `terraform plan` без ошибок
- Готова к `terraform apply`
- Следующий шаг: подключение к кластеру через `aws eks update-kubeconfig` и проверка `kubectl get nodes`

---

## ⏭ План следующих этапов

1. `terraform apply`
2. Проверка доступа через `kubectl`
3. Установка ArgoCD
4. Подключение GitOps
5. Развёртывание Python microservices
6. Добавление RDS, ElastiCache, Prometheus, Grafana

---

## 📄 Автор

Подготовлено Владом Голиком в рамках практического DevOps-проекта .
Идея проекта Вадим Голик .

#####################################################################################################################################




---
