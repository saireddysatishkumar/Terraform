resource "aws_s3_bucket" "apple-tfstate" {
    bucket = "apple-tfstate"
}

resource "aws_dynamodb_table" "terraform-locks" {
 name = "terraform-locks"
 read_capacity= "30"
 write_capacity= "30"
 attribute {
  name = "noteId"
  type = "S"
 }
 hash_key = "noteId"
}

