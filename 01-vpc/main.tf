module "mymodule" {
  source               = "git::https://github.com/swamy527/vpc2-module.git?ref=main"
  project_name         = var.project_name
  environment          = var.environment
  public_subnet_cidr   = ["10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidr  = ["10.0.12.0/24", "10.0.13.0/24"]
  database_subnet_cidr = ["10.0.22.0/24", "10.0.23.0/24"]
  is_peering_required  = var.is_peering_required
}
