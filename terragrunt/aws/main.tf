resource "aws_s3_bucket" "full_of_holes3" {
  bucket = "my-tg-cost-estimations-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket3"
  }
}
