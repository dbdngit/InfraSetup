variable "env_instance" { 
  type = string
}

variable "env_name" { 
  type = string
}
variable "env_type" { 
  type = string # Primary Secondary
}
variable "env_prefix" { 
  type = string
}
variable "env_suffix" { 
  type = string # 360-qa, 360-pre-prod, 360-prod
}
variable "vm_name"{
  type = string
}

#variable "win_vm_rg" {}
 
variable "server_private_ip" {
  type = string
}

variable "win_sku"{
  type = string
  default = "2019-Datacenter"
}

variable "vm_size"{
  type = string
  default = "Standard_D2s_v3"
}

variable "nic_enable_accelerated_networking" {
  type = bool
  default = true
}

variable "location" { 
  type = string #West Europe, North Europe 
}

variable "diagnostics_storage_rg" {
  type = string
}

variable "diagnostics_storage_name" {
  type = string
}

variable "vnet_name_rg"{
  type = string
}

variable "vnet_name"{
  type = string
}

variable "vnet_subnet_name"{
  type = string
}

variable "la_for_monitoring_data"{
  type = string
}

variable "la_for_monitoring_data_rg"{
  type = string
}

variable "key_vault_name"{
  type = string
}

variable "key_vault_rg"{
  type = string
}

variable "data_disk_required" {
  type = bool
  default = false
}

variable "managed_disk_size_gb" {
  type = number
  default = 128
}

variable "managed_disk_type" {
  type = string
  default = "Premium_LRS"
}

variable "vm_backup_required" {
  type = bool
  default = true
}

variable "vm_backup_asr_rg" {
  type = string
}

variable "vm_backup_asr_name" {
  type = string
}

variable "vm_backup_asr_policy_name" {
  type = string
}

variable "log_retention_period_days" {
  type = number
  default = 180
}

variable "avset_id" {
  type    = string
  default = null
}
