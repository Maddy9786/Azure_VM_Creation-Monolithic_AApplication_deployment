resource "azurerm_resource_group" "myrgs" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
}