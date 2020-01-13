# Create a default resource group
resource "azurerm_resource_group" "bosh_resource_group" {
  name     = "${var.resource_group_prefix}-${var.env_name}-e2e"
  location = "${var.location}"
  tags {
    autostop = "no"
  }
}
# Create a resource group for separate public IP
resource "azurerm_resource_group" "public_ip_resource_group" {
  name     = "${azurerm_resource_group.bosh_resource_group.name}-public-ip"
  location = "${var.location}"
}
