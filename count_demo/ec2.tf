
resource "aws_key_pair" "mydemokey1" {
  key_name   = "mydemokey1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDSSG/ik+v13jQ0Wr8O+o9K0lenoJr4qQNpv1K73GOShhJ+i+XEsEaboWsMSFWk1iu2HHBrwyaBrmiXXAWDtwfN1CWb8ErmaZrGlF40S5cJDnouf6PyBWApIzOLRZg2q4V+K5IXkRLxaGQcVdEibegllL/9qNoG29LXN9KoS1NgfD2nOPQW/d9Ap2BCzC29hvTyTgBX3HRyj7y7dsB2ryYQMqQ2oDxeYkvCePDZpXqNmJ+BNObMjhMJhgN6wzAJweNSZ7BER33WLuQhcrJIFWXM5f1vag1AHxALoKmpy/ez3Z+wvULlMBrTCVJjLY8RLUUa5qfPy8EOZrAMfcNn/yd"

}


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



resource "aws_instance" "server" {
  count = var.instances

  ami             = "ami-0affd4508a5d2481b"
  instance_type   = "t2.micro"
  key_name        = "mydemokey"
  security_groups = ["allow_all"]

  tags = {
    Name = "Server ${count.index}"
  }


}


resource "aws_eip" "elasip" {
  count = var.instances
  vpc   = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = element(aws_instance.server.*.id, count.index)
  allocation_id = element(aws_eip.elasip.*.id, count.index)
  count         = var.instances
}

