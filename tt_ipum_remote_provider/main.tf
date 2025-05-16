resource "aws_ecr_repository" "tt_aws_ecr_repository" {
  name                 = "bar"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}