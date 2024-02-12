provider "aws" {
 region = "your-region"
 access_key = ""
 secret_key = ""
}

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "your-name"
  aws s3 cp /your/path/iam s3://your-name/
}
