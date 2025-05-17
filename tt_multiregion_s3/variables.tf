# variables.tf

variable "regions" {
   type    = list(string)
   default = ["us-west-1", "us-east-1"]
}

variable "bucket_name_prefix" {
  type    = string
  default = "tt-issi-ipum-lab"
}