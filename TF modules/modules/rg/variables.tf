#variables for resource group module
variable "resource_group_name" {
  type = string
  description = "The name of the resource group"
}

variable "location" {
  type = string
  description = "The location of the resource group"
}

variable "tags" {
  type = map(string)
  description = "The tags of the resource group"
}

