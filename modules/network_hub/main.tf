###
# module resources
###

resource "azurerm_resource_group" "networking" {
  name     = "rg-${var.name_prefix}-${var.environment}-${var.location}"
  location = var.location
  tags     = var.tags
}

#network

resource "azurerm_virtual_network" "network_hub" {
  name                = "${var.name_prefix}-${var.environment}-${azurerm_resource_group.networking.location}"
  location            = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name
  address_space       = var.address_space
  tags                = var.tags
}

#bastion host

resource "azurerm_subnet" "bastion_host" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.networking.name
  virtual_network_name = azurerm_virtual_network.network_hub.name
  address_prefixes     = var.bastion_host_address_prefix
}

resource "azurerm_public_ip" "bastion_host" {
  name                = "ip-bh-${var.environment}-${azurerm_resource_group.networking.location}"
  location            = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "bastion_host" {
  name                = "bh-${var.environment}-${azurerm_resource_group.networking.location}"
  location            = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name

  ip_configuration {
    name                 = "bastion-host-ip-config"
    subnet_id            = azurerm_subnet.bastion_host.id
    public_ip_address_id = azurerm_public_ip.bastion_host.id
  }
}