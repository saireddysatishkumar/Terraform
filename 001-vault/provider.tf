provider "vault" {
  address = var.vault_address
  token = data.aws_ssm_parameter.token.value
}

provider "aws" {
  region = var.region
  access_key = data.vault_aws_access_credentials.access_key
  secret_key = data.vault_aws_access_credentials.secret_key
  token = data.vault_aws_access_credentials.security_token
}