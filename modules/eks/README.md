#Russian

## Модуль `eks`
Этот модуль создаёт кластер Kubernetes (EKS) и Node Group в указанных приватных подсетях AWS.

### Включает:
- `aws_eks_cluster`
- `aws_eks_node_group`

### Входные переменные

| Имя переменной      | Тип           | Обязательно | Описание                                                  | Пример                                 |
|---------------------|----------------|-------------|------------------------------------------------------------|----------------------------------------|
| `cluster_name`      | `string`       |   ДА         | Имя кластера EKS                                          | `"devops-lab"`                         |
| `cluster_role_arn`  | `string`       |   ДА         | ARN IAM-роли для EKS control plane                        | `"arn:aws:iam::...:role/eks-cluster"`  |
| `node_role_arn`     | `string`       |   ДА         | ARN IAM-роли для EC2-ноды                                 | `"arn:aws:iam::...:role/eks-node"`     |
| `subnet_ids`        | `list(string)` |   ДА         | Список ID приватных подсетей                              | `["subnet-abc", "subnet-def"]`         |
| `k8s_version`       | `string`       |   НЕТ        | Версия Kubernetes                                         | `"1.29"`                               |



### Outputs

| Имя output                      | Описание                                           |
|---------------------------------|----------------------------------------------------|
| `cluster_name`                  | Имя созданного кластера                            |
| `cluster_endpoint`              | API endpoint Kubernetes                            |
| `cluster_certificate_authority` | CA-данные для подключения через kubectl            |



### Пример использования

```hcl
module "eks" {
  source            = "../../modules/eks"
  cluster_name      = "devops-lab-dev"
  cluster_role_arn  = aws_iam_role.eks_cluster.arn
  node_role_arn     = aws_iam_role.eks_nodes.arn
  subnet_ids        = module.network.private_subnet_ids
  k8s_version       = "1.29"
}
```

### Примечание
- В проекте используется `t3.small`, который **не входит в Free Tier** и оплачивается отдельно.!!!!!!!!!!!!

##############################################################################################################################################################

#English

## Module `eks`
This module creates a Kubernetes (EKS) cluster and Node Group in the specified AWS private subnets.

### Includes:
- `aws_eks_cluster`
- `aws_eks_node_group`

### Inputs

| Variable name       | Type           | Necessarily   | Description                                               | Example                                |
|---------------------|----------------|---------------|-----------------------------------------------------------|----------------------------------------|
| `cluster_name`      | `string`       |   YES         | EKS Cluster Name                                          | `"devops-lab"`                         |
| `cluster_role_arn`  | `string`       |   YES         | ARN IAM-role for EKS control plane                        | `"arn:aws:iam::...:role/eks-cluster"`  |
| `node_role_arn`     | `string`       |   YES         | ARN IAM-role for EC2-node                                 | `"arn:aws:iam::...:role/eks-node"`     |
| `subnet_ids`        | `list(string)` |   YES         | List of private subnet IDs                                | `["subnet-abc", "subnet-def"]`         |
| `k8s_version`       | `string`       |   NOT         | Kubernetes version                                        | `"1.29"`                               |

### Outputs

|  output Name                    | Description                                        |
|---------------------------------|----------------------------------------------------|
| `cluster_name`                  | Name of the created cluster                        |
| `cluster_endpoint`              | API endpoint Kubernetes                            |
| `cluster_certificate_authority` | CA data for connection via kubectl                 |


### Note
- The project uses `t3.small`, which is **not included in Free Tier** and is paid for separately.!!!!!!!!!!!!