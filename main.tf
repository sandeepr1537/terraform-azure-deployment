provider "azurerm" {
  features {}

  # Add subscription ID
  subscription_id = var.subscription_id
}


# Include the resource group module
module "resource_group" {
  source = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

# Include the storage account module
module "storage_account" {
  source = "./modules/storage_account"
  storage_account_name = var.storage_account_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}
