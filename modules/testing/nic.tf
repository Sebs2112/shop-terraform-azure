resource "azurerm_network_interface" "nic-frontend" {
  name                = "${terraform.workspace}-frontend-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.nsg-frontend.id


  ip_configuration {
    name                          = "${terraform.workspace}frontendIpConfig"
    subnet_id                     = azurerm_subnet.subnet-frontend.id
    private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.publicIP-frontend.id
  }
  depends_on = [azurerm_network_security_group.nsg-frontend, azurerm_subnet.subnet-frontend, azurerm_public_ip.publicIP-frontend]
}

resource "azurerm_network_interface" "nic-managment" {
  name                = "${terraform.workspace}-managment-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.nsg-managment.id


  ip_configuration {
    name                          = "${terraform.workspace}managmentIpConfig"
    subnet_id                     = azurerm_subnet.subnet-managment.id
    private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.publicIP-managment.id
  }
  depends_on = [azurerm_network_security_group.nsg-managment, azurerm_subnet.subnet-managment, azurerm_public_ip.publicIP-managment]
}

resource "azurerm_network_interface" "nic-backend" {
  name                = "${terraform.workspace}backend-nic"
  location            = var.resource_group.location
  resource_group_name = var.resource_group.name
  network_security_group_id = azurerm_network_security_group.nsg-backend.id


  ip_configuration {
    name                          = "${terraform.workspace}backendIpConfig"
    subnet_id                     = azurerm_subnet.subnet-backend.id
    private_ip_address_allocation = "Dynamic"

  }
  depends_on = [azurerm_network_security_group.nsg-backend, azurerm_subnet.subnet-backend]
}
