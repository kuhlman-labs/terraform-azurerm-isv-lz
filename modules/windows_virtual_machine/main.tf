resource "azurerm_resource_group" "virtual_machine" {
  name     = "rg-${var.name_prefix}-${var.environment}-${var.location}"
  location = var.location
  tags     = var.tags
}

resource "azurerm_network_interface" "virtual_machine" {
  count               = var.vm_count
  name                = "nic-${var.name_prefix}-${format("%02d", count.index)}-${var.environment}-${azurerm_resource_group.virtual_machine.location}"
  location            = azurerm_resource_group.virtual_machine.location
  resource_group_name = azurerm_resource_group.virtual_machine.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
  tags = var.tags
}

resource "azurerm_availability_set" "virtual_machine" {
  count = var.enable_zone == true ? 0 : 1

  name                        = "avset-${var.name_prefix}-${var.environment}-${azurerm_resource_group.virtual_machine.location}"
  location                    = azurerm_resource_group.virtual_machine.location
  resource_group_name         = azurerm_resource_group.virtual_machine.name
  platform_fault_domain_count = 2
  tags                        = var.tags
}

resource "azurerm_windows_virtual_machine" "virtual_machine" {
  count = var.vm_count

  name                  = "${var.name_prefix}-${format("%02d", count.index)}-${var.environment}-${azurerm_resource_group.virtual_machine.location}"
  resource_group_name   = azurerm_resource_group.virtual_machine.name
  location              = azurerm_resource_group.virtual_machine.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  computer_name         = "${substr(var.name_prefix, 0, 4)}-${format("%02d", count.index)}-${substr(var.environment, 0, 2)}${substr(azurerm_resource_group.virtual_machine.location, 0, 2)}"
  zone                  = var.enable_zone == false ? null : element(var.zones, count.index)
  availability_set_id   = var.enable_zone == true ? null : azurerm_availability_set.virtual_machine.0.id
  network_interface_ids = [element(azurerm_network_interface.virtual_machine.*.id, count.index)]

  os_disk {
    name                 = "osdisk-${var.name_prefix}-${format("%02d", count.index)}-${var.environment}-${azurerm_resource_group.virtual_machine.location}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  tags = var.tags
}