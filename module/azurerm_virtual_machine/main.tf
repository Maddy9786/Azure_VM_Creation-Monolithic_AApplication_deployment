resource "azurerm_network_interface" "nics" {
  for_each = var.vms
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnets[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.pips[each.key].id
  }
}

resource "azurerm_network_interface_security_group_association" "nsg-nic-association" {
  for_each = var.vms  
  network_interface_id = azurerm_network_interface.nics[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}

resource "azurerm_linux_virtual_machine" "vms" {
  for_each = var.vms
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password =  each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nics[each.key].id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}

