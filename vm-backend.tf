resource "azurerm_virtual_machine" "backend-vm" {
  name                  = "backend-vm"
  location              = "${azurerm_resource_group.TDP-res-group.location}"
  resource_group_name   = "${azurerm_resource_group.TDP-res-group.name}"
  network_interface_ids = ["${azurerm_network_interface.nic-backend.id}"]
  vm_size               = "Standard_DS1_v2"

  storage_image_reference {
    publisher = "credativ"
    offer     = "Debian"
    sku       = "9"
    version   = "latest"
  }
  storage_os_disk {
    name              = "backend-vm"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "backend-vm"
    admin_username = "sebflower"
  }
  os_profile_linux_config {
    disable_password_authentication = true
    ssh_keys {
	path = "/home/sebflower/.ssh/authorized_keys"
	key_data = "${file("~/.ssh/id_rsa.pub")}"
	}
  }
}
