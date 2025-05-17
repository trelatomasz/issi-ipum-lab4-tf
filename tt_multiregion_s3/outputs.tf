# outputs.tf

# outputs.tf

output "bucket_arns" {
  value = {
    "${var.regions[0]}" = module.s3_us_east1.bucket_arn,
    "${var.regions[1]}" = module.s3_us_west1.bucket_arn,
    "${var.regions[2]}" = module.s3_eu_central1.bucket_arn,
  }
}

output "bucket_regions" {
  value = {
    "${module.s3_us_east1.bucket_id}"     = var.regions[0],
    "${module.s3_us_west1.bucket_id}"     = var.regions[1],
    "${module.s3_eu_central1.bucket_id}"     = var.regions[2],
  }
}