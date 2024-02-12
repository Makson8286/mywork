provider "aws" {
 region = "us-east-1"
 access_key = ""
 secret_key = ""
}

resource "aws_s3_bucket" "tf_state_bucket" {
  bucket = "omanige"
  aws s3 cp /home/dik/iam s3://omanige/
}
