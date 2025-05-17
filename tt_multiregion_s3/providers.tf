# providers.tf


# default provider configuration
provider "aws" {
  region = var.regions[0]
}


# provider alias with another region
provider "aws" {
  alias  = "us_west_2"
  region = "us-west-2"
}