resource "aws_instance" "myec2" {
   ami = "ami-0affd4508a5d2481b"
   instance_type = "t2.micro"

   provisioner "local-exec" {
    command = "echo ${aws_instance.myec2.private_ip} >> private_ips.txt"
  }
}
