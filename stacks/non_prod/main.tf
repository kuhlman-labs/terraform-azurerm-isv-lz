###
# stack resources
###

module "network_spoke" {
  source                                  = "../../modules/network_spoke"
  environment                             = var.environment
  location                                = var.location
  address_space                           = var.address_space
  virtual_network_hub_name                = var.virtual_network_hub_name
  virtual_network_hub_id                  = var.virtual_network_hub_id
  virtual_network_hub_resource_group_name = var.virtual_network_hub_resource_group_name
  tags                                    = var.tags
}

module "aks" {
  source                              = "../../modules/aks"
  environment                         = var.environment
  location                            = var.location
  aks_node_address_prefix             = var.aks_node_address_prefix
  virtual_network_name                = module.network_spoke.network_spoke_name
  virtual_network_resource_group_name = module.network_spoke.network_spoke_resource_group_name
  tags                                = var.tags
}