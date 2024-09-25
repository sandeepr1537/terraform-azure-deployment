terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
}

provider "azurerm" {
  features {}

  # Use environment variables for authentication
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
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
