
resource "azurerm_resource_group" "my-rg" {
  name     = var.resource_group_name
  location = var.rg-location

}

#https://learn.microsoft.com/en-us/azure/aks/cluster-container-registry-integration?tabs=azure-cli#attach-an-acr-to-an-aks-cluster
#module for aks cluster
resource "azurerm_kubernetes_cluster" "aks-cluster" {
    resource_group_name = var.aks_resource_group
    name = var.aks_cluster_name
    location = var.aks_location
    kubernetes_version = var.aks_kubernetes_version
    #dns_prefix = var.aks_cluster_name
    dns_prefix_private_cluster = "myrrak8s"
    #azure_policy_enabled = true
    private_cluster_enabled = true
    sku_tier = "Standard" #Free or Standard
    #private_dns_zone_id     = azurerm_private_dns_zone.example.id
    #local_account_disabled = true - not supported if we want to integrate with ADO

    
    
    default_node_pool {
        name                = "systempool"
        os_sku              = "Ubuntu"
        node_count          = 1
        enable_auto_scaling = true
        min_count           = 1
        max_count           = 2
        max_pods            = 120
        vnet_subnet_id      = var.vnet_subnet_id
        vm_size             = var.default_node_pool_vm_size #"Standard_D3as_v5"
        zones               = var.default_node_pool_zones #["1", "2"]
        os_disk_type        = "Ephemeral"
        
    }

    identity {
        type = "SystemAssigned"
    }

    # Enable Role Based Access Control
    role_based_access_control_enabled = true

    azure_active_directory_role_based_access_control {
        managed                 = true
        azure_rbac_enabled      = true

    }

    # oms_agent{
    #    enabled = true
    #    log_analytics_workspace_id = var.log_analytics_workspace_id
    #}
    


    network_profile {
        network_plugin     = "azure"
        #https://learn.microsoft.com/en-us/azure/aks/azure-cni-overlay
        network_plugin_mode = "Overlay" #az feature register --namespace "Microsoft.ContainerService" --name "AzureOverlayPreview" 
        network_policy     = "calico"
        service_cidr       = "10.0.0.0/16"
        dns_service_ip     = "10.0.0.10"
        #docker_bridge_cidr = "172.17.0.1/16" #no longer needed since docker no longer used as container runtime
        outbound_type = "loadBalancer"
        
    }

  tags = {
    aksprivate = "true"
    environment = "dev"
  }

  depends_on =  [azurerm_resource_group.my-rg]
}

#After cluster creation please run the attach command to AKS-ACR integration for pull images from ACR
#https://learn.microsoft.com/en-us/azure/aks/cluster-container-registry-integration?tabs=azure-cli#attach-an-acr-to-an-aks-cluster
 /* resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.scope
  role_definition_name = var.acr_pull_role_definition_name
  principal_id         = azurerm_kubernetes_cluster.aks-cluster.identity[0].principal_id
}*/

resource "azurerm_kubernetes_cluster_node_pool" "additional_node_pools" {
  name                  = "elastipool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks-cluster.id
  os_sku                = "Ubuntu"
  os_disk_type         = "Ephemeral"
  node_count            = 1
  enable_auto_scaling   = true
  min_count             = 1
  max_count             = 2
  max_pods              = 120
  mode                  = "User"
  vm_size               = var.additional_node_pool_vm_size #"Standard_D2as_v5"
  zones                 = var.additional_node_pool_zones #["1", "2"]
  vnet_subnet_id        = var.vnet_subnet_id

}


resource "azurerm_private_dns_zone_virtual_network_link" "aks_to_hub_link" {
  
  count = length(var.virtual_network_links)

  name  = var.virtual_network_links[count.index].name
  # The below code gets the private dns zone name from the fqdn, by slicing the out dns prefix
  private_dns_zone_name = join(".", slice(split(".", azurerm_kubernetes_cluster.aks-cluster.private_fqdn), 1, length(split(".", azurerm_kubernetes_cluster.aks-cluster.private_fqdn))))
  resource_group_name = "MC_${azurerm_resource_group.my-rg.name}_${azurerm_kubernetes_cluster.aks-cluster.name}_westeurope"
  virtual_network_id  = var.virtual_network_links[count.index].virtual_network_id
  
}
  


