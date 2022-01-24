terraform {
  required_version = ">= 0.13, < 2.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.42"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }


  #  backend "azurerm" {
  #    resource_group_name  = ""
  #    storage_account_name = ""
  #    container_name       = "tfstate"
  #    key                  = "prod.terraform.tfstate"
  #  }

}

provider "azurerm" {
  features {}


}
