output "url" {
  value = "${aws_s3_bucket.website_bucket2.bucket_domain_name}"
}
