resource "aws_instance" "myec2" {
  ami = "ami-09d95fab7fff3776c"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0cef2062cffac808e"]
  key_name = "mydemokey"
  subnet_id = "subnet-cc041ef2"

  tags {
    Name = "myec2"
  }
}
