#variables for aks cluster module
variable "aks_cluster_name" {
  description = "The name of the AKS cluster"
  default = "aks-slb-dev"
}

variable "aks_location" {
  description = "The location of the AKS cluster"
  default = "westeurope"
}

variable "aks_resource_group" {
  description = "The name of the resource group for the AKS cluster"
  default = "rg-aks-slb"
}

variable "aks_kubernetes_version" {
  description = "The version of Kubernetes to use for the AKS cluster"
  default = "1.25.6"
}

variable "default_node_pool_vm_size" {
  description = "The VM size for the default node pool"
  default = "Standard_DS3_v2"
}

variable "default_node_pool_zones" {
  description = "The zones for the default node pool"
  default = ["1", "2"]
}

variable "additional_node_pool_vm_size" {
  description = "The VM size for the additional node pool"
  default = "Standard_DS3_v2"
}

variable "additional_node_pool_zones" {
  description = "The zones for the additional node pool"
  default = ["1", "2"]
}

#variable scope {
#  description = "The scope of the role assignment"
#  #default = "azurerm_container_registry.acr.id"
#}

variable acr_pull_role_definition_name {
  description = "The name of the role definition"
  default = "AcrPull"
}



#variables for vnet module
variable "aks-vnet_name" {
    type = string
    default = "aks-vnet"
}

variable "aks-vnet_address_space" {
    type = list(string)
    default = ["11.0.0.1/23"]
}

variable "aks-subnet_name" {
    type = string
    default = "aks-subnet"
}

variable "aks-subnet_prefix" {
    type = string
    default = "11.0.1.0/24"
}



variable "tags" {
    type = map(string)
    default = {
        environment = "dev"
    }
}



variable "vnet_subnet_id" {
    type = string
    default = "/subscriptions/0e9d74fe-17e8-456f-a6e2-bd7602010688/resourceGroups/managed_1/providers/Microsoft.Network/virtualNetworks/Managed_1-vnet/subnets/default"
    
}

#variables for resource group module
variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
  default = "rg-aks-slb"
}

variable "rg-location" {
  type = string
  description = "The location of the resource group"
  default = "westeurope"  
}

variable "virtual_network_links" {
  type = list(object({
    name                 = string
    virtual_network_id   = string
  }))
  default = [
    {
      name                 = "link1"
      virtual_network_id   = "/subscriptions/0e9d74fe-17e8-456f-a6e2-bd7602010688/resourceGroups/managed_1/providers/Microsoft.Network/virtualNetworks/Managed_1-vnet"

    },
    {
      name                 = "link2"
      virtual_network_id   = "/subscriptions/0e9d74fe-17e8-456f-a6e2-bd7602010688/resourceGroups/MC_aks-bckup_test-bckp_westeurope/providers/Microsoft.Network/virtualNetworks/aks-vnet-41435004"

    }
  ]
}