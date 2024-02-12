resource "aws_route53_record" "apps_dns" {
  zone_id = data.aws_route53_zone.mydomain.zone_id
  name    = "apps.cdots-learning.com"
  type    = "A"
  #ttl     = 300
alias {
    #name                   = module.alb.this_lb_dns_name
    #zone_id                = module.alb.this_lb_zone_id
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }  
}

## App1 DNS
resource "aws_route53_record" "app1_dns" {
  zone_id = data.aws_route53_zone.mydomain.zone_id 
  name    = var.app1_dns_name
  type    = "A"
  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }  
}


## App2 DNS
resource "aws_route53_record" "app2_dns" {
  zone_id = data.aws_route53_zone.mydomain.zone_id 
  name    = var.app2_dns_name
  type    = "A"
  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }  
}

## App2 DNS
resource "aws_route53_record" "app3_dns" {
  zone_id = data.aws_route53_zone.mydomain.zone_id 
  name    = var.app3_dns_name
  type    = "A"
  alias {
    name                   = module.alb.dns_name
    zone_id                = module.alb.zone_id
    evaluate_target_health = true
  }  
}