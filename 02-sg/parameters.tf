resource "aws_ssm_parameter" "mongodb_sg_id" {
  name  = "/${var.project_name}/${var.environment}/mongo_sg_id"
  type  = "String"
  value = module.mongodb.secg_id
}


resource "aws_ssm_parameter" "redis_sg_id" {
  name  = "/${var.project_name}/${var.environment}/redis_sg_id"
  type  = "String"
  value = module.redis.secg_id
}

resource "aws_ssm_parameter" "mysql_sg_id" {
  name  = "/${var.project_name}/${var.environment}/mysql_sg_id"
  type  = "String"
  value = module.mysql.secg_id
}

resource "aws_ssm_parameter" "rabbitmq_sg_id" {
  name  = "/${var.project_name}/${var.environment}/rabbitmq_sg_id"
  type  = "String"
  value = module.rabbitmq.secg_id
}

resource "aws_ssm_parameter" "app_alb_sg_id" {
  name  = "/${var.project_name}/${var.environment}/app_alb_sg_id"
  type  = "String"
  value = module.app_alb.secg_id
}

resource "aws_ssm_parameter" "openvpn_sg_id" {
  name  = "/${var.project_name}/${var.environment}/openvpn_sg_id"
  type  = "String"
  value = module.openvpn.secg_id
}

resource "aws_ssm_parameter" "catalogue_sg_id" {
  name  = "/${var.project_name}/${var.environment}/catalogue_sg_id"
  type  = "String"
  value = module.catalogue.secg_id
}

resource "aws_ssm_parameter" "web_sg_id" {
  name  = "/${var.project_name}/${var.environment}/web_sg_id"
  type  = "String"
  value = module.web.secg_id
}

resource "aws_ssm_parameter" "web_alb_sg_id" {
  name  = "/${var.project_name}/${var.environment}/web_alb_sg_id"
  type  = "String"
  value = module.web_alb.secg_id
}

resource "aws_ssm_parameter" "user_sg_id" {
  name  = "/${var.project_name}/${var.environment}/user_sg_id"
  type  = "String"
  value = module.user.secg_id
}
