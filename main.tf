resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

}

resource "aws_s3_bucket_versioning" "version" {
  count = var.versioning ? 1:0
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_ownership_controls" "my_oc" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "private_acl" {
  count = var.public_acl ? 0:1

  bucket = aws_s3_bucket.my_bucket.id

  depends_on = [ aws_s3_bucket_ownership_controls.my_oc ]

  acl = "private"
}

resource "aws_s3_bucket_public_access_block" "s3_access_block" {
  #Only executes if user inputs true, else count becomes zero.
  count = var.public_acl ? 1:0

  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls = false
  block_public_policy = false
  restrict_public_buckets = false
  ignore_public_acls = false
}

resource "aws_s3_bucket_acl" "public_acl" {
   count = var.public_acl ? 1:0

  bucket = aws_s3_bucket.my_bucket.id

  depends_on = [ aws_s3_bucket_ownership_controls.my_oc , aws_s3_bucket_public_access_block.s3_access_block ]

  acl = "public-read"
}