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
| [azurerm_bastion_host.bastion_host](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |
| [azurerm_public_ip.bastion_host](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.networking](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.bastion_host](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.network_hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | This is a list of the ip address ranges for the vnet | `list(any)` | n/a | yes |
| <a name="input_bastion_host_address_prefix"></a> [bastion\_host\_address\_prefix](#input\_bastion\_host\_address\_prefix) | The address prefix to use for the bastion subnet. | `list(any)` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Development environment for resource; prod, non-prod, shared-services | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Geographic region resource will be deployed into | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | A short pre-defined text to identify the resource type | `string` | `"vnet-hub"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_hub_id"></a> [network\_hub\_id](#output\_network\_hub\_id) | resource id of vnet hub |
| <a name="output_network_hub_name"></a> [network\_hub\_name](#output\_network\_hub\_name) | resource name of network hub |
| <a name="output_network_hub_resource_group_name"></a> [network\_hub\_resource\_group\_name](#output\_network\_hub\_resource\_group\_name) | resouce group name for network hub |
