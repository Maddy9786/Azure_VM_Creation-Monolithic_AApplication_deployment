output "vm_public_ips" {
  description = "Public IP addresses of all VMs"

  value = module.vms.vm_public_ips
}