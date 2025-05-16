# providers.tf

terraform {
  required_version = ">=1.7.0"
  # Note that previously we did not declare terraform version.
  # In this scenario terraform will not validate terraform version
  # but try to resolve with installed one.
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # configure remote backend
  backend "s3" {
   region = "eu-central-1"
    # Bucket manually created
    #  aws s3api create-bucket --bucket tt-ipum-remote-state-provider --region eu-central-1  --create-bucket-configuration LocationConstraint=eu-central-1

   bucket = "tt-ipum-remote-state-provider"
   key    =  "tt_ipum_tf/terraform.tfstate"
   # if we would like to support locking, we need to provide a dynamodb table
   # name, this might be helpful if we have multiple teams working on the same
   # infrastructure
   # this is a good practice to avoid race conditions. The terraform will look if
   # the lock is already taken and if it is, it will return an error untill the
   # lock is released.

  #    aws dynamodb create-table \
  # --table-name tt-ipum-tf-lock \
  # --attribute-definitions AttributeName=LockID,AttributeType=S \
  # --key-schema AttributeName=LockID,KeyType=HASH \
  # --billing-mode PAY_PER_REQUEST

   dynamodb_table = "tt-ipum-tf-lock"

   }
}

provider "aws" {
   region = "eu-central-1"
}