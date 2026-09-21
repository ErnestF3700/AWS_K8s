module "vpc" {
  source = "./VPC"

  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  availability_zone  = "eu-central-1a"
}

module "security_groups" {
  source = "./SecurityGroups"

  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./EC2"

  ami            = "ami-xxxxxxxxxxxxxxxxx"
  instance_type  = "t2.medium"
  subnet_id      = module.vpc.subnet_id
  security_group = module.security_groups.security_group_id
}
## comment
