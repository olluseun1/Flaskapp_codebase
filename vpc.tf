# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

#VPC Basic Details

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
 
# Database Subnets
  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
#   create_database_internet_gateway_route = true
#   create_database_nat_gateway_route = true
database_subnets  = ["10.0.151.0/24", "10.0.152.0/24"]

# NAT Gateway for outbound communication
 enable_nat_gateway = true
  single_nat_gateway = true

# VPC DNS Parameters
enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    type = "public_subnets"
  }

   private_subnet_tags = {
    type = "private_subnets"
  }

  database_subnet_tags = {
    type = "database_subnets"
  }

tags = {
    owner = "Olu"
    Environment = "dev"
}

vpc_tags = {
    Name = "vpc-dev"
}
}