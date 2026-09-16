output "vm_public_ips" {
  description = "Public IP addresses of all virtual machines"

  value = {
    for key, vm in data.azurerm_public_ip.pips :
    key => vm.ip_address
  }
}