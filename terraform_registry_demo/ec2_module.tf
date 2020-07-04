module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = 1

  ami                    = "ami-0affd4508a5d2481b"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-6b066026"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


###    https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/2.15.0    ######
