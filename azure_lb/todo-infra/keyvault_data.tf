data "azurerm_key_vault" "key-vault" {
  name                = "todokeyvault01"
  resource_group_name = "rg-anil"
}

data "azurerm_key_vault_secret" "vm-username" {
  name         = "vm-user"
  key_vault_id = data.azurerm_key_vault.key-vault.id
}

data "azurerm_key_vault_secret" "vm-password" {
  name         = "vm-password"
  key_vault_id = data.azurerm_key_vault.key-vault.id
}
