###
# stack outputs
###

output "network_hub_name" {
  value       = module.network_hub.network_hub_name
  description = "resource name of network hub"
}

output "network_hub_id" {
  value       = module.network_hub.network_hub_id
  description = "resource id of vnet hub"
}

output "network_hub_resource_group_name" {
  value       = module.network_hub.network_hub_resource_group_name
  description = "resouce group name for network hub"
}