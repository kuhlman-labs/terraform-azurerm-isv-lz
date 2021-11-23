###
# environment resources
###

module "dev_shared_services" {
  source                      = "./stacks/shared_services"
  environment                 = "dev"
  location                    = "eastus"
  address_space               = ["10.10.0.0/16"]
  bastion_host_address_prefix = ["10.10.100.0/24"]
  tags                        = var.tags
}

module "dev_environment" {
  source                                  = "./stacks/non_prod"
  environment                             = "dev"
  location                                = "eastus"
  address_space                           = ["10.20.0.0/16"]
  aks_node_address_prefix                 = ["10.20.100.0/24"]
  virtual_network_hub_id                  = module.dev_shared_services.network_hub_id
  virtual_network_hub_name                = module.dev_shared_services.network_hub_name
  virtual_network_hub_resource_group_name = module.dev_shared_services.network_hub_resource_group_name
  tags                                    = var.tags
}