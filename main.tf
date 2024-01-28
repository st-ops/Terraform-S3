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

resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.my_bucket.id
  #If public_acl variable is set to true,
  #      the first set of rules apply (i.e.,rules for public access), 
  #           else rules for Private ACLs apply.
  depends_on = var.public_acl ? [ aws_s3_bucket_ownership_controls.my_oc , aws_s3_bucket_public_access_block.s3_access_block ] : [ aws_s3_bucket_ownership_controls.my_oc ]
  acl = var.public_acl ? "public-read" : "private"
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

