resource "aws_acm_certificate" "python-app" {
  domain_name = var.domain.name
  validation_method = "DNS"

  tags = {
    Environment = "dev"
  }

  lifecycle {
    create_before_destroy = false
  }
}

resource "aws_route53_record" "validation" {
  for_each = {
    for k in aws_aws_acm_certificate.python-app.domain_validation_options : k.domain_name => {
        name = k.resource_record_name
        record = k.resource_record_value
        type = k.resource_record_type
    }
  } 

  zone_id = var.hosted_zone
  name = each.value.name
  type = each.value.type
  records = [ each.value.record ]
  ttl = 60
}

variable "hosted_zone" {
  
}

variable "domain_name" {
  
}