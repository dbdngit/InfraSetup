data "azurerm_client_config" "current" {}

data "azurerm_log_analytics_workspace" "la_workspace" {
  name                = var.la_for_monitoring_data
  resource_group_name = var.la_for_monitoring_data_rg
}

data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name   
  resource_group_name = var.key_vault_rg
}

data "azurerm_key_vault_secret" "win_user_name" {
  name                = "win-admin-user-name"
  key_vault_id        = data.azurerm_key_vault.key_vault.id
}

data "azurerm_key_vault_secret" "win_user_password" {
  name                = "win-admin-password"
  key_vault_id        = data.azurerm_key_vault.key_vault.id
}

data "azurerm_subnet" "devops_subnet" {
  name                 = var.vnet_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.vnet_name_rg     
}

data "azurerm_storage_account" "diagnostics_storage" {
  name                 = var.diagnostics_storage_name
  resource_group_name  = var.diagnostics_storage_rg
}
