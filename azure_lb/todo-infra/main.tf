# module "rg" {
#   source                  = "../modules/azurerm_resource_group"
#   resource_group_name     = "rg-todo"
#   resource_group_location = "East US"
# }

# module "vnet" {
#   depends_on               = [module.rg]
#   source                   = "../modules/azurerm_vnet"
#   virtual_network_name     = "vnet-anil"
#   address_space_type       = ["10.0.0.0/16"]
#   resource_group_name      = "rg-todo"
#   virtual_network_location = "East US"
# }

# module "subnet" {
#   depends_on            = [module.vnet]
#   source                = "../modules/azurerm_subnet"
#   subnet_name           = "subnet-anil"
#   virtual_network_name  = "vnet-anil"
#   resource_group_name   = "rg-todo"
#   address_prefixes_type = ["10.0.1.0/24"]
# }

# module "nsg-vm-1" {
#     depends_on = [ module.rg ]
#   source                = "../modules/azurerm_nsg"
#   resource_nsg_name     = "ecom-nsg-1"
#   resource_nsg_location = "East US"
#   resource_group_name   = "rg-todo"
# }

# module "nsg-vm-2" {
#   source                = "../modules/azurerm_nsg"
#   resource_nsg_name     = "ecom-nsg-2"
#   resource_nsg_location = "East US"
#   resource_group_name   = "rg-todo"
# }


# module "vm1" {
#   depends_on                     = [module.subnet, module.vnet, module.rg, ]
#   source                         = "../modules/azurerm_vm"
#   network_interface_name         = "nic-anil-1"
#   network_interface_location     = "East US"
#   resource_group_name            = "rg-todo"
#   linux_virtual_machine_name     = "vm-anil1"
#   linux_virtual_machine_location = "East US"
#   admin_username_name            = data.azurerm_key_vault_secret.vm-username.value
#   admin_password_name            = data.azurerm_key_vault_secret.vm-password.value
#   subnet_name                    = "subnet-anil"
#   virtual_network_name           = "vnet-anil"
#   publisher_image                = "Canonical"
#   offer_image                    = "0001-com-ubuntu-server-jammy"
#   sku_image                      = "22_04-lts"
#   version_image                  = "latest"
#   resource_nsg_name              = "ecom-nsg-1"

# }
# module "vm2" {
#   depends_on                     = [module.subnet, module.vnet, module.rg, ]
#   source                         = "../modules/azurerm_vm"
#   network_interface_name         = "nic-anil-2"
#   network_interface_location     = "East US"
#   resource_group_name            = "rg-todo"
#   linux_virtual_machine_name     = "vm-anil2"
#   linux_virtual_machine_location = "East US"
#   admin_username_name            = data.azurerm_key_vault_secret.vm-username.value
#   admin_password_name            = data.azurerm_key_vault_secret.vm-password.value
#   subnet_name                    = "subnet-anil"
#   virtual_network_name           = "vnet-anil"
#   publisher_image                = "Canonical"
#   offer_image                    = "0001-com-ubuntu-server-jammy"
#   sku_image                      = "22_04-lts"
#   version_image                  = "latest"
#   resource_nsg_name              = "ecom-nsg-2"
# }

# module "basation_host-pip" {
#   depends_on             = [module.rg]
#   source                 = "../modules/azurerm_public_ip"
#   public_ip_name         = "pip-todo-basation"
#   resource_group_name    = "rg-todo"
#   public_ip_location     = "East US"
#   allocation_method_type = "Static"
#   sku_type               = "Standard"
# }

# module "basation_host" {
#   depends_on              = [module.rg, module.vnet, module.subnet, module.vm1, module.vm2, module.basation_host-pip]
#   source                  = "../modules/azurerm_bastion_host"
#   bastion_host_name       = "bastion-host-anil"
#   bastion_host_location   = "East US"
#   resource_group_name     = "rg-todo"
#   virtual_network_name    = "vnet-anil"
#   public_ip_basation_host = "pip-todo-basation"
# }


# module "lb-pip" {
#   depends_on             = [module.rg]
#   source                 = "../modules/azurerm_public_ip"
#   public_ip_name         = "pip-anil"
#   resource_group_name    = "rg-todo"
#   public_ip_location     = "East US"
#   allocation_method_type = "Static"
#   sku_type               = "Standard"
# }

# module "lb" {
#   depends_on          = [module.rg, module.lb-pip, module.vm1, module.vm2]
#   source              = "../modules/azurerm_load_balancer"
#   lb_name             = "lb-anil"
#   lb_location         = "East US"
#   resource_group_name = "rg-todo"
#   public_ip_name      = "pip-anil"
# }

# module "nic_lb_association-1" {
#   depends_on                        = [module.rg, module.vnet, module.subnet, module.lb-pip, module.lb, module.vm1, module.vm2]
#   source                            = "../modules/azurerm_lb_nic_association"
#   network_interface_data            = "nic-anil-1"
#   resource_group_name               = "rg-todo"
#   lb_data_name                      = "lb-anil"
#   lb_backend_address_pool_data_name = "BackEndAddressPool"
#   ip_configuration_name             = "internal"

# }

# module "nic_lb_association-2" {
#   depends_on                        = [module.rg, module.vnet, module.subnet, module.lb-pip, module.lb, module.vm1, module.vm2]
#   source                            = "../modules/azurerm_lb_nic_association"
#   network_interface_data            = "nic-anil-2"
#   resource_group_name               = "rg-todo"
#   lb_data_name                      = "lb-anil"
#   lb_backend_address_pool_data_name = "BackEndAddressPool"
#   ip_configuration_name             = "internal"

# }
