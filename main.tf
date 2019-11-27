terraform {
  backend "azurerm" {
    storage_account_name  = "${var.storage_account_name}"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
	version = "=1.30.1"
}
module "testing" {
  source = "./modules/testing"
  admin_user = "sebflower"
  resource_group = azurerm_resource_group.TDP-res-group
  network_group = azurerm_virtual_network.shop-network
}
