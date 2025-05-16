# variables.tf

variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true # Marks this variable as sensitive, preventing it from appearing in logs and console output
}

variable "repository_name" {
  description = "Name of the GitHub repository to create"
  type        = string
  default     = "ipum-terraform-managed-repo"
}

variable "repository_description" {
  description = "Description of the GitHub repository"
  type        = string
  default     = "IPUM: Repository managed by Terraform"
}

variable "repository_publicly_visible" {
  description = "Visibility of the GitHub repository"
  type        = bool
  default     = "false"
}