# Security Group for AWS RDS DB
module "rdsdb_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  name = "rdsdb_sg"
  description = "Access to MySQL DB for entire VPC CIDR Block"
  vpc_id = module.vpc.vpc_id
  egress_rules = ["all-all"]
#ingress

ingress_with_cidr_blocks = [
    {
      rule        = "mysql-tcp"
      cidr_blocks = module.vpc.vpc_cidr_block
    },
]
  tags = local.common_tags
}