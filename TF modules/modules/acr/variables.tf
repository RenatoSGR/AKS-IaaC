#variables for acr module

variable "acr_name" {
    description = "Name of the Azure Container Registry"
    type = string
    default = "acraksdevslb"
}

variable "acr_resource_group" {
    description = "Resource group name for the Azure Container Registry"
    type = string
    default = "rg-aks-slb"
}

variable "acr_location" {
    description = "Location for the Azure Container Registry"
    type = string
    default = "westeurope"
}

variable "acr_sku" {
    description = "SKU for the Azure Container Registry"
    type = string
    default = "Basic"
}
