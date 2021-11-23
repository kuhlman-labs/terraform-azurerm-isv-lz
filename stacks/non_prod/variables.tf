###
# stack inputs
###

#common

variable "environment" {
  description = "Development environment for resource; prod, non-prod, shared-services"
  type        = string
}

variable "location" {
  description = "Geographic region resource will be deployed into"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}

#network

variable "address_space" {
  description = "This is a list of the ip address ranges for the vnet"
  type        = list(any)
}

variable "aks_node_address_prefix" {
  description = "The address prefix to use for the bastion subnet."
  type        = list(any)
}

variable "virtual_network_hub_name" {
  description = "The name of the hub virtual network"
  type        = string
}

variable "virtual_network_hub_resource_group_name" {
  description = "The name of the hub virtual network resource group"
  type        = string
}

variable "virtual_network_hub_id" {
  description = "The id of the hub virtual network"
  type        = string
}