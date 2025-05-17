# s3
resource "random_id" "bucket_suffix" {
  count = length(var.regions) # notice new option - it will create N resources that can be accesses by [index]
  keepers = {
    force_regenerate = timestamp()
  }
  byte_length = 6
}

# create us-east-1 bucket using the default provider
module "s3_us_east1" {
  source = "./modules/s3_bucket"
  providers = {
    aws = aws.us-east1
  }
  region             = var.regions[0]
  random_suffix      = random_id.bucket_suffix[0].hex
  bucket_name_prefix = var.bucket_name_prefix
}
# create us-west-1 bucket using the us_west_1 provider
module "s3_us_west1" {
  source = "./modules/s3_bucket"
  # notice how we pass provider alias to the module.
  providers = {
    aws = aws.us-west1
  }
  region             = var.regions[1]
  random_suffix      = random_id.bucket_suffix[1].hex
  bucket_name_prefix = var.bucket_name_prefix
  lifecycle_days     = 30 # we can modify the days value if we want
}


# create us-west-2 bucket using the eu_west_1 provider
module "s3_eu_central1" {
  source = "./modules/s3_bucket"
  # notice how we pass provider alias to the module.
  providers = {
    aws = aws.eu-central1
  }
  region             = var.regions[2]
  random_suffix      = random_id.bucket_suffix[2].hex
  bucket_name_prefix = var.bucket_name_prefix
  lifecycle_days     = 30 # we can modify the days value if we want
}