resource "azurerm_postgresql_flexible_server" "mypg-db" {
  for_each = var.db  
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  administrator_login          = each.value.administrator_login
  administrator_password = each.value.administrator_login_password

  sku_name   = each.value.sku_name
  version    = each.value.version
  storage_mb = each.value.storage_mb

 
  public_network_access_enabled    = true

}