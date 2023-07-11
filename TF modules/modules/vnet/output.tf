#output values for vnet module

output "vnet_id" {
    value = azurerm_virtual_network.aks-vnet.id
}

output vnet_subnet_id {
    value = element(azurerm_virtual_network.aks-vnet.subnet.*.id, 0)
}

