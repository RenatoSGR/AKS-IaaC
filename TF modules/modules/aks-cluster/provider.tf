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
    key                  = "D90foS4/PteF8W5g16P5i8e1fBZEVQNBfCYV9TGM3+Q8ZVEWLtYQ2Ss2RgONBLdRxGTRqS9sFxXv+ASt2cRglw=="
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