resource "azurerm_resource_group" "my_rg" {
  name     = "my-first-rg"
  location = var.location
}

module "app_service_rg" {
  source                  = "./modules/app_service_rg"
  app_resource_group_name = var.app_resource_group_name
  location                = var.location
}

module "app_service" {
  source              = "./modules/app_service"
  location            = var.location
  resource_group_name = module.app_service_rg.name
}

