provider "aws" {
  region     = var.region-name
  access_key = var.access-key
  secret_key = var.secret-key
}

resource "aws_instance" "myec2" {
   ami = "ami-0affd4508a5d2481b"
   instance_type = var.instance-type
}
