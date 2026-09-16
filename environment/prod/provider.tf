terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "5.5.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Backend_resource_group"
    storage_account_name = "preprodbackstrgaccnt1"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}