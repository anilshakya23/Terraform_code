module "rg" {
  source                  = "../modules/resource_group"
  resource_group_name     = "rg-ecom"
  resource_group_location = "west us"
}

module "vnet" {
    depends_on = [ module.rg ]
  source                   = "../modules/vnet"
  virtual_network_name     = "ecom-vnet"
  resource_group_name      = "rg-ecom"
  virtual_network_location = "west us"
  address_space_name       = ["10.0.0.0/16"]
}

module "subnet" {
    depends_on = [ module.vnet ]
  source                = "../modules/subnet"
  subnet_name           = "ecom-subnet"
  virtual_network_name  = "ecom-vnet"
  resource_group_name   = "rg-ecom"
  address_prefixes_name = ["10.0.1.0/24"]
}

module "pip" {
    depends_on = [ module.rg ]
  source              = "../modules/pip"
  public_ip_name      = "ecom-pip"
  resource_group_name = "rg-ecom"
  public_ip_location  = "west us"
}

module "vm" {
    depends_on = [ module.rg, module.subnet, module.pip ]
  source                         = "../modules/vm"
  network_interface_name         = "ecom-nic"
  network_interface_location     = "westus"
  resource_group_name            = "rg-ecom"
  linux_virtual_machine_name     = "ecom-vm"
  linux_virtual_machine_location = "west us"
  size_image                     = "Standard_F2"
  admin_username                 = "Neadmin"
  admin_password                 = "Nemuuser@12"
  subnet_data                    = "ecom-subnet"
  virtual_network_name           = "ecom-vnet"
  public_ip_data                 = "ecom-pip"
}
