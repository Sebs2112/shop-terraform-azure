resource "azurerm_network_security_group" "nsg-frontend" {
    name                = "${terraform.workspace}-frontend-nsg"
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

}


resource "azurerm_network_security_group" "nsg-managment" {
    name                = "${terraform.workspace}-managment-nsg"
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "HTTP"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    security_rule {
        name                       = "HTTPS"
        priority                   = 1003
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

}
resource "azurerm_network_security_group" "nsg-backend" {
    name                = "${terraform.workspace}-backend-nsg"
    location            = var.resource_group.location
    resource_group_name = var.resource_group.name

    security_rule {
        name                       = "SSH-from-managment"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "10.0.4.0/24"
        destination_address_prefix = "*"
    }
    security_rule {
        name                       = "HTTP-from-frontnet"
        priority                   = 1002
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "10.0.2.0/24"
        destination_address_prefix = "*"
    }

}
