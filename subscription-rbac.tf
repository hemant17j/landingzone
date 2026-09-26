resource "azurerm_role_assignment" "root_network_contributor" {
  scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_definition_name = "Network Contributor"
  principal_id         = "11111111-1111-1111-1111-111111111111"
}

resource "azurerm_role_assignment" "root_storage_account_contributor" {
  scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_definition_name = "Storage Account Contributor"
  principal_id         = "11111111-1111-1111-1111-111111111111"
}

resource "azurerm_role_assignment" "root_storage_blob_data_contributor" {
  scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = "11111111-1111-1111-1111-111111111111"
}

resource "azurerm_role_assignment" "root_key_vault_contributor" {
  scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_definition_name = "Key Vault Contributor"
  principal_id         = "11111111-1111-1111-1111-111111111111"
}

resource "azurerm_role_assignment" "root_key_vault_secrets_user" {
  scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_definition_name = "Key Vault Secrets User"
  principal_id         = "11111111-1111-1111-1111-111111111111"
}

resource "azurerm_role_assignment" "root_acr_push" {
  scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_definition_name = "AcrPush"
  principal_id         = "11111111-1111-1111-1111-111111111111"
}

resource "azurerm_role_assignment" "root_acr_delete" {
  scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_definition_name = "AcrDelete"
  principal_id         = "11111111-1111-1111-1111-111111111111"
}

resource "azurerm_role_assignment" "root_aks_contributor" {
  scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_definition_name = "Azure Kubernetes Service Contributor"
  principal_id         = "11111111-1111-1111-1111-111111111111"
}

resource "azurerm_role_assignment" "root_aks_rbac_cluster_admin" {
  scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_definition_name = "Azure Kubernetes Service RBAC Cluster Admin"
  principal_id         = "11111111-1111-1111-1111-111111111111"
}

resource "azurerm_role_assignment" "root_managed_identity_contributor" {
  scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_definition_name = "Managed Identity Contributor"
  principal_id         = "11111111-1111-1111-1111-111111111111"
}

resource "azurerm_role_assignment" "root_managed_identity_operator" {
  scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_definition_name = "Managed Identity Operator"
  principal_id         = "11111111-1111-1111-1111-111111111111"
}

resource "azurerm_role_assignment" "root_monitoring_contributor" {
  scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_definition_name = "Monitoring Contributor"
  principal_id         = "11111111-1111-1111-1111-111111111111"
}

resource "azurerm_role_assignment" "root_log_analytics_contributor" {
  scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_definition_name = "Log Analytics Contributor"
  principal_id         = "11111111-1111-1111-1111-111111111111"
}

resource "azurerm_role_assignment" "root_user_access_administrator" {
  scope                = "/subscriptions/00000000-0000-0000-0000-000000000000"
  role_definition_name = "User Access Administrator"
  principal_id         = "11111111-1111-1111-1111-111111111111"
}
