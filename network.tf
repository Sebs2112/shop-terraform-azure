resource "azurerm_virtual_network" "shop-network" {
  name                = "${terraform.workspace}-shop-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.TDP-res-group.location
  resource_group_name = azurerm_resource_group.TDP-res-group.name
}
