output "bucket_id" {
    value = aws_s3_bucket.my_bucket.id
    description = "Name of the created S3 bucket"
}

output "bucket_arn" {
  value = aws_s3_bucket.my_bucket.arn
  description = "The unique Amazon Resource Name (ARN) of the bucket"
}