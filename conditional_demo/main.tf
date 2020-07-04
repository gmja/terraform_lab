resource "aws_instance" "dev" {
   ami = "ami-0affd4508a5d2481b"
   instance_type = "t2.micro"
   count = var.istest == true ? 3 : 0
}

resource "aws_instance" "prod" {
   ami = "ami-0affd4508a5d2481b"
   instance_type = "t2.large"
   count = var.istest == false ? 1 : 0
}
