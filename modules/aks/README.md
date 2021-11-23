## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_registry) | resource |
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.aks_node_pool_1](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_public_ip.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_role_assignment.acr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_subnet.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_user_assigned_identity.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [random_string.acr](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aks_node_address_prefix"></a> [aks\_node\_address\_prefix](#input\_aks\_node\_address\_prefix) | (Required) The address prefixes to use for the subnet. | `list(string)` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Version of Kubernetes specified when creating the AKS managed cluster. If not specified, the latest recommended version will be used at provisioning time (but won't auto-upgrade). | `string` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Geographic region resource will be deployed into | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | A short pre-defined text to identify the resource type | `string` | `"aks"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(any)` | `{}` | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | The name of the virtual network | `string` | n/a | yes |
| <a name="input_virtual_network_resource_group_name"></a> [virtual\_network\_resource\_group\_name](#input\_virtual\_network\_resource\_group\_name) | The name of the virtual network resource group | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | (Required) The size of the Virtual Machine, such as Standard\_DS2\_v2. | `string` | `"Standard_DS2_v2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acr_name"></a> [acr\_name](#output\_acr\_name) | n/a |
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | n/a |
| <a name="output_id"></a> [id](#output\_id) | n/a |
| <a name="output_kube_config_client_certificate"></a> [kube\_config\_client\_certificate](#output\_kube\_config\_client\_certificate) | n/a |
| <a name="output_kube_config_client_key"></a> [kube\_config\_client\_key](#output\_kube\_config\_client\_key) | n/a |
| <a name="output_kube_config_cluster_ca_certificate"></a> [kube\_config\_cluster\_ca\_certificate](#output\_kube\_config\_cluster\_ca\_certificate) | n/a |
| <a name="output_kube_config_host"></a> [kube\_config\_host](#output\_kube\_config\_host) | n/a |
| <a name="output_kube_config_password"></a> [kube\_config\_password](#output\_kube\_config\_password) | n/a |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | n/a |
| <a name="output_kube_config_username"></a> [kube\_config\_username](#output\_kube\_config\_username) | n/a |
| <a name="output_kubelet_identity_object_id"></a> [kubelet\_identity\_object\_id](#output\_kubelet\_identity\_object\_id) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
| <a name="output_node_resource_group"></a> [node\_resource\_group](#output\_node\_resource\_group) | n/a |
