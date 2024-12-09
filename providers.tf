terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  #resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
  subscription_id = "87948765-5c07-4a92-819f-251defd8eefd"
}
data "azurerm_resource_group" "be_resource_group_name" {
  name = "rsg-shared-001"
}
 
data "azurerm_storage_account" "be_storage_account" {
  name                = "myonetfstatesa001"
  resource_group_name = data.azurerm_resource_group.be_resource_group_name.name
}
 
data "azurerm_storage_container" "be_storage_container" {
  name                 = "my-tf-state-blob-001"
  storage_account_name = data.azurerm_storage_account.be_storage_account.name
}
 
terraform {
  backend "azurerm" {
    resource_group_name  = "rsg-shared-001"
    storage_account_name = "myonetfstatesa001"
    container_name       = "my-tf-state-blob-001"
    key                  = "terraform.tfstate"
  }
}