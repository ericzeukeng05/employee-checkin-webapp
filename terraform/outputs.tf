output "deployment_info" {
  description = "Deployment information"
  value = {
    bucket_name           = aws_s3_bucket.website.id
    s3_website_url       = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
    cloudfront_url       = "https://${aws_cloudfront_distribution.website.domain_name}"
    region               = var.aws_region
    environment          = var.environment
  }
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.website.id
}

output "website_urls" {
  description = "Website URLs"
  value = {
    s3_direct    = "http://${aws_s3_bucket_website_configuration.website.website_endpoint}"
    cloudfront   = "https://${aws_cloudfront_distribution.website.domain_name}"
  }
}