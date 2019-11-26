resource "azurerm_network_interface" "nic-frontend" {
  name                = "frontend-nic"
  location            = "${azurerm_resource_group.TDP-res-group.location}"
  resource_group_name = "${azurerm_resource_group.TDP-res-group.name}"
  network_security_group_id = "${azurerm_network_security_group.nsg-frontend.id}"


  ip_configuration {
    name                          = "frontendIpConfig"
    subnet_id                     = "${azurerm_subnet.subnet-frontend.id}"
    private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.publicIP-frontend.id}"
  }
  depends_on = [azurerm_network_security_group.nsg-frontend, azurerm_subnet.subnet-frontend, azurerm_public_ip.publicIP-frontend]
}

resource "azurerm_network_interface" "nic-managment" {
  name                = "managment-nic"
  location            = "${azurerm_resource_group.TDP-res-group.location}"
  resource_group_name = "${azurerm_resource_group.TDP-res-group.name}"
  network_security_group_id = "${azurerm_network_security_group.nsg-managment.id}"


  ip_configuration {
    name                          = "managmentIpConfig"
    subnet_id                     = "${azurerm_subnet.subnet-managment.id}"
    private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.publicIP-managment.id}"
  }
  depends_on = [azurerm_network_security_group.nsg-managment, azurerm_subnet.subnet-managment, azurerm_public_ip.publicIP-managment]
}

resource "azurerm_network_interface" "nic-backend" {
  name                = "backend-nic"
  location            = "${azurerm_resource_group.TDP-res-group.location}"
  resource_group_name = "${azurerm_resource_group.TDP-res-group.name}"
  network_security_group_id = "${azurerm_network_security_group.nsg-backend.id}"


  ip_configuration {
    name                          = "backendIpConfig"
    subnet_id                     = "${azurerm_subnet.subnet-backend.id}"
    private_ip_address_allocation = "Dynamic"
       
  }
  depends_on = [azurerm_network_security_group.nsg-backend, azurerm_subnet.subnet-backend]
}

