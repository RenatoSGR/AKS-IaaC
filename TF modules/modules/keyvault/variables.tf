#variables for keyvault module
variable "keyvault_name" {
    type = string
    default = "kv-aks-slb"
}

variable "keyvault_resource_group_name" {
    type = string
    default = "rg-aks-slb"
}

variable "keyvault_location" {
    type = string
    default = "westeurope"
}

variable "keyvault_tags" {
    type = map
    default = {
        environment = "dev"
    }
}

variable "keyvault_sku_name" {
    type = string
    default = "standard"
}

variable "tenant_id" {
    type = string
    default = "b31da7c7-8245-46f1-af84-fc22a20db64b"
}

