resource "aws_ssm_parameter" "app_alb_arn" {
  name  = "/${var.project_name}/${var.environment}/app_alb_arn"
  type  = "String"
  value = aws_lb_listener.app_alb.arn
}
