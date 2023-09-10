terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "example-org-1ebc0c"

    workspaces {
      name = "vault-secrets"
    }
  }
}