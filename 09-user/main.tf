module "user" {
  source          = "../../roboshop-infra-dev-copy/project-module"
  instance_type   = "t2.micro"
  tags            = var.tags
  component_sg_id = data.aws_ssm_parameter.user_sg_id.value

}
