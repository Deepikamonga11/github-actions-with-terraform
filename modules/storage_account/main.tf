resource "azurerm_resource_group" "rg2" {
  name     = "storing-resources"
  location = var.location
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "testterraform112233"
  resource_group_name      = azurerm_resource_group.rg2.name
  location                 = azurerm_resource_group.rg2.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}