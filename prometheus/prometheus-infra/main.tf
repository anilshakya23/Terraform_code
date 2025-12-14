# module "rg" {
#   source                  = "../modules/azurerm_resource_group"
#   resource_group_name     = "rg-prometheus-grafana"
#   resource_group_location = "west us"
# }

# module "vnet" {
#   depends_on               = [module.rg]
#   source                   = "../modules/azurerm_vnet"
#   virtual_network_name     = "prometheus-grafana-vnet"
#   virtual_network_location = "west us"
#   resource_group_name      = "rg-prometheus-grafana"
#   address_space            = ["10.0.0.0/16"]
# }

# module "subnet" {
#   depends_on           = [module.vnet]
#   source               = "../modules/azurerm_subnet"
#   subnet_name          = "prometheus-grafana-subnet"
#   resource_group_name  = "rg-prometheus-grafana"
#   virtual_network_name = "prometheus-grafana-vnet"
#   address_prefixes     = ["10.0.1.0/24"]
# }

# module "pip-1" {
#   depends_on          = [module.rg]
#   source              = "../modules/azurerm_public_ip"
#   public_ip_name      = "prometheus-grafana-pip-1"
#   public_ip_location  = "west us"
#   resource_group_name = "rg-prometheus-grafana"
# }

# module "nsg-1" {
#   depends_on                      = [module.rg]
#   source                          = "../modules/azurerm_nsg"
#   network_security_group_name     = "prometheus-grafana-nsg-1"
#   network_security_group_location = "west us"
#   resource_group_name             = "rg-prometheus-grafana"
# }

# module "vm-1" {
#   depends_on                     = [module.rg, module.vnet, module.subnet, module.nsg-1, module.pip-1]
#   source                         = "../modules/azurerm_virtual_machine"
#   linux_virtual_machine_name     = "prometheus-grafana-server"
#   linux_virtual_machine_location = "west us"
#   network_interface_name         = "prometheus-grafana-nic-1"
#   network_interface_location     = "west us"
#   resource_group_name            = "rg-prometheus-grafana"
#   admin_username                 = "Nemuadmin"
#   admin_password                 = "nemuuser@1234"
#   subnet_data                    = "prometheus-grafana-subnet"
#   virtual_network_name           = "prometheus-grafana-vnet"
#   public_ip_name                 = "prometheus-grafana-pip-1"
#   network_security_group_data    = "prometheus-grafana-nsg-1"
# }


# module "pip-2" {
#   depends_on          = [module.rg]
#   source              = "../modules/azurerm_public_ip"
#   public_ip_name      = "prometheus-grafana-pip-2"
#   public_ip_location  = "west us"
#   resource_group_name = "rg-prometheus-grafana"
# }

# module "nsg-2" {
#   depends_on                      = [module.rg]
#   source                          = "../modules/azurerm_nsg"
#   network_security_group_name     = "prometheus-grafana-nsg-2"
#   network_security_group_location = "west us"
#   resource_group_name             = "rg-prometheus-grafana"
# }

# module "vm-2" {
#   depends_on                     = [module.rg, module.vnet, module.subnet, module.pip-2, module.nsg-2]
#   source                         = "../modules/azurerm_virtual_machine"
#   linux_virtual_machine_name     = "prometheus-grafana-vm-2"
#   linux_virtual_machine_location = "west us"
#   network_interface_name         = "prometheus-grafana-nic-2"
#   network_interface_location     = "west us"
#   resource_group_name            = "rg-prometheus-grafana"
#   admin_username                 = "Nemuadmin"
#   admin_password                 = "nemuuser@1234"
#   subnet_data                    = "prometheus-grafana-subnet"
#   virtual_network_name           = "prometheus-grafana-vnet"
#   public_ip_name                 = "prometheus-grafana-pip-2"
#   network_security_group_data    = "prometheus-grafana-nsg-2"
# }


# module "pip-3" {
#   depends_on          = [module.rg]
#   source              = "../modules/azurerm_public_ip"
#   public_ip_name      = "prometheus-grafana-pip-3"
#   public_ip_location  = "central india"
#   resource_group_name = "rg-prometheus-grafana"
# }

# module "nsg-3" {
#   depends_on                      = [module.rg]
#   source                          = "../modules/azurerm_nsg"
#   network_security_group_name     = "prometheus-grafana-nsg-3"
#   network_security_group_location = "central india"
#   resource_group_name             = "rg-prometheus-grafana"
# }

# module "vm-3" {
#   depends_on                     = [module.rg, module.vnet, module.subnet, module.nsg-3, module.pip-3]
#   source                         = "../modules/azurerm_virtual_machine"
#   linux_virtual_machine_name     = "prometheus-grafana-vm-3"
#   linux_virtual_machine_location = "central india"
#   network_interface_name         = "prometheus-grafana-nic-3"
#   network_interface_location     = "central india"
#   resource_group_name            = "rg-prometheus-grafana"
#   admin_username                 = "Nemuadmin"
#   admin_password                 = "nemuuser@1234"
#   subnet_data                    = "prometheus-grafana-subnet"
#   virtual_network_name           = "prometheus-grafana-vnet"
#   public_ip_name                 = "prometheus-grafana-pip-3"
#   network_security_group_data    = "prometheus-grafana-nsg-3"
# }
