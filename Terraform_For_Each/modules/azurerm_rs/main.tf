terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "cba3453a-ff1f-4f51-b6f6-5a1149843776"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-anil"
  location = "West Europe"
  tags = {
    environments = "dev"
    subscription = "Azure_subscription_1"
    owner        = "Anil"
  }
}
