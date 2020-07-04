resource "aws_instance" "myec2" {
  ami           = "ami-0affd4508a5d2481b"
  instance_type = "t2.micro"
}


