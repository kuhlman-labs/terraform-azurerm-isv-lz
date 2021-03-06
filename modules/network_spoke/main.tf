###
# module resources
###

resource "azurerm_resource_group" "networking" {
  name     = "rg-${var.name_prefix}-${var.environment}-${var.location}"
  location = var.location
  tags     = var.tags
}

#vnet

resource "azurerm_virtual_network" "network_spoke" {
  name                = "${var.name_prefix}-${var.environment}-${azurerm_resource_group.networking.location}"
  location            = azurerm_resource_group.networking.location
  resource_group_name = azurerm_resource_group.networking.name
  address_space       = var.address_space
  tags                = var.tags
}

resource "azurerm_virtual_network_peering" "spoke-to-hub" {
  name                      = "${azurerm_virtual_network.network_spoke.name}-to-${var.virtual_network_hub_name}"
  resource_group_name       = azurerm_resource_group.networking.name
  virtual_network_name      = azurerm_virtual_network.network_spoke.name
  remote_virtual_network_id = var.virtual_network_hub_id
}

resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                      = "${var.virtual_network_hub_name}-to-${azurerm_virtual_network.network_spoke.name}"
  resource_group_name       = var.virtual_network_hub_resource_group_name
  virtual_network_name      = var.virtual_network_hub_name
  remote_virtual_network_id = azurerm_virtual_network.network_spoke.id
}