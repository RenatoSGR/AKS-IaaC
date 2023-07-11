#variables for vnet module
variable "aks-vnet_name" {
    type = string
    default = "aks-vnet"
}

variable "aks-vnet_address_space" {
    type = list(string)
    default = ["11.0.0.0/23"]
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

variable "resource_group" {
    type = string
    
}

variable "location" {
    type = string
    default = "westeurope"
}