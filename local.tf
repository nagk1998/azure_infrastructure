locals {
  cde_rg_name          = "cde-pipeline-${var.environment}"
  cde_keyvault_name    = "cde-keyvault-${var.environment}"
  cde_appinsights_name = "cde-applicationinsights-${var.environment}"
  cde_vnet_name        = "cde-vnet-${var.environment}"
  cde_datafactory_name = "cde-datafactory-${var.environment}"
  catalog_name         = "${var.environment}_opi_dep"

  navigator_rg_name = "functionapp-rg-${var.environment}"



  navigator_tags = merge(var.tags, {
    app                 = "Rest API"
    Team                = "Navigator"
    Environment         = var.environment
    EISEndorsedSolution = true
    "IaC Repo"          = "Azure_Infrastructure"
  })



}

