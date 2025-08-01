# ✅ Step 7 — Проверка доступа к кластеру EKS

В терминале авторизируемся в aws данные из .aws
aws configure --profile terraform_user



На этом этапе вы выполняете `terraform apply`, настраиваете доступ к кластеру и проверяете подключение.

---

## 📦 Предварительные условия

- Кластер EKS и Node Group описаны и готовы к применению
- IAM роли для кластера и нод созданы
- AWS CLI и `kubectl` установлены
- AWS профиль: `terraform_user`

---

## 🚀 Шаги

### 1. Применение инфраструктуры

```bash
terraform apply
```

Подтвердите ввод `yes`, когда будет предложено.

---

### 2. Настройка kubeconfig

После успешного `apply`, настройте локальное подключение к кластеру:

```bash
aws eks update-kubeconfig \
  --region eu-central-1 \
  --name devops-lab-dev \
  --profile terraform_user
```

---

### 3. Проверка подключения к кластеру

```bash
kubectl get nodes
```

✅ Ожидается, что вы увидите 2 ноды в статусе `Ready`.

---

### 4. Проверка output-переменных

```bash
terraform output
```

Вывод должен содержать:

- `cluster_name`
- `cluster_endpoint`
- `cluster_ca`

---

### 5. Удаление ресурсов (если кластер больше не нужен)

```bash
terraform destroy
```

---

## 📎 Примечания

- Время создания EKS и нод — ~15 минут
- Не оставляйте кластер включённым надолго — оплачиваются EC2 и NAT