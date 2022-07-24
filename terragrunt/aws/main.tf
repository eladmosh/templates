resource "aws_s3_bucket" "full_of_holes4" {
  bucket = "my-tg-cost-estimations-test-bucket4"
  acl    = "private"

  tags = {
    Name        = "My bucket4"
  }
}
