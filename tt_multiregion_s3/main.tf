# main.tf

terraform {
   required_version = "~> 1.0"
   required_providers {
      aws = {
         source  = "hashicorp/aws"
         version = "~> 5.0"
      }

      random = {
         source  = "hashicorp/random"
         version = "~> 3.0"
      }
   }
}

provider "aws" {
  alias  = "us-east1"
  region = var.regions[0]
}

provider "aws" {
  alias = "us-west1"
  region = var.regions[1]
}

provider "aws" {
  alias  = "eu-central1"
  region = var.regions[2]
}

