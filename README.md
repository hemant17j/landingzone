# Azure Regional Landing Zone

## Files
- providers.tf
- malaysiawest.tf
- indiasouthcentral.tf
- eastasia.tf
- uaenorth.tf
- koreacentral.tf
- subscription-rbac.tf

## Required replacements
Replace `00000000-0000-0000-0000-000000000000` with the target Azure subscription ID.
Replace `11111111-1111-1111-1111-111111111111` with the Microsoft Entra object ID of the signed-in deployment user.

## Deployment
```bash
az login
az account set --subscription "<subscription-id>"
az account show --query "{subscription:id,user:user.name,tenant:tenantId}" -o table
terraform init
terraform fmt -recursive
terraform validate
terraform plan -out main.tfplan
terraform apply main.tfplan
```
