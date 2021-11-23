###
# stack resources
###

module "network_hub" {
  source                      = "../../modules/network_hub"
  environment                 = var.environment
  location                    = var.location
  address_space               = var.address_space
  bastion_host_address_prefix = var.bastion_host_address_prefix
  tags                        = var.tags
}