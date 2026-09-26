resource "azurerm_role_assignment" "root_network_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Network Contributor"
  principal_id         = "5c31484e-cd53-4e9e-b30e-b29fb9f867a3"
}

resource "azurerm_role_assignment" "root_storage_account_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Storage Account Contributor"
  principal_id         = "5c31484e-cd53-4e9e-b30e-b29fb9f867a3"
}

resource "azurerm_role_assignment" "root_storage_blob_data_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = "5c31484e-cd53-4e9e-b30e-b29fb9f867a3"
}

resource "azurerm_role_assignment" "root_key_vault_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Key Vault Contributor"
  principal_id         = "5c31484e-cd53-4e9e-b30e-b29fb9f867a3"
}

resource "azurerm_role_assignment" "root_key_vault_secrets_user" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Key Vault Secrets User"
  principal_id         = "5c31484e-cd53-4e9e-b30e-b29fb9f867a3"
}

resource "azurerm_role_assignment" "root_acr_push" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "AcrPush"
  principal_id         = "5c31484e-cd53-4e9e-b30e-b29fb9f867a3"
}

resource "azurerm_role_assignment" "root_acr_delete" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "AcrDelete"
  principal_id         = "5c31484e-cd53-4e9e-b30e-b29fb9f867a3"
}

resource "azurerm_role_assignment" "root_aks_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Azure Kubernetes Service Contributor"
  principal_id         = "5c31484e-cd53-4e9e-b30e-b29fb9f867a3"
}

resource "azurerm_role_assignment" "root_aks_rbac_cluster_admin" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Azure Kubernetes Service RBAC Cluster Admin"
  principal_id         = "5c31484e-cd53-4e9e-b30e-b29fb9f867a3"
}

resource "azurerm_role_assignment" "root_managed_identity_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Managed Identity Contributor"
  principal_id         = "5c31484e-cd53-4e9e-b30e-b29fb9f867a3"
}

resource "azurerm_role_assignment" "root_managed_identity_operator" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Managed Identity Operator"
  principal_id         = "5c31484e-cd53-4e9e-b30e-b29fb9f867a3"
}

resource "azurerm_role_assignment" "root_monitoring_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Monitoring Contributor"
  principal_id         = "5c31484e-cd53-4e9e-b30e-b29fb9f867a3"
}

resource "azurerm_role_assignment" "root_log_analytics_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Log Analytics Contributor"
  principal_id         = "5c31484e-cd53-4e9e-b30e-b29fb9f867a3"
}

resource "azurerm_role_assignment" "root_user_access_administrator" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "User Access Administrator"
  principal_id         = "5c31484e-cd53-4e9e-b30e-b29fb9f867a3"
}
