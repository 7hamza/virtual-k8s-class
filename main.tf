terraform {
  required_version = ">= 0.12"
  required_providers {
    azurerm = ">= 2.39.0"
  }
  
}


provider "azurerm" {
  features {}
  subscription_id = var.azure-subscription-id
  client_id       = var.azure-client-id
  client_secret   = var.azure-client-secret 
  tenant_id       = var.azure-tenant-id
}


resource "azurerm_resource_group" "virtual-class" {
  name     = "virtual-class"
  location = "West Europe"
}

resource "azurerm_virtual_network" "virtual-net" {
  name                = "class-vnet"
  address_space       = ["192.168.0.0/16"]
  location            = azurerm_resource_group.virtual-class.location
  resource_group_name = azurerm_resource_group.virtual-class.name
}

resource "azurerm_subnet" "class-subnet" {
  name                 = "class-snet"
  resource_group_name  = azurerm_resource_group.virtual-class.name
  virtual_network_name = azurerm_virtual_network.virtual-net.name
  address_prefixes     = ["192.168.1.0/24"]
}