data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
}

data "aws_ami" "centos8" {
  most_recent = true
  owners      = ["973714476881"]

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }
}

data "aws_ssm_parameter" "web_sg_id" {
  name = "/${var.project_name}/${var.environment}/web_sg_id"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "/${var.project_name}/${var.environment}/private_subnet_ids"
}

data "aws_ssm_parameter" "web_alb_arn" {
  name = "/${var.project_name}/${var.environment}/web_alb_arn"
}
