provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAUC2RANLCK2DXYFVZ"
  secret_key = "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"
}

resource "aws_eip" "lb" {
  vpc      = true
}

output "eip" {
  value = aws_eip.lb
}

resource "aws_s3_bucket" "mys3" {
  bucket = "demotestbucket7138"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3
}
