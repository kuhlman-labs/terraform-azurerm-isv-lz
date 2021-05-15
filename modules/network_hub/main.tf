###
# module resources
###

module "naming" {
  source  = "../azurerm_naming"
  suffix  = [var.environment, var.region]
}

resource "azurerm_resource_group" "base" {
  name     = module.naming.resource_group.name
  location = var.region
  tags     = var.tags
}

resource "azurerm_virtual_network" "base" {
  name                = module.naming.virtual_network.name
  location            = azurerm_resource_group.base.location
  resource_group_name = azurerm_resource_group.base.name
  address_space       = var.address_space
  tags = var.tags
}

resource "azurerm_subnet" "bastion_host" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  address_prefixes     = var.bastion_host_address_prefix
}

resource "azurerm_public_ip" "bastion_host" {
  name                = module.naming.public_ip.name
  location            = azurerm_resource_group.base.location
  resource_group_name = azurerm_resource_group.base.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "base" {
  name                = module.naming.bastion_host.name
  location            = azurerm_resource_group.base.location
  resource_group_name = azurerm_resource_group.base.name

  ip_configuration {
    name                 = "bastion-host-ip-config"
    subnet_id            = azurerm_subnet.bastion_host.id
    public_ip_address_id = azurerm_public_ip.bastion_host.id
  }
}