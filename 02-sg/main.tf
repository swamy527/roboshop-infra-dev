module "mongodb" {
  source       = "../../SG-Module"
  project_name = var.project_name
  sg_name      = "mongodb"
  environment  = var.environment
  vpc_id       = data.aws_ssm_parameter.vpc_id.value
  description  = "sg for mongodb"
  #   sg_ingress_rules = var.mongodb_sg_ingress_rules
}



module "redis" {
  source       = "../../SG-Module"
  project_name = var.project_name
  sg_name      = "redis"
  environment  = var.environment
  vpc_id       = data.aws_ssm_parameter.vpc_id.value
  description  = "sg for redis"
  #   sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "mysql" {
  source       = "../../SG-Module"
  project_name = var.project_name
  sg_name      = "mysql"
  environment  = var.environment
  vpc_id       = data.aws_ssm_parameter.vpc_id.value
  description  = "sg for mysql"
  #   sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "rabbitmq" {
  source       = "../../SG-Module"
  project_name = var.project_name
  sg_name      = "rabbitmq"
  environment  = var.environment
  vpc_id       = data.aws_ssm_parameter.vpc_id.value
  description  = "sg for rabbitmq"
  #   sg_ingress_rules = var.mongodb_sg_ingress_rules
}



module "app_alb" {
  source       = "../../SG-Module"
  project_name = var.project_name
  sg_name      = "app-alb"
  environment  = var.environment
  vpc_id       = data.aws_ssm_parameter.vpc_id.value
  description  = "sg for app-alb"
  #   sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "openvpn" {
  source       = "../../SG-Module"
  project_name = var.project_name
  sg_name      = "openvpn"
  environment  = var.environment
  vpc_id       = data.aws_vpc.default.id
  description  = "sg for openvpn"
  #   sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "catalogue" {
  source       = "../../SG-Module"
  project_name = var.project_name
  sg_name      = "catalogue"
  environment  = var.environment
  vpc_id       = data.aws_ssm_parameter.vpc_id.value
  description  = "sg for catalogue"
  #   sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "web_alb" {
  source       = "../../SG-Module"
  project_name = var.project_name
  sg_name      = "web_alb"
  environment  = var.environment
  vpc_id       = data.aws_ssm_parameter.vpc_id.value
  description  = "sg for web_alb"
  #   sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "web" {
  source       = "../../SG-Module"
  project_name = var.project_name
  sg_name      = "web"
  environment  = var.environment
  vpc_id       = data.aws_ssm_parameter.vpc_id.value
  description  = "sg for web"
  #   sg_ingress_rules = var.mongodb_sg_ingress_rules
}

module "user" {
  source       = "../../SG-Module"
  project_name = var.project_name
  sg_name      = "user"
  environment  = var.environment
  vpc_id       = data.aws_ssm_parameter.vpc_id.value
  description  = "sg for user"
  #   sg_ingress_rules = var.mongodb_sg_ingress_rules
}

resource "aws_security_group_rule" "user-openvpn" {
  source_security_group_id = module.openvpn.secg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.user.secg_id

}

resource "aws_security_group_rule" "user-app_alb" {
  source_security_group_id = module.app_alb.secg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.user.secg_id

}

resource "aws_security_group_rule" "web_alb-inernet" {
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = module.web_alb.secg_id

}

resource "aws_security_group_rule" "web-web_alb" {
  source_security_group_id = module.web_alb.secg_id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.web.secg_id

}

resource "aws_security_group_rule" "web-openvpn" {
  source_security_group_id = module.openvpn.secg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.web.secg_id

}

resource "aws_security_group_rule" "catalogue-openvpn" {
  source_security_group_id = module.openvpn.secg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.catalogue.secg_id

}

resource "aws_security_group_rule" "catalogue-app_alb" {
  source_security_group_id = module.app_alb.secg_id
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.catalogue.secg_id

}



resource "aws_security_group_rule" "mongodb-openvpn" {
  source_security_group_id = module.openvpn.secg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.mongodb.secg_id

}

resource "aws_security_group_rule" "mongodb-catalogue" {
  source_security_group_id = module.catalogue.secg_id
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  security_group_id        = module.mongodb.secg_id

}

resource "aws_security_group_rule" "mongodb-user" {
  source_security_group_id = module.user.secg_id
  type                     = "ingress"
  from_port                = 27017
  to_port                  = 27017
  protocol                 = "tcp"
  security_group_id        = module.mongodb.secg_id

}

resource "aws_security_group_rule" "redis-openvpn" {
  source_security_group_id = module.openvpn.secg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.redis.secg_id

}

resource "aws_security_group_rule" "mysql-openvpn" {
  source_security_group_id = module.openvpn.secg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.mysql.secg_id

}

resource "aws_security_group_rule" "rabbitmq-openvpn" {
  source_security_group_id = module.openvpn.secg_id
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = module.rabbitmq.secg_id

}

resource "aws_security_group_rule" "openvpn-home" {
  cidr_blocks       = ["27.7.50.120/32"]
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = module.openvpn.secg_id

}

resource "aws_security_group_rule" "app_alb-openvpn" {
  source_security_group_id = module.openvpn.secg_id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.app_alb.secg_id

}

resource "aws_security_group_rule" "app_alb-web" {
  source_security_group_id = module.web.secg_id
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = module.app_alb.secg_id

}


