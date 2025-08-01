#  Dev Environment — EKS Infrastructure

### Russian
##  Назначение

Это окружение предназначено для развёртывания полной инфраструктуры AWS EKS в рамках проекта `devops-lab-eks`.



##  Модули

- `network`: VPC, Subnets, NAT, IGW, Route Tables
- `eks`: EKS Cluster + Node Group
- IAM роли: созданы напрямую в этом окружении (в `main.tf`)



##  Используемые переменные

```hcl
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
azs                  = ["eu-central-1a", "eu-central-1b"]
k8s_version          = "1.29"
```



##  Как запустить

```bash
# Инициализация
terraform init

# Проверка плана
terraform plan -var-file=terraform.tfvars

# Применение (после подтверждения)
terraform apply -var-file=terraform.tfvars
```



##  AWS

- Регион: `eu-central-1`
- Профиль: `terraform_user`



##  Удаление ресурсов

```bash
terraform destroy -var-file=terraform.tfvars
```



##  Примечание

Это dev-окружение. Для production рекомендуется создать отдельный конфиг (`environments/prod`) с иным backend и AWS профилем.




############################################################################################################################################



### English
##  Purpose

This environment is designed to deploy a complete AWS EKS infrastructure as part of the `devops-lab-eks` project.



##  Modules

- `network`: VPC, Subnets, NAT, IGW, Route Tables
- `eks`: EKS Cluster + Node Group
- IAM roles: created directly in this environment (in `main.tf`)



##  Variables used

```hcl
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
azs                  = ["eu-central-1a", "eu-central-1b"]
k8s_version          = "1.29"
```



##  How to launch

```bash
# Initialization
terraform init

# Checking the plan
terraform plan -var-file=terraform.tfvars

# Application (after confirmation)
terraform apply -var-file=terraform.tfvars
```



##  AWS

- Region: `eu-central-1`
- Profile: `terraform_user`

---

##  Removing resources

```bash
terraform destroy -var-file=terraform.tfvars
```



##  Note

This is a dev environment. For production, it is recommended to create a separate config (`environments/prod`) with a different backend and AWS profile.