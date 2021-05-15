###
# environment resources
###

module "dev" {
    source = "./stacks/non_prod"
    environment = "dev"
    region      = "eastus"
    address_space = ["10.10.0.0/16"]
    bastion_host_address_prefix = ["10.10.100.0/24"]
    tags = var.tags    
}