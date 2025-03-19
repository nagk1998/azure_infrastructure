# RESOURCE GROUP
resource "azurerm_resource_group" "restapp_rg" {
  name     = local.navigator_rg_name
  location = var.location
  tags     = local.navigator_tags
}

#########################################################
################## STORAGE ACCOUNT ######################
#########################################################

resource "azurerm_storage_account" "navigator_adls_storage" {
  name                             = "fasa{var.environment}"
  resource_group_name              = azurerm_resource_group.restapp_rg.name
  location                         = azurerm_resource_group.restapp_rg.location
  account_kind                     = "StorageV2"
  account_tier                     = "Standard"
  allow_nested_items_to_be_public  = false
  cross_tenant_replication_enabled = false
  enable_https_traffic_only        = true
  is_hns_enabled                   = true
  account_replication_type         = "RAGRS"
  access_tier                      = "Hot"

  network_rules {
    default_action = "Allow"
    bypass         = ["AzureServices"]
  }

  min_tls_version = "TLS1_2"

  tags = local.navigator_tags
}

# Storage Container
resource "azurerm_storage_container" "navigator_blob_container" {
  name                  = "navigator"
  storage_account_name  = azurerm_storage_account.navigator_adls_storage.name
  container_access_type = "private"
}



