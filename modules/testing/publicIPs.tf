resource "azurerm_public_ip" "publicIP-frontend" {
    name                         = "${terraform.workspace}-frontend-pip"
    location                     = "${azurerm_resource_group.TDP-res-group.location}"
    resource_group_name          = "${azurerm_resource_group.TDP-res-group.name}"
    allocation_method            = "Dynamic"
    domain_name_label = "frontend-${formatdate("DDMMYYhhmmss", timestamp())}"
}

resource "azurerm_public_ip" "publicIP-managment" {
    name                         = "${terraform.workspace}-managment-pip"
    location                     = "${azurerm_resource_group.TDP-res-group.location}"
    resource_group_name          = "${azurerm_resource_group.TDP-res-group.name}"
    allocation_method            = "Dynamic"
    domain_name_label = "managment-${formatdate("DDMMYYhhmmss", timestamp())}"
}
