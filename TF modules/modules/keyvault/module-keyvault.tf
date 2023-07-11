#module for keyvault
resource "azurerm_key_vault"  "keyvault" {
    name = var.keyvault_name
    resource_group_name = var.keyvault_resource_group_name
    location = var.keyvault_location
    tags = var.keyvault_tags
    sku_name = var.keyvault_sku_name #default is standard
    tenant_id = var.tenant_id
    #enabled_for_deployment = true
    #enabled_for_disk_encryption = true
    #enabled_for_template_deployment = true
    #purge_protection_enabled = true
    #soft_delete_retention_days = 7
}