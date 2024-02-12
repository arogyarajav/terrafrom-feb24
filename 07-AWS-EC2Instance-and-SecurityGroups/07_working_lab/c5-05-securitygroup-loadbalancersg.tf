# Security Group for Public Load Balancer
module "loadbalancer_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"
  name        = "loadbalancer-sg"
  description = "Security group with HTTP port open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id = module.vpc.vpc_id
  ingress_rules = ["http-80-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags = local.common_tags  
  #ingress_rules = ["http-80-tcp"]
  # Open to CIDRs blocks (rule or from_port+to_port+protocol+description)
  /*ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = 6
      description = "http custom port name"
      cidr_blocks = "0.0.0.0/0"
    },
]
*/

}