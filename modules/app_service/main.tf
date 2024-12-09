resource "azurerm_app_service_plan" "my_app_service_plan" {
  name                = "my-appserviceplan-plan"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "my_app_service" {
  name                = "my-app-service"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.my_app_service_plan.id

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }

  #   connection_string {
  #     name  = "Database"
  #     type  = "SQLServer"
  #     value = "Server=some-server.mydomain.com;Integrated Security=SSPI"
  #   }
}
