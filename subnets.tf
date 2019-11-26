resource "azurerm_subnet" "subnet-frontend" {
  name                 = "frontend"
  resource_group_name  = "${azurerm_resource_group.TDP-res-group.name}"
  virtual_network_name = "${azurerm_virtual_network.shop-network.name}"
  address_prefix       = "10.0.2.0/24"
}


resource "azurerm_subnet" "subnet-backend" {
  name                 = "backend"
  resource_group_name  = "${azurerm_resource_group.TDP-res-group.name}"
  virtual_network_name = "${azurerm_virtual_network.shop-network.name}"
  address_prefix       = "10.0.3.0/24"
}

resource "azurerm_subnet" "subnet-managment" {
  name                 = "managment"
  resource_group_name  = "${azurerm_resource_group.TDP-res-group.name}"
  virtual_network_name = "${azurerm_virtual_network.shop-network.name}"
  address_prefix       = "10.0.4.0/24"
}

