resource "azurerm_virtual_network_peering" "mw01_to_mw02" {
  name                      = "peer-mw01-to-mw02"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw02_to_mw01" {
  name                      = "peer-mw02-to-mw01"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw01_to_isc01" {
  name                      = "peer-mw01-to-isc01"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc01_to_mw01" {
  name                      = "peer-isc01-to-mw01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw01_to_isc02" {
  name                      = "peer-mw01-to-isc02"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc02_to_mw01" {
  name                      = "peer-isc02-to-mw01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw01_to_ea01" {
  name                      = "peer-mw01-to-ea01"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea01_to_mw01" {
  name                      = "peer-ea01-to-mw01"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw01_to_ea02" {
  name                      = "peer-mw01-to-ea02"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea02_to_mw01" {
  name                      = "peer-ea02-to-mw01"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw01_to_un01" {
  name                      = "peer-mw01-to-un01"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un01_to_mw01" {
  name                      = "peer-un01-to-mw01"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw01_to_un02" {
  name                      = "peer-mw01-to-un02"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un02_to_mw01" {
  name                      = "peer-un02-to-mw01"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw01_to_kc01" {
  name                      = "peer-mw01-to-kc01"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc01_to_mw01" {
  name                      = "peer-kc01-to-mw01"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw01_to_kc02" {
  name                      = "peer-mw01-to-kc02"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc02_to_mw01" {
  name                      = "peer-kc02-to-mw01"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw02_to_isc01" {
  name                      = "peer-mw02-to-isc01"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc01_to_mw02" {
  name                      = "peer-isc01-to-mw02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw02_to_isc02" {
  name                      = "peer-mw02-to-isc02"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc02_to_mw02" {
  name                      = "peer-isc02-to-mw02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw02_to_ea01" {
  name                      = "peer-mw02-to-ea01"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea01_to_mw02" {
  name                      = "peer-ea01-to-mw02"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw02_to_ea02" {
  name                      = "peer-mw02-to-ea02"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea02_to_mw02" {
  name                      = "peer-ea02-to-mw02"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw02_to_un01" {
  name                      = "peer-mw02-to-un01"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un01_to_mw02" {
  name                      = "peer-un01-to-mw02"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw02_to_un02" {
  name                      = "peer-mw02-to-un02"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un02_to_mw02" {
  name                      = "peer-un02-to-mw02"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw02_to_kc01" {
  name                      = "peer-mw02-to-kc01"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc01_to_mw02" {
  name                      = "peer-kc01-to-mw02"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "mw02_to_kc02" {
  name                      = "peer-mw02-to-kc02"
  resource_group_name       = "rg-appnet-dev-mw-01"
  virtual_network_name      = "vnet-app-dev-mw-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc02_to_mw02" {
  name                      = "peer-kc02-to-mw02"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc01_to_isc02" {
  name                      = "peer-isc01-to-isc02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc02_to_isc01" {
  name                      = "peer-isc02-to-isc01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc01_to_ea01" {
  name                      = "peer-isc01-to-ea01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea01_to_isc01" {
  name                      = "peer-ea01-to-isc01"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc01_to_ea02" {
  name                      = "peer-isc01-to-ea02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea02_to_isc01" {
  name                      = "peer-ea02-to-isc01"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc01_to_un01" {
  name                      = "peer-isc01-to-un01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un01_to_isc01" {
  name                      = "peer-un01-to-isc01"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc01_to_un02" {
  name                      = "peer-isc01-to-un02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un02_to_isc01" {
  name                      = "peer-un02-to-isc01"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc01_to_kc01" {
  name                      = "peer-isc01-to-kc01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc01_to_isc01" {
  name                      = "peer-kc01-to-isc01"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc01_to_kc02" {
  name                      = "peer-isc01-to-kc02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc02_to_isc01" {
  name                      = "peer-kc02-to-isc01"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc02_to_ea01" {
  name                      = "peer-isc02-to-ea01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea01_to_isc02" {
  name                      = "peer-ea01-to-isc02"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc02_to_ea02" {
  name                      = "peer-isc02-to-ea02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea02_to_isc02" {
  name                      = "peer-ea02-to-isc02"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc02_to_un01" {
  name                      = "peer-isc02-to-un01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un01_to_isc02" {
  name                      = "peer-un01-to-isc02"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc02_to_un02" {
  name                      = "peer-isc02-to-un02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un02_to_isc02" {
  name                      = "peer-un02-to-isc02"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc02_to_kc01" {
  name                      = "peer-isc02-to-kc01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc01_to_isc02" {
  name                      = "peer-kc01-to-isc02"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "isc02_to_kc02" {
  name                      = "peer-isc02-to-kc02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc02_to_isc02" {
  name                      = "peer-kc02-to-isc02"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea01_to_ea02" {
  name                      = "peer-ea01-to-ea02"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea02_to_ea01" {
  name                      = "peer-ea02-to-ea01"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea01_to_un01" {
  name                      = "peer-ea01-to-un01"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un01_to_ea01" {
  name                      = "peer-un01-to-ea01"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea01_to_un02" {
  name                      = "peer-ea01-to-un02"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un02_to_ea01" {
  name                      = "peer-un02-to-ea01"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea01_to_kc01" {
  name                      = "peer-ea01-to-kc01"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc01_to_ea01" {
  name                      = "peer-kc01-to-ea01"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea01_to_kc02" {
  name                      = "peer-ea01-to-kc02"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc02_to_ea01" {
  name                      = "peer-kc02-to-ea01"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea02_to_un01" {
  name                      = "peer-ea02-to-un01"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un01_to_ea02" {
  name                      = "peer-un01-to-ea02"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea02_to_un02" {
  name                      = "peer-ea02-to-un02"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un02_to_ea02" {
  name                      = "peer-un02-to-ea02"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea02_to_kc01" {
  name                      = "peer-ea02-to-kc01"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc01_to_ea02" {
  name                      = "peer-kc01-to-ea02"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "ea02_to_kc02" {
  name                      = "peer-ea02-to-kc02"
  resource_group_name       = "rg-appnet-dev-ea-01"
  virtual_network_name      = "vnet-app-dev-ea-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc02_to_ea02" {
  name                      = "peer-kc02-to-ea02"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un01_to_un02" {
  name                      = "peer-un01-to-un02"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un02_to_un01" {
  name                      = "peer-un02-to-un01"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un01_to_kc01" {
  name                      = "peer-un01-to-kc01"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc01_to_un01" {
  name                      = "peer-kc01-to-un01"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un01_to_kc02" {
  name                      = "peer-un01-to-kc02"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc02_to_un01" {
  name                      = "peer-kc02-to-un01"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un02_to_kc01" {
  name                      = "peer-un02-to-kc01"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc01_to_un02" {
  name                      = "peer-kc01-to-un02"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "un02_to_kc02" {
  name                      = "peer-un02-to-kc02"
  resource_group_name       = "rg-appnet-dev-un-01"
  virtual_network_name      = "vnet-app-dev-un-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc02_to_un02" {
  name                      = "peer-kc02-to-un02"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc01_to_kc02" {
  name                      = "peer-kc01-to-kc02"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-01"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}

resource "azurerm_virtual_network_peering" "kc02_to_kc01" {
  name                      = "peer-kc02-to-kc01"
  resource_group_name       = "rg-appnet-dev-kc-01"
  virtual_network_name      = "vnet-app-dev-kc-02"
  remote_virtual_network_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false
}
