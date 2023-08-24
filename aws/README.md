terraform workspace new staging
terraform workspace new prod

terraform init --reconfigure -backend-config=backend-prod.tfvars
terraform init --configure -backend-config=backend-prod.tfvars
terraform plan -var-file=apple-prod.tfvars

