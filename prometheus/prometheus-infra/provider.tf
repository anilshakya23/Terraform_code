terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "51a6ae71-472e-4922-8df6-0a01fa72534d"
}