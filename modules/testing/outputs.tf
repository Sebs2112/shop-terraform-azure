output "managment_fqdn" {
  value = azurerm_public_ip.publicIP-managment.fqdn
}

output "frontend_fqdn" {
  value = azurerm_public_ip.publicIP-frontend.fqdn
}
