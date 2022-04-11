provider "random" {}

provider "azurerm" {
  features {}
}

terraform {

  backend "azurerm" {    
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 2.97.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "= 3.1.0"
    }
  }
}
