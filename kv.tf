resource "azurerm_key_vault" "github" {
  name                = "kv-github-dev-inc-01"
  location            = "eastasia"
  resource_group_name = "rg-app-dev-ea-01"

  tenant_id = "REPLACE_WITH_TENANT_ID"

  sku_name = "standard"

  enable_rbac_authorization     = true
  public_network_access_enabled = true

  purge_protection_enabled   = false
  soft_delete_retention_days = 7
}



resource "azurerm_private_dns_zone" "keyvault" {
  name                = "privatelink.vaultcore.azure.net"
  resource_group_name = "rg-appnet-dev-ea-01"
}



resource "azurerm_private_dns_zone_virtual_network_link" "keyvault_vnet01" {
  name                  = "pdnslink-keyvault-ea-vnet01"
  resource_group_name   = "rg-appnet-dev-ea-01"
  private_dns_zone_name = "privatelink.vaultcore.azure.net"

  virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-01"

  registration_enabled = false
}



resource "azurerm_private_endpoint" "keyvault" {
  name                = "pep-kv-github-dev-ea-01"
  location            = "eastasia"
  resource_group_name = "rg-appnet-dev-ea-01"

  subnet_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-01/subnets/subnet-app-dev-ea-01"

  private_service_connection {
    name                           = "psc-kv-github-dev-ea-01"
    private_connection_resource_id = azurerm_key_vault.github.id

    subresource_names = [
      "vault"
    ]

    is_manual_connection = false
  }

  private_dns_zone_group {
    name = "pdnszg-kv-github-dev-ea-01"

    private_dns_zone_ids = [
      azurerm_private_dns_zone.keyvault.id
    ]
  }
}



resource "azurerm_key_vault_secret" "github_client_id" {
  name         = "github-client-id"
  value        = "Iv23libuDCYzwklXQNT1"

  key_vault_id = azurerm_key_vault.github.id

  depends_on = [
    azurerm_private_endpoint.keyvault
  ]
}



resource "azurerm_key_vault_secret" "github_installation_id" {
  name         = "github-installation-id"
  value        = "157009367"

  key_vault_id = azurerm_key_vault.github.id

  depends_on = [
    azurerm_private_endpoint.keyvault
  ]
}



resource "azurerm_key_vault_secret" "github_private_key" {
  name = "github-private-key"

  value = file(
    "hemantrunner.2026-08-27.private-key.pem"
  )

  key_vault_id = azurerm_key_vault.github.id

  depends_on = [
    azurerm_private_endpoint.keyvault
  ]
}
