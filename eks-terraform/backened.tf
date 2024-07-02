terraform {
  backend "s3" {
    bucket = "agfshfaffsdf" # Replace with your actual S3 bucket name
    key    = "Jenkins/terraform.tfstate"
    region = "sa-east-1"
  }
}
