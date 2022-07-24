# aws.tf
provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "full_of_holes5" {
  bucket = "my-tg-cost-estimations-test-bucket5"
  acl    = "private"

  tags = {
    Name        = "My bucket5"
  }
}
