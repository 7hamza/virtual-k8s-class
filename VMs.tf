resource "azurerm_network_interface" "vm-nic" {
    for_each            = var.nic_numbers
    name                = "nic-vm${each.key}"
    location            = azurerm_resource_group.virtual-class.location
    resource_group_name = azurerm_resource_group.virtual-class.name

    ip_configuration {
      name                          = "internal-vm${each.key}"
      subnet_id                     = azurerm_subnet.class-subnet.id
      private_ip_address_allocation = "Static"
      private_ip_address            = "192.168.1.1${each.key}"
    }
}

resource "azurerm_linux_virtual_machine" "vm" {

    for_each            = var.nic_numbers
    name                = "vm${each.key}"
    resource_group_name = azurerm_resource_group.virtual-class.name
    location            = azurerm_resource_group.virtual-class.location
    size                = "Standard_F2"
    admin_username      = "student${each.key}"
    network_interface_ids = ["/subscriptions/9c1d4d54-376e-4d02-ba76-55a6b5721347/resourceGroups/virtual-class/providers/Microsoft.Network/networkInterfaces/${each.value}"]
    admin_password = "student${each.key}"

    os_disk {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "16.04-LTS"
      version   = "latest"
    }
}