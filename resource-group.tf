resource "azurerm_resource_group" "TDP-res-group" {
  name     = "${terraform.workspace}-TDP"
  location = "uksouth"
}
