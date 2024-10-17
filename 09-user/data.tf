data "aws_ssm_parameter" "user_sg_id" {
  name = "/${var.project_name}/${var.environment}/user_sg_id"
}
