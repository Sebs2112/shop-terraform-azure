resource "azurerm_subnet" "subnet-frontend" {
  name                 = "${terraform.workspace}-frontend"
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.network_group.name
  address_prefix       = "10.0.2.0/24"
}


resource "azurerm_subnet" "subnet-backend" {
  name                 = "${terraform.workspace}-backend"
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.network_group.name
  address_prefix       = "10.0.3.0/24"
}

resource "azurerm_subnet" "subnet-managment" {
  name                 = "${terraform.workspace}-managment"
  resource_group_name  = var.resource_group.name
  virtual_network_name = var.network_group.name
  address_prefix       = "10.0.4.0/24"
}
