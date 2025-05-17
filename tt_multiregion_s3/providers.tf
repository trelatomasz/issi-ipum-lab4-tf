# providers.tf


provider "aws" {
  alias = "west1"
  region = var.regions[0]
}

provider "aws" {
  alias  = "east1"
  region = var.regions[1]
}