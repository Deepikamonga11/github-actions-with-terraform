resource "azurerm_resource_group" "my_app_rg" {
  name     = var.app_resource_group_name
  location = var.location
}
