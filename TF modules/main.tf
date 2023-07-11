# main.tf
module "resource_group" {
  source = "./modules/rg"
    resource_group_name = "rg-aks-slb"
    location = "westeurope"
    tags = {
        environment = "dev"
    }
}

module "vnet" {
  source = "./modules/vnet"
    aks-vnet_name = "aks-vnet"
    aks-subnet_name = "aks-subnet"
    resource_group = "rg-aks-slb"
    depends_on = [
      module.resource_group
    ]
 
}

module "acr" {
  source = "./modules/acr"


}

#module "keyvault" {
#  source = "./modules/keyvault"
#    keyvault_name = "kv-aks-slb"
#}

module "aks-dev" {
  source = "./modules/aks"
  vnet_subnet_id = module.vnet.vnet_subnet_id
  scope = module.acr.scope

    

}