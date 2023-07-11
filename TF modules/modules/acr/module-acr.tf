#module for acr
resource "azurerm_container_registry" "acr" {
    name = var.acr_name
    resource_group_name = var.acr_resource_group
    location = var.acr_location
    sku = var.acr_sku #Premium or Basic
    admin_enabled = false #true or false
    tags = {
        environment = "dev"
    }
}