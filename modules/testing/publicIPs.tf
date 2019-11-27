resource "azurerm_public_ip" "publicIP-frontend" {
    name                         = "${terraform.workspace}-frontend-pip"
    location                     = var.resource_group.location
    resource_group_name          = var.resource_group.name
    allocation_method            = "Dynamic"
    domain_name_label = "frontend-${formatdate("DDMMYYhhmmss", timestamp())}"
}

resource "azurerm_public_ip" "publicIP-managment" {
    name                         = "${terraform.workspace}-managment-pip"
    location                     = var.resource_group.location
    resource_group_name          = var.resource_group.name
    allocation_method            = "Dynamic"
    domain_name_label = "managment-${formatdate("DDMMYYhhmmss", timestamp())}"
}
