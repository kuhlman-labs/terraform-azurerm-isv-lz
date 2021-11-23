## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.networking](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_virtual_network.network_spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [azurerm_virtual_network_peering.hub_to_spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.spoke-to-hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | This is a list of the ip address ranges for the vnet | `list(any)` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Development environment for resource; prod, non-prod, shared-services, poc | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Geographic region resource will be deployed into | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | A short pre-defined text to identify the resource type | `string` | `"vnet-spoke"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(any)` | `{}` | no |
| <a name="input_virtual_network_hub_id"></a> [virtual\_network\_hub\_id](#input\_virtual\_network\_hub\_id) | The id of the hub virtual network | `string` | n/a | yes |
| <a name="input_virtual_network_hub_name"></a> [virtual\_network\_hub\_name](#input\_virtual\_network\_hub\_name) | The name of the hub virtual network | `string` | n/a | yes |
| <a name="input_virtual_network_hub_resource_group_name"></a> [virtual\_network\_hub\_resource\_group\_name](#input\_virtual\_network\_hub\_resource\_group\_name) | The name of the hub virtual network resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_spoke_id"></a> [network\_spoke\_id](#output\_network\_spoke\_id) | resource id of vnet spoke |
| <a name="output_network_spoke_name"></a> [network\_spoke\_name](#output\_network\_spoke\_name) | resource name of network spoke |
| <a name="output_network_spoke_resource_group_name"></a> [network\_spoke\_resource\_group\_name](#output\_network\_spoke\_resource\_group\_name) | resouce group name for network spoke |
