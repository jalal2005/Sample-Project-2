# Create s3 bucket terraform state
resource "aws_s3_bucket" "tf-state-bucket" {
  bucket = "tfstatebucket4321"
 }

resource "aws_s3_bucket_versioning" "bucket-versioning" {
  bucket = aws_s3_bucket.tf-state-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

 resource "aws_s3_bucket_server_side_encryption_configuration" "bucket-encryption" {
  bucket = aws_s3_bucket.tf-state-bucket.id

  rule {
    apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
    }
  }
}

# Create dynamodb table (To enable state locking to avoid corruption of the state file)

resource "aws_dynamodb_table" "statelock" {
    name = "state-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    }
  
}
