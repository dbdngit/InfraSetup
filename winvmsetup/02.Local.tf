
locals {
  
  loc_code            = var.env_type == "Primary" ? "weu" : "neu"  
  rg_name             = "rg-${var.env_prefix}-${local.loc_code}-${var.env_suffix}"
  consumptionModel    = var.env_type == "Primary" ? "AlwaysOn" : "DR"
  
  tags_common = {
    application-name           = "360"
    BusinessService            = "Admin Service"
    application-owner          = "Master Service"
    application-criticality    = "tier-2"
    business-unit-sponsor      = "Mr Mana"
    business-unit              = "g360"
    Department                 = "g360-vm" 
    ChargingPIN                = "v12312"
    cost-center                = "v12312"
    environment-type           = var.env_name
    EnvironmentInstance        = var.env_instance 
    Resilience                 = var.env_type
    ConsumptionModel           = local.consumptionModel
    data-classification        = ""
  }
  
  tags_rg = merge(local.tags_common,    
    tomap({"BusinessService"            = "g360 Resource",            
            "ResourceFunction"          = "g360 Code Quality Resource",
            "ResourceSubFunction"       = "g360 Resource Group"
          }
            
          ))

  
  tags_sonar_vm = merge(local.tags_common,    
    tomap({"BusinessService"            = "360 Resource",            
            "ResourceFunction"          = "360 Code Quality Resource",
            "ResourceSubFunction"       = "360 VM"
          }
            
          ))
}
