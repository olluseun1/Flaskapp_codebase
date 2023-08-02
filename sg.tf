module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.0"

  name = "public_bastion_sg"
  description = "Security group with SSH port open for everybody (IPV4 CIDR), egress ports are all world open"
  vpc_id      = module.vpc.vpc_id

  # ingress rules & CIDR block
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  # egress Rule all-all open
  egress_rule = ["all-all"]
  
}