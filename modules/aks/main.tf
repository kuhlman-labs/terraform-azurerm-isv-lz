###
# module resources
###

resource "azurerm_resource_group" "aks" {
  name     = "rg-${var.name_prefix}-${var.environment}-${var.location}"
  location = var.location
  tags     = var.tags
}

#subnet

resource "azurerm_subnet" "aks" {
  name                 = "snet-${var.name_prefix}-${var.environment}-${azurerm_resource_group.aks.location}"
  resource_group_name  = var.virtual_network_resource_group_name
  address_prefixes     = var.aks_node_address_prefix
  virtual_network_name = var.virtual_network_name
}

#ingress pip

resource "azurerm_public_ip" "aks" {
  name                = "pip-${var.name_prefix}-${var.environment}-${azurerm_resource_group.aks.location}"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_kubernetes_cluster.aks.node_resource_group
  sku                 = "Standard"
  allocation_method   = "Static"
}

#user assigned identity

resource "azurerm_user_assigned_identity" "aks" {
  resource_group_name = azurerm_resource_group.aks.name
  location            = azurerm_resource_group.aks.location
  name                = "mi-${var.name_prefix}-${var.environment}-${azurerm_resource_group.aks.location}"
}

#role assignment

resource "azurerm_role_assignment" "aks" {
  scope                = azurerm_resource_group.aks.id
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.aks.principal_id
}

#kubernetes_cluster

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.name_prefix}-${var.environment}-${azurerm_resource_group.aks.location}"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  node_resource_group = "${azurerm_resource_group.aks.name}-nodes"
  kubernetes_version  = var.kubernetes_version
  dns_prefix          = "dns-${var.name_prefix}-${var.environment}-${azurerm_resource_group.aks.location}"

  default_node_pool {
    name                         = "systempool"
    only_critical_addons_enabled = true
    vm_size                      = var.vm_size
    availability_zones           = [1, 2, 3]
    enable_auto_scaling          = true
    max_pods                     = 250
    max_count                    = 3
    min_count                    = 1
    node_count                   = 1
    vnet_subnet_id               = azurerm_subnet.aks.id
    tags                         = var.tags
  }

  identity {
    type                      = "UserAssigned"
    user_assigned_identity_id = azurerm_user_assigned_identity.aks.id
  }

  tags = var.tags
}

#kubernetes_cluster_node_pool

resource "azurerm_kubernetes_cluster_node_pool" "aks_node_pool_1" {
  name                  = "userpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.vm_size
  availability_zones    = [1, 2, 3]
  enable_auto_scaling   = true
  max_count             = 10
  max_pods              = 250
  min_count             = 1
  node_count            = 1
  mode                  = "User"
  vnet_subnet_id        = azurerm_subnet.aks.id
  tags                  = var.tags
}

#container registry

resource "random_string" "acr" {
  length      = 6
  min_numeric = 6
}

resource "azurerm_container_registry" "aks" {
  name                = lower("cr${var.name_prefix}${var.environment}${azurerm_resource_group.aks.location}${random_string.acr.result}")
  resource_group_name = azurerm_resource_group.aks.name
  location            = azurerm_resource_group.aks.location
  sku                 = "Standard"
  admin_enabled       = true
}

resource "azurerm_role_assignment" "acr" {
  scope                            = azurerm_container_registry.aks.id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_user_assigned_identity.aks.principal_id
  skip_service_principal_aad_check = true
}
