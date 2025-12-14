data "azurerm_subnet" "subnet-data" {
  name                 = var.subnet_data
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_public_ip" "pip-data" {
  name                = var.public_ip_data
  resource_group_name = var.resource_group_name
}