#Russian
## Network Module
Этот модуль создаёт базовую сетевую инфраструктуру в AWS:
- VPC с CIDR по умолчанию `10.0.0.0/16`
- 2 публичные подсети в разных зонах доступности
- 2 приватные подсети в тех же зонах
- Internet Gateway и NAT Gateway
- Таблицы маршрутов для публичных и приватных подсетей
## Переменные `network`

| Имя переменной           | Тип          | Обязательно | Описание                                                    | Пример                                   |
|--------------------------|---------------|--------------|-------------------------------------------------------------|-------------------------------------------|
| `name`                   | `string`      |   ДА         | Префикс для тегов ресурсов AWS                              | `"devops-lab-dev"`                        |
| `vpc_cidr`               | `string`      |   ДА         | CIDR-блок для VPC                                           | `"10.0.0.0/16"`                           |
| `public_subnet_cidrs`    | `list(string)`|   ДА         | CIDR-блоки для публичных подсетей                           | `["10.0.1.0/24", "10.0.2.0/24"]`          |
| `private_subnet_cidrs`   | `list(string)`|   ДА         | CIDR-блоки для приватных подсетей                           | `["10.0.101.0/24", "10.0.102.0/24"]`      |
| `azs`                    | `list(string)`|   ДА         | Список зон доступности, соответствующих CIDR-подсетям       | `["eu-central-1a", "eu-central-1b"]`      |


## outputs `network`

| Имя output              | Описание                                        |
|-------------------------|-------------------------------------------------|
| `vpc_id`                | ID созданной VPC                                |
| `public_subnet_ids`     | Список ID публичных подсетей                    |
| `private_subnet_ids`    | Список ID приватных подсетей                    |
| `nat_gateway_id`        | ID созданного NAT Gateway                       |


## Использование (пример)
```hcl
module "network" {
  source                = "../../modules/network"
  name                  = "devops-lab-dev"
  vpc_cidr              = "10.0.0.0/16"
  public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs  = ["10.0.101.0/24", "10.0.102.0/24"]
  azs                   = ["eu-central-1a", "eu-central-1b"]
  
}
```


#######################################################################################################################################################################

#English
## Network Module
This module creates the basic network infrastructure in AWS:
- VPC with default CIDR `10.0.0.0/16`
- 2 public subnets in different availability zones
- 2 private subnets in the same zones
- Internet Gateway and NAT Gateway
- Route tables for public and private subnets

## Inputs `network`
| Variable name            | Type          | Necessarily  | Description                                                 | Example                                   |
|--------------------------|---------------|--------------|-------------------------------------------------------------|-------------------------------------------|
| `name`                   | `string`      |  YES         | Prefix for AWS resource tags                                | `"devops-lab-dev"`                        |
| `vpc_cidr`               | `string`      |  YES         | CIDR block for VPC                                          | `"10.0.0.0/16"`                           |
| `public_subnet_cidrs`    | `list(string)`|  YES         | CIDR blocks for public subnets                              | `["10.0.1.0/24", "10.0.2.0/24"]`          |
| `private_subnet_cidrs`   | `list(string)`|  YES         | CIDR blocks for private subnets                             | `["10.0.101.0/24", "10.0.102.0/24"]`      |
| `azs`                    | `list(string)`|  YES         | List of availability zones corresponding to CIDR subnets    | `["eu-central-1a", "eu-central-1b"]`      |

## Outputs `network`

| Name output              | Description                                        |
|-------------------------|-------------------------------------------------|
| `vpc_id`                | ID of the created VPC                           |
| `public_subnet_ids`     | List of public subnet IDs                       |
| `private_subnet_ids`    | List of private subnet IDs                      |
| `nat_gateway_id`        | ID of the created NAT Gateway                   |


## Usage (example)
```hcl
module "network" {
  source                = "../../modules/network"
  name                  = "devops-lab-dev"
  vpc_cidr              = "10.0.0.0/16"
  public_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs  = ["10.0.101.0/24", "10.0.102.0/24"]
  azs                   = ["eu-central-1a", "eu-central-1b"]
}