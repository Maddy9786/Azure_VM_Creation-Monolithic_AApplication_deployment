data "azurerm_subnet" "subnets" {
  for_each = var.vms
  name                 = each.value.nic_subnet_name
  virtual_network_name = each.value.nic_vnet
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_public_ip" "pips" {
  for_each = var.vms
  name                = each.value.puplic_ip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_security_group" "nsg" {
for_each = var.vms  
name = each.value.nsg_name
resource_group_name = each.value.resource_group_name
}

