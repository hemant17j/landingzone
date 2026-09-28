provider "azurerm" {
  features {}
}

###################################################
# Public IP Prefix
###################################################

resource "azurerm_public_ip_prefix" "ado_vmss" {
  name                = "pipprefix-adoagents-dev-mw-01"
  location            = "malaysiawest"
  resource_group_name = "rg-app-dev-mw-01"

  prefix_length = 28
  sku           = "Standard"

  tags = {
    Environment = "Dev"
    Workload    = "ADOAgents"
  }
}

###################################################
# Azure DevOps Agent VMSS
###################################################

resource "azurerm_linux_virtual_machine_scale_set" "ado_agents" {

  name                = "vmss-adoagents-dev-mw-01"
  location            = "malaysiawest"
  resource_group_name = "rg-app-dev-mw-01"

  sku       = "Standard_B2ats_v2"
  instances = 1

  admin_username = "hemant"
  admin_password = "Hemant@1234567"

  disable_password_authentication = false

  custom_data = base64encode(
    data.local_file.github_cloudinit.content
  )

  identity {
    type = "SystemAssigned"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  network_interface {
    name    = "nic-adoagents-dev-mw-01"
    primary = true

    ip_configuration {
      name    = "internal"
      primary = true

      subnet_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-01/subnets/subnet-app-dev-mw-01"

      public_ip_address {
        name                = "pip-adoagents-dev-mw-01"
        public_ip_prefix_id = azurerm_public_ip_prefix.ado_vmss.id
      }
    }
  }

  tags = {
    Environment = "Dev"
    Workload    = "ADOAgents"
  }
}

###################################################
# Subscription Level RBAC Assignments
###################################################

resource "azurerm_role_assignment" "root_network_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_linux_virtual_machine_scale_set.ado_agents.identity[0].principal_id
}

resource "azurerm_role_assignment" "root_storage_account_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Storage Account Contributor"
  principal_id         = azurerm_linux_virtual_machine_scale_set.ado_agents.identity[0].principal_id
}

resource "azurerm_role_assignment" "root_storage_blob_data_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_linux_virtual_machine_scale_set.ado_agents.identity[0].principal_id
}

resource "azurerm_role_assignment" "root_key_vault_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Key Vault Contributor"
  principal_id         = azurerm_linux_virtual_machine_scale_set.ado_agents.identity[0].principal_id
}

resource "azurerm_role_assignment" "root_key_vault_secrets_user" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_linux_virtual_machine_scale_set.ado_agents.identity[0].principal_id
}

resource "azurerm_role_assignment" "root_acr_push" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "AcrPush"
  principal_id         = azurerm_linux_virtual_machine_scale_set.ado_agents.identity[0].principal_id
}

resource "azurerm_role_assignment" "root_acr_delete" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "AcrDelete"
  principal_id         = azurerm_linux_virtual_machine_scale_set.ado_agents.identity[0].principal_id
}

resource "azurerm_role_assignment" "root_aks_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Azure Kubernetes Service Contributor Role"
  principal_id         = azurerm_linux_virtual_machine_scale_set.ado_agents.identity[0].principal_id
}

resource "azurerm_role_assignment" "root_aks_rbac_cluster_admin" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Azure Kubernetes Service RBAC Cluster Admin"
  principal_id         = azurerm_linux_virtual_machine_scale_set.ado_agents.identity[0].principal_id
}

resource "azurerm_role_assignment" "root_managed_identity_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Managed Identity Contributor"
  principal_id         = azurerm_linux_virtual_machine_scale_set.ado_agents.identity[0].principal_id
}

resource "azurerm_role_assignment" "root_managed_identity_operator" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Managed Identity Operator"
  principal_id         = azurerm_linux_virtual_machine_scale_set.ado_agents.identity[0].principal_id
}

resource "azurerm_role_assignment" "root_monitoring_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Monitoring Contributor"
  principal_id         = azurerm_linux_virtual_machine_scale_set.ado_agents.identity[0].principal_id
}

resource "azurerm_role_assignment" "root_log_analytics_contributor" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Log Analytics Contributor"
  principal_id         = azurerm_linux_virtual_machine_scale_set.ado_agents.identity[0].principal_id
}

resource "azurerm_role_assignment" "root_user_access_administrator" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "User Access Administrator"
  principal_id         = azurerm_linux_virtual_machine_scale_set.ado_agents.identity[0].principal_id
}

resource "azurerm_role_assignment" "root_key_vault_administrator" {
  scope                = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82"
  role_definition_name = "Key Vault Administrator"
  principal_id         = azurerm_linux_virtual_machine_scale_set.ado_agents.identity[0].principal_id
}
