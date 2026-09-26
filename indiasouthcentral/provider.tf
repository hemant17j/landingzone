terraform {
  required_version = ">= 1.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id                   = "3aee3430-ef4c-4171-b904-ec2dd5416a82"
  resource_provider_registrations = "none"
}
