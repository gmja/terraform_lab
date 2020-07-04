terraform {
 backend "s3" {
 encrypt = true
 bucket = "terraform-remote-state-storage-s3-demo"
 region = "us-east-1"
 dynamodb_table = "terraform-state-lock-dynamo"
 key = "myproject/terraform.tfstate"
 }
}

