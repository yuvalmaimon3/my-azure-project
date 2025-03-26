provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
resource "azurerm_resource_group" "rg" {
  name     = "yuval-rg"
  location = "East US"
}

resource "azurerm_resource_group_template_deployment" "arm_deploy" {
  name                = "storage-deployment"
  resource_group_name = azurerm_resource_group.rg.name
  template_content    = file("/home/yuval/my-azure-project/arm-templates/storage-template.json")

  deployment_mode = "Incremental"
}
