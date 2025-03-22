provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "yuval-rg"
  location = "East US"
}

resource "azurerm_resource_group_template_deployment" "storage" {
  name                = "storage-deployment"
  resource_group_name = azurerm_resource_group.rg.name
  deployment_mode     = "Incremental"

  template_content = file("storage-template.json")

  parameters_content = jsonencode({
    storageAccountName1 = { value = "220325storageaccount1" }
    storageAccountName2 = { value = "220325storageaccount2" }
  })
}

