# EC2 Instances that will be created in VPC Private Subnets
module "ec2_private" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.6.0"
  ami = data.aws_ami.amzlinux2.image_id
  instance_type = var.instance_type
  user_data = file("${path.module}/app1-install.sh")
  key_name = var.instance_keypair
  #subnet_id = module.vpc.private_subnets[0] # Single Instance
  vpc_security_group_ids = [module.private_sg.security_group_id]
  
  for_each = toset(["0","1"])
  subnet_id = element(module.vpc.private_subnets, tonumber(each.key))

  tags = local.common_tags
}