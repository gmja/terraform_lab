provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAUC2RANLCK2DXYFVZ"
  secret_key = "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"
}


resource "aws_instance" "myec2" {
   ami = "ami-0affd4508a5d2481b"
   instance_type = "t2.micro"
}


resource "aws_eip" "lb" {
  vpc      = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.lb.id
}


resource "aws_security_group" "allow_tls" {
  name        = "demo-test-security-group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]

#    cidr_blocks = [aws_eip.lb.public_ip/32]
  }
}
