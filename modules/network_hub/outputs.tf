###
# module outputs
###

output "network_hub_name" {
  value       = azurerm_virtual_network.network_hub.name
  description = "resource name of network hub"
}

output "network_hub_id" {
  value       = azurerm_virtual_network.network_hub.id
  description = "resource id of vnet hub"
}

output "network_hub_resource_group_name" {
  value       = azurerm_resource_group.networking.name
  description = "resouce group name for network hub"
}