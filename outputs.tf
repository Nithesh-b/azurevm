# output "vm_public_ip" {
#   description = "Public IP address of the Azure Linux virtual machine"
#   value       = azurerm_linux_virtual_machine.example.network_interface_ids[0].ip_configuration[0].public_ip_address
# }

# output "vm_private_ip" {
#   description = "Private IP address of the Azure Linux virtual machine"
#   value       = azurerm_linux_virtual_machine.example.network_interface_ids[0].ip_configuration[0].private_ip_address
# }

output "vm_id" {
  description = "ID of the Azure Linux virtual machine"
  value       = azurerm_linux_virtual_machine.example.id
}

output "private_ip" {
  value = azurerm_network_interface.example.private_ip_address 
}

output "public_ip_address" {
  value = azurerm_public_ip.example.ip_address
}