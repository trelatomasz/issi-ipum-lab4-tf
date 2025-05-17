# s3.tf

# uses default provider configuration
resource "aws_s3_bucket" "tt_ipum_s3_east" {
  bucket = "tt-ipum-s3-east"
  tags = {
    Name = "my-bucket"
  }
}

# alias provider specified, it will use its configuration
resource "aws_s3_bucket" "tt_ipum_s3_west2" {
  bucket   = "tt-ipum-s3-west2"
  provider = aws.us_west_2
  tags = {
    Name = "my-bucket"
  }
}