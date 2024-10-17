resource "aws_ssm_parameter" "vpcid" {
  name  = "/${var.project_name}/${var.environment}/vpc_id"
  type  = "String"
  value = module.mymodule.vpcid
}


resource "aws_ssm_parameter" "database_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/database_subnet_ids"
  type  = "StringList"
  value = join(",", module.mymodule.database_subnet)
}


resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/public_subnet_ids"
  type  = "StringList"
  value = join(",", module.mymodule.public_subnet)
}


resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/${var.project_name}/${var.environment}/private_subnet_ids"
  type  = "StringList"
  value = join(",", module.mymodule.private_subnet)
}

