resource "aws_lb" "app_alb" {
  name               = "${var.project_name}-${var.environment}-app-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [data.aws_ssm_parameter.app_alb_sg_id.value]
  subnets            = split(",", data.aws_ssm_parameter.private_subnet_ids.value)

  #   enable_deletion_protection = true

  #   tags = {
  #     Environment = "production"
  #   }
}

resource "aws_lb_listener" "app_alb" {
  load_balancer_arn = aws_lb.app_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "This response from app alb"
      status_code  = "200"
    }
  }
}

module "records" {
  source    = "terraform-aws-modules/route53/aws//modules/records"
  zone_name = var.zone_name

  records = [
    {
      name = "*.dev"
      type = "A"
      alias = {
        name    = aws_lb.app_alb.dns_name
        zone_id = aws_lb.app_alb.zone_id
      }
    }
  ]
}
