provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg01" {
  name     = "rg01"
  location = "Australia East"
}
