# # s3.tf

resource "random_id" "bucket_suffix" {
  count       = length(var.regions) # notice new option - it will create N resources that can be accesses by [index]
  byte_length = 4 # specify how many bytes you want
}

# WEST1
resource "aws_s3_bucket" "s3_us_west_1" {
  # concatenating strings: "${variable}-${other_variable}rest_of_string"
  # accessing different random_id formats: random_id.bucket_suffix[i].hex / int / ...
  # create bucket name concatenating bucket_name_prefix, region, and suffix using random_id in hex format
  bucket = "${var.bucket_name_prefix}-${var.regions[0]}-${random_id.bucket_suffix[0].hex}"
  provider = aws.west1
}

resource "aws_s3_bucket_versioning" "s3_us_west_1" {
  bucket = aws_s3_bucket.s3_us_west_1.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "s3_us_west_1" {
  bucket = aws_s3_bucket.s3_us_west_1.id

  rule {
    id     = "transition-to-glacier-west1"
    status = "Enabled"
    filter {}
    expiration {
      days = 30
    }

    transition {
      days          = 3
      # specify correct storage_class (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration)
      storage_class = "GLACIER_IR"
    }
  }
}

# EAST1
resource "aws_s3_bucket" "s3_us_east_1" {
  # concatenating strings: "${variable}-${other_variable}rest_of_string"
  # accessing different random_id formats: random_id.bucket_suffix[i].hex / int / ...
  # create bucket name concatenating bucket_name_prefix, region, and suffix using random_id in hex format
  bucket = "${var.bucket_name_prefix}-${var.regions[1]}-${random_id.bucket_suffix[1].hex}"
  provider = aws.east1
}

resource "aws_s3_bucket_versioning" "s3_us_east_1" {
  bucket = aws_s3_bucket.s3_us_east_1.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "s3_us_east_1" {
  bucket = aws_s3_bucket.s3_us_east_1.id

  rule {
    id     = "transition-to-glacier-east1"
    status = "Enabled"

    transition {
      days          = 3
      # specify correct storage_class (https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_lifecycle_configuration)
      storage_class = "GLACIER_IR"
    }
  }
}

