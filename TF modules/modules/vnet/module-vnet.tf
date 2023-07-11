#module for VNET
resource "azurerm_virtual_network" "aks-vnet" {
    resource_group_name = var.resource_group
    location = var.location
    name = var.aks-vnet_name
    address_space = var.aks-vnet_address_space #["10.0.0.1/16"]
    
    subnet {
        name = var.aks-subnet_name
        address_prefix = var.aks-subnet_prefix
    
        
    }



    tags = var.tags

}

#resource "azurerm_route_table" "aks-routetable" {
#  name                = "aks-routetable"
#  location            = var.location
#  resource_group_name = var.resource_group
#
#}
#
#resource "azurerm_subnet_route_table_association" "aks-rt-association" {
#  subnet_id      = azurerm_virtual_network.aks-vnet.subnet.*.id[0]
#  route_table_id = azurerm_route_table.aks-routetable.id
#}