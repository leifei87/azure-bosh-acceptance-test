resource "azurerm_public_ip" "separate" {
  name                         = "separate-ip"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.public_ip_resource_group.name}"
  public_ip_address_allocation = "static"
}
