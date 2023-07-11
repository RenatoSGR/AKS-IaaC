<!-- BEGIN_TF_DOCS -->

## AKS and Integrations modules for IaaC - Terraform

## Requirements for Running the AKS Module

Provider requirements:
| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.0 |

## Provider azurerm version used in this module

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.53.0 |

## Modules

AKS module for creating AKS cluster and node pools

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.aks-cluster](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_kubernetes_cluster_node_pool.additional_node_pools](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |
| [azurerm_private_dns_zone_virtual_network_link.aks_to_hub_link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |
| [azurerm_resource_group.my-rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acr_pull_role_definition_name"></a> [acr\_pull\_role\_definition\_name](#input\_acr\_pull\_role\_definition\_name) | The name of the role definition | `string` | `"AcrPull"` | no |
| <a name="input_additional_node_pool_vm_size"></a> [additional\_node\_pool\_vm\_size](#input\_additional\_node\_pool\_vm\_size) | The VM size for the additional node pool | `string` | `"Standard_DS3_v2"` | no |
| <a name="input_additional_node_pool_zones"></a> [additional\_node\_pool\_zones](#input\_additional\_node\_pool\_zones) | The zones for the additional node pool | `list` | <pre>[<br>  "1",<br>  "2"<br>]</pre> | no |
| <a name="input_aks-subnet_name"></a> [aks-subnet\_name](#input\_aks-subnet\_name) | n/a | `string` | `"aks-subnet"` | no |
| <a name="input_aks-subnet_prefix"></a> [aks-subnet\_prefix](#input\_aks-subnet\_prefix) | n/a | `string` | `"11.0.1.0/24"` | no |
| <a name="input_aks-vnet_address_space"></a> [aks-vnet\_address\_space](#input\_aks-vnet\_address\_space) | n/a | `list(string)` | <pre>[<br>  "11.0.0.1/23"<br>]</pre> | no |
| <a name="input_aks-vnet_name"></a> [aks-vnet\_name](#input\_aks-vnet\_name) | variables for vnet module | `string` | `"aks-vnet"` | no |
| <a name="input_aks_cluster_name"></a> [aks\_cluster\_name](#input\_aks\_cluster\_name) | The name of the AKS cluster | `string` | `"aks-slb-dev"` | no |
| <a name="input_aks_kubernetes_version"></a> [aks\_kubernetes\_version](#input\_aks\_kubernetes\_version) | The version of Kubernetes to use for the AKS cluster | `string` | `"1.25.6"` | no |
| <a name="input_aks_location"></a> [aks\_location](#input\_aks\_location) | The location of the AKS cluster | `string` | `"westeurope"` | no |
| <a name="input_aks_resource_group"></a> [aks\_resource\_group](#input\_aks\_resource\_group) | The name of the resource group for the AKS cluster | `string` | `"rg-aks-slb"` | no |
| <a name="input_default_node_pool_vm_size"></a> [default\_node\_pool\_vm\_size](#input\_default\_node\_pool\_vm\_size) | The VM size for the default node pool | `string` | `"Standard_DS3_v2"` | no |
| <a name="input_default_node_pool_zones"></a> [default\_node\_pool\_zones](#input\_default\_node\_pool\_zones) | The zones for the default node pool | `list` | <pre>[<br>  "1",<br>  "2"<br>]</pre> | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group | `string` | `"rg-aks-slb"` | no |
| <a name="input_rg-location"></a> [rg-location](#input\_rg-location) | The location of the resource group | `string` | `"westeurope"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | <pre>{<br>  "environment": "dev"<br>}</pre> | no |
| <a name="input_virtual_network_links"></a> [virtual\_network\_links](#input\_virtual\_network\_links) | n/a | <pre>list(object({<br>    name                 = string<br>    virtual_network_id   = string<br>  }))</pre> | <pre>[<br>  {<br>    "name": "link1",<br>    "virtual_network_id": "/subscriptions/0e9d74fe-17e8-456f-a6e2-bd7602010688/resourceGroups/managed_1/providers/Microsoft.Network/virtualNetworks/Managed_1-vnet"<br>  },<br>  {<br>    "name": "link2",<br>    "virtual_network_id": "/subscriptions/0e9d74fe-17e8-456f-a6e2-bd7602010688/resourceGroups/MC_aks-bckup_test-bckp_westeurope/providers/Microsoft.Network/virtualNetworks/aks-vnet-41435004"<br>  }<br>]</pre> | no |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | n/a | `string` | `"/subscriptions/0e9d74fe-17e8-456f-a6e2-bd7602010688/resourceGroups/managed_1/providers/Microsoft.Network/virtualNetworks/Managed_1-vnet/subnets/default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | n/a |
<!-- END_TF_DOCS -->

### with github actions 
https://community.ops.io/oleonardorodrigues/how-to-create-automatic-documentation-for-your-terraform-modules-da2