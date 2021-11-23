###
# module outputs
###

###
# module outputs
###

output "network_spoke_name" {
  value       = azurerm_virtual_network.network_spoke.name
  description = "resource name of network spoke"
}

output "network_spoke_id" {
  value       = azurerm_virtual_network.network_spoke.id
  description = "resource id of vnet spoke"
}

output "network_spoke_resource_group_name" {
  value       = azurerm_resource_group.networking.name
  description = "resouce group name for network spoke"
}