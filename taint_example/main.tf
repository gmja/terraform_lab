
resource "aws_instance" "myec2" {
   ami = "ami-0affd4508a5d2481b"
   instance_type = "t2.micro"

}

## Here we are going to create this resource and taint it, we will observe that after it has been tainted , this resource will be created again
## Though it has already been created 


