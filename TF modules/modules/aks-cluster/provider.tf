terraform {
  required_version = ">= 0.13"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
  #https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage?tabs=azure-cli
  /*backend "azurerm" {
    resource_group_name  = "tf-state"
    storage_account_name = "tfstateslb"
    container_name       = "tfstate-slbtf"
    key                  = ""
  }*/
}

#create provider and login to azure account
provider "azurerm" {
  subscription_id = ""
  client_id       = ""
  client_secret   = ""
  tenant_id       = ""

  features {
  resource_group {
       prevent_deletion_if_contains_resources = false

  }
}
}