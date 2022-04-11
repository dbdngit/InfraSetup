module "LGRI-g360-CODE-QUALITY-RG" {  
  source              = "__git_path__00.ResourceGroupModule__git_ref__"
  location            = var.location
  rg_name             = local.rg_name  
  tags_common         = local.tags_rg
}
module "VM-LGRI-VM-SONAR" {  
  source                            = "__git_path__19.WinServerModule__git_ref__"
  location                          = var.location
  win_vm_rg                         = module.LGRI-360-CODE-QUALITY-RG.rg_name_output
  win_vm_name                       = var.vm_name
  win_host_name                     = var.vm_name
  win_admin_username                = data.azurerm_key_vault_secret.win_user_name.value
  win_admin_password                = data.azurerm_key_vault_secret.win_user_password.value
  avset_id                          = var.avset_id
  win_diagnostics_storage_uri       = data.azurerm_storage_account.diagnostics_storage.primary_blob_endpoint
  win_disk_size_gb                  = 256
  data_disk_required                = false
  managed_disk_size_gb              = 256
  vm_backup_required                = var.vm_backup_required
  vm_backup_asr_rg                  = var.vm_backup_asr_rg
  vm_backup_asr_name                = var.vm_backup_asr_name
  vm_backup_asr_policy_name         = var.vm_backup_asr_policy_name
  win_write_accelerator_enabled     = false
  win_timezone                      = "GMT Standard Time"
  win_publisher                     = "MicrosoftSQLServer"              
  win_offer                         = "sql2019-ws2019"
  win_sku                           = var.win_sku # "standard-gen2 2019 sql server "
  win_vm_version                    = "latest"
  win_vm_size                       = var.vm_size
  nic_enable_accelerated_networking = var.nic_enable_accelerated_networking
  subnet_id                         = data.azurerm_subnet.devops_subnet.id
  server_private_ip                 = var.server_private_ip
  tags_common                       = local.tags_sonar_vm
}

module "VMExtn-LGRI-ALPS-SONAR" {
  source                            = "__git_path__20.WinServerExtnModule__git_ref__"  
  location                          = var.location
  vm_id                             = module.VM-LGRI-360-SONAR.vm_id_output
  workspace_id                      = data.azurerm_log_analytics_workspace.la_workspace.workspace_id
  workspace_primary_shared_key      = data.azurerm_log_analytics_workspace.la_workspace.primary_shared_key
  tags_common                       = local.tags_sonar_vm
}
