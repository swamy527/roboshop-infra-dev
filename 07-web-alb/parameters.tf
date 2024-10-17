resource "aws_ssm_parameter" "web_alb_arn" {
  name  = "/${var.project_name}/${var.environment}/web_alb_arn"
  type  = "String"
  value = aws_lb_listener.web_alb.arn
}
