# Create a bucket for user data

resource "aws_s3_bucket" "user-bucket-1" {
  bucket = "userdatabucket4321"
 }

resource "aws_s3_bucket_versioning" "bucket-versioning-1" {
  bucket = aws_s3_bucket.user-bucket-1.id
  versioning_configuration {
    status = "Enabled"
  }
}

 resource "aws_s3_bucket_server_side_encryption_configuration" "bucket-encryption-1" {
  bucket = aws_s3_bucket.user-bucket-1.id

  rule {
    apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
    }
  }
}