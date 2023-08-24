resource "aws_s3_bucket" "apple-tfstate" {
    bucket = "apple-tfstate"
}

resource "aws_dynamodb_table" "terraform-locks" {
 name = "terraform-locks"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}

