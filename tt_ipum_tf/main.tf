# main.tf

# Checkout integrations
# https://registry.terraform.io/

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}


provider "github" {
  token = var.github_token
}

resource "github_repository" "tt_ipum_repo" {
  name        = var.repository_name
  description = var.repository_description
  visibility  = "private"
  auto_init   = true
}

output "repository_url" {
  value       = github_repository.tt_ipum_repo.html_url
  description = "URL of the created repository"
}