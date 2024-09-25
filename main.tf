provider "azurerm" {
  features {}

  subscription_id = var.subscription_id  # Reference to a variable for subscription ID
}

resource "azurerm_resource_group" "rg01" {
  name     = "rg01"
  location = "Australia East"
}
