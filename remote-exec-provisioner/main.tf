
resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all traffic"

  ingress {
    description = "Allow all traffic"
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "demo_allow_all"
  }
}

resource "aws_instance" "myec2" {
   ami = "ami-0affd4508a5d2481b"
   instance_type = "t2.micro"
   key_name = "mydemokey"
   security_groups = ["allow_all"]



  provisioner "remote-exec" {
     inline = [
       "sudo yum install httpd -y",
       "sudo systemctl start httpd",
       "sudo systemctl enable httpd"
     ]

   connection {
     type = "ssh"
     user = "centos"
     private_key = file("./mydemokey.pem")
     host = self.public_ip
   }
   }
}
