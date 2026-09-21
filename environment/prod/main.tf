module "rg" {
  source = "../../module/azurerm_resource_group"
  rgs    = var.rgs
}

module "vnet" {
  depends_on = [module.rg]
  source     = "../../module/azurerm_virtual_network"
  vnet       = var.vnet
}

module "subnets" {
  depends_on = [module.vnet]
  source     = "../../module/azurerm_subnets"
  subnets    = var.subnets
}

module "pip" {
  depends_on = [module.rg]
  source     = "../../module/azurerm_public_ips"
  pips       = var.pips
}

module "nsg" {
  source = "../../module/azurerm_nsg"
  nsg    = var.nsgs

}

module "vms" {
  depends_on = [module.rg, module.subnets, module.pip, module.nsg]
  source     = "../../module/azurerm_virtual_machine"
  vms        = var.vms

}

module "my_pgdb" {
  source = "../../module/azurerm_postgress_db"
  db     = var.db

}


