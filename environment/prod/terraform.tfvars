rgs = {
  rg1 = {
    name     = "vm_rg"
    location = "centralindia"
  }

}

vnet = {

  vnet1 = {
    name                = "monolithic_Vnet"
    location            = "centralindia"
    resource_group_name = "vm_rg"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  frontend_subnet = {
    name                 = "frontend_subnet"
    resource_group_name  = "vm_rg"
    virtual_network_name = "monolithic_Vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

  Backend_subnet = {
    name                 = "Backend_subnet"
    resource_group_name  = "vm_rg"
    virtual_network_name = "monolithic_Vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }

  DB_subnet = {
    name                 = "DB_Subnet"
    resource_group_name  = "vm_rg"
    virtual_network_name = "monolithic_Vnet"
    address_prefixes     = ["10.0.3.0/24"]
  }



}

pips = {

  front_pip = {
    name                = "frontend-pip"
    resource_group_name = "vm_rg"
    location            = "centralindia"
    allocation_method   = "Static"
  }


  back_pip = {
    name                = "backend-pip"
    resource_group_name = "vm_rg"
    location            = "centralindia"
    allocation_method   = "Static"
  }

  db_pip = {
    name                = "db-pip"
    resource_group_name = "vm_rg"
    location            = "centralindia"
    allocation_method   = "Static"
  }

}


nsgs = {
  nsg1 = {
    name                = "frontend_nsg"
    location            = "centralindia"
    resource_group_name = "vm_rg"

  }

}
vms = {

  vm1 = {
    name                = "frontend-VM"
    resource_group_name = "vm_rg"
    location            = "centralindia"
    size                = "Standard_D2ls_v6"
    admin_username      = "adminuser"
    admin_password      = "Test@1232"
    publisher           = "Canonical"
    offer               = "ubuntu-24_04-lts"
    sku                 = "server"
    version             = "latest"
    nic_subnet_name     = "frontend_subnet"
    nic_vnet            = "monolithic_Vnet"
    puplic_ip_name      = "frontend-pip"
    nsg_name            = "frontend_nsg"

  }


  vm2 = {
    name                = "Backend-VM"
    resource_group_name = "vm_rg"
    location            = "centralindia"
    size                = "Standard_D2ls_v6"
    admin_username      = "adminuser"
    admin_password      = "Test@1232"
    publisher           = "Canonical"
    offer               = "ubuntu-24_04-lts"
    sku                 = "server"
    version             = "latest"
    nic_vnet            = "monolithic_Vnet"
    nic_subnet_name     = "Backend_subnet"
    puplic_ip_name      = "backend-pip"
    nsg_name            = "frontend_nsg"
  }

  vm3 = {
    name                = "DB-VM"
    resource_group_name = "vm_rg"
    location            = "centralindia"
    size                = "Standard_D2ls_v6"
    admin_username      = "adminuser"
    admin_password      = "Test@1232"
    publisher           = "Canonical"
    offer               = "ubuntu-24_04-lts"
    sku                 = "server"
    version             = "latest"
    nic_vnet            = "monolithic_Vnet"
    nic_subnet_name     = "DB_Subnet"
    puplic_ip_name      = "db-pip"
    nsg_name            = "frontend_nsg"
  }


}



