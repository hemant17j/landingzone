resource "azurerm_resource_group" "app_dev_isc" {
  name     = "rg-app-dev-isc-01"
  location = "indiasouthcentral"
}

resource "azurerm_resource_group" "appnet_dev_isc" {
  name     = "rg-appnet-dev-isc-01"
  location = "indiasouthcentral"
}

resource "azurerm_virtual_network" "app_dev_isc_01" {
  name                = "vnet-app-dev-isc-01"
  location            = "indiasouthcentral"
  resource_group_name = "rg-appnet-dev-isc-01"
  address_space       = ["10.20.0.0/16"]

  depends_on = [azurerm_resource_group.appnet_dev_isc]
}

resource "azurerm_subnet" "app_dev_isc_vnet01_subnet01" {
  name                 = "subnet-app-dev-isc-01"
  resource_group_name  = "rg-appnet-dev-isc-01"
  virtual_network_name = "vnet-app-dev-isc-01"
  address_prefixes     = ["10.20.1.0/24"]

  depends_on = [azurerm_virtual_network.app_dev_isc_01]
}

resource "azurerm_network_security_group" "app_dev_isc_01" {
  name                = "nsg-app-dev-isc-01"
  location            = "indiasouthcentral"
  resource_group_name = "rg-appnet-dev-isc-01"

  security_rule {
    name                       = "Allow-SSH-Any"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-RDP-Any"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-Database-VirtualNetwork"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["1433", "1521", "3306", "5432", "6379", "27017"]
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }

  security_rule {
    name                       = "Allow-Application-VirtualNetwork"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["80", "443", "8080", "8081", "8443", "9000"]
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }

  depends_on = [azurerm_resource_group.appnet_dev_isc]
}

resource "azurerm_subnet_network_security_group_association" "app_dev_isc_vnet01_subnet01" {
  subnet_id                 = azurerm_subnet.app_dev_isc_vnet01_subnet01.id
  network_security_group_id = azurerm_network_security_group.app_dev_isc_01.id
}

resource "azurerm_route_table" "app_dev_isc_01" {
  name                          = "rt-app-dev-isc-01"
  location                      = "indiasouthcentral"
  resource_group_name           = "rg-appnet-dev-isc-01"
  bgp_route_propagation_enabled = true

  depends_on = [azurerm_resource_group.appnet_dev_isc]
}

resource "azurerm_subnet_route_table_association" "app_dev_isc_vnet01_subnet01" {
  subnet_id      = azurerm_subnet.app_dev_isc_vnet01_subnet01.id
  route_table_id = azurerm_route_table.app_dev_isc_01.id
}

resource "azurerm_subnet" "app_dev_isc_vnet01_subnet02" {
  name                 = "subnet-app-dev-isc-02"
  resource_group_name  = "rg-appnet-dev-isc-01"
  virtual_network_name = "vnet-app-dev-isc-01"
  address_prefixes     = ["10.20.2.0/24"]

  depends_on = [azurerm_virtual_network.app_dev_isc_01]
}

resource "azurerm_network_security_group" "app_dev_isc_02" {
  name                = "nsg-app-dev-isc-02"
  location            = "indiasouthcentral"
  resource_group_name = "rg-appnet-dev-isc-01"

  security_rule {
    name                       = "Allow-SSH-Any"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-RDP-Any"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-Database-VirtualNetwork"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["1433", "1521", "3306", "5432", "6379", "27017"]
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }

  security_rule {
    name                       = "Allow-Application-VirtualNetwork"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["80", "443", "8080", "8081", "8443", "9000"]
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }

  depends_on = [azurerm_resource_group.appnet_dev_isc]
}

resource "azurerm_subnet_network_security_group_association" "app_dev_isc_vnet01_subnet02" {
  subnet_id                 = azurerm_subnet.app_dev_isc_vnet01_subnet02.id
  network_security_group_id = azurerm_network_security_group.app_dev_isc_02.id
}

resource "azurerm_route_table" "app_dev_isc_02" {
  name                          = "rt-app-dev-isc-02"
  location                      = "indiasouthcentral"
  resource_group_name           = "rg-appnet-dev-isc-01"
  bgp_route_propagation_enabled = true

  depends_on = [azurerm_resource_group.appnet_dev_isc]
}

resource "azurerm_subnet_route_table_association" "app_dev_isc_vnet01_subnet02" {
  subnet_id      = azurerm_subnet.app_dev_isc_vnet01_subnet02.id
  route_table_id = azurerm_route_table.app_dev_isc_02.id
}

resource "azurerm_virtual_network" "app_dev_isc_02" {
  name                = "vnet-app-dev-isc-02"
  location            = "indiasouthcentral"
  resource_group_name = "rg-appnet-dev-isc-01"
  address_space       = ["10.21.0.0/16"]

  depends_on = [azurerm_resource_group.appnet_dev_isc]
}

resource "azurerm_subnet" "app_dev_isc_vnet02_subnet01" {
  name                 = "subnet-app-dev-isc-01"
  resource_group_name  = "rg-appnet-dev-isc-01"
  virtual_network_name = "vnet-app-dev-isc-02"
  address_prefixes     = ["10.21.1.0/24"]

  depends_on = [azurerm_virtual_network.app_dev_isc_02]
}

resource "azurerm_network_security_group" "app_dev_isc_03" {
  name                = "nsg-app-dev-isc-03"
  location            = "indiasouthcentral"
  resource_group_name = "rg-appnet-dev-isc-01"

  security_rule {
    name                       = "Allow-SSH-Any"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-RDP-Any"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-Database-VirtualNetwork"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["1433", "1521", "3306", "5432", "6379", "27017"]
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }

  security_rule {
    name                       = "Allow-Application-VirtualNetwork"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["80", "443", "8080", "8081", "8443", "9000"]
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }

  depends_on = [azurerm_resource_group.appnet_dev_isc]
}

resource "azurerm_subnet_network_security_group_association" "app_dev_isc_vnet02_subnet01" {
  subnet_id                 = azurerm_subnet.app_dev_isc_vnet02_subnet01.id
  network_security_group_id = azurerm_network_security_group.app_dev_isc_03.id
}

resource "azurerm_route_table" "app_dev_isc_03" {
  name                          = "rt-app-dev-isc-03"
  location                      = "indiasouthcentral"
  resource_group_name           = "rg-appnet-dev-isc-01"
  bgp_route_propagation_enabled = true

  depends_on = [azurerm_resource_group.appnet_dev_isc]
}

resource "azurerm_subnet_route_table_association" "app_dev_isc_vnet02_subnet01" {
  subnet_id      = azurerm_subnet.app_dev_isc_vnet02_subnet01.id
  route_table_id = azurerm_route_table.app_dev_isc_03.id
}

resource "azurerm_subnet" "app_dev_isc_vnet02_subnet02" {
  name                 = "subnet-app-dev-isc-02"
  resource_group_name  = "rg-appnet-dev-isc-01"
  virtual_network_name = "vnet-app-dev-isc-02"
  address_prefixes     = ["10.21.2.0/24"]

  depends_on = [azurerm_virtual_network.app_dev_isc_02]
}

resource "azurerm_network_security_group" "app_dev_isc_04" {
  name                = "nsg-app-dev-isc-04"
  location            = "indiasouthcentral"
  resource_group_name = "rg-appnet-dev-isc-01"

  security_rule {
    name                       = "Allow-SSH-Any"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-RDP-Any"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-Database-VirtualNetwork"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["1433", "1521", "3306", "5432", "6379", "27017"]
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }

  security_rule {
    name                       = "Allow-Application-VirtualNetwork"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["80", "443", "8080", "8081", "8443", "9000"]
    source_address_prefix      = "VirtualNetwork"
    destination_address_prefix = "VirtualNetwork"
  }

  depends_on = [azurerm_resource_group.appnet_dev_isc]
}

resource "azurerm_subnet_network_security_group_association" "app_dev_isc_vnet02_subnet02" {
  subnet_id                 = azurerm_subnet.app_dev_isc_vnet02_subnet02.id
  network_security_group_id = azurerm_network_security_group.app_dev_isc_04.id
}

resource "azurerm_route_table" "app_dev_isc_04" {
  name                          = "rt-app-dev-isc-04"
  location                      = "indiasouthcentral"
  resource_group_name           = "rg-appnet-dev-isc-01"
  bgp_route_propagation_enabled = true

  depends_on = [azurerm_resource_group.appnet_dev_isc]
}

resource "azurerm_subnet_route_table_association" "app_dev_isc_vnet02_subnet02" {
  subnet_id      = azurerm_subnet.app_dev_isc_vnet02_subnet02.id
  route_table_id = azurerm_route_table.app_dev_isc_04.id
}

resource "azurerm_virtual_network_peering" "isc01_to_mw01" {
  name                      = "peer-isc01-to-mw01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_01]
}

resource "azurerm_virtual_network_peering" "isc01_to_mw02" {
  name                      = "peer-isc01-to-mw02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_01]
}

resource "azurerm_virtual_network_peering" "isc01_to_isc02" {
  name                      = "peer-isc01-to-isc02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_01]
}

resource "azurerm_virtual_network_peering" "isc01_to_ea01" {
  name                      = "peer-isc01-to-ea01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_01]
}

resource "azurerm_virtual_network_peering" "isc01_to_ea02" {
  name                      = "peer-isc01-to-ea02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_01]
}

resource "azurerm_virtual_network_peering" "isc01_to_un01" {
  name                      = "peer-isc01-to-un01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_01]
}

resource "azurerm_virtual_network_peering" "isc01_to_un02" {
  name                      = "peer-isc01-to-un02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_01]
}

resource "azurerm_virtual_network_peering" "isc01_to_kc01" {
  name                      = "peer-isc01-to-kc01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_01]
}

resource "azurerm_virtual_network_peering" "isc01_to_kc02" {
  name                      = "peer-isc01-to-kc02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-01"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_01]
}

resource "azurerm_virtual_network_peering" "isc02_to_mw01" {
  name                      = "peer-isc02-to-mw01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_02]
}

resource "azurerm_virtual_network_peering" "isc02_to_mw02" {
  name                      = "peer-isc02-to-mw02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-mw-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-mw-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_02]
}

resource "azurerm_virtual_network_peering" "isc02_to_isc01" {
  name                      = "peer-isc02-to-isc01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_02]
}

resource "azurerm_virtual_network_peering" "isc02_to_ea01" {
  name                      = "peer-isc02-to-ea01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_02]
}

resource "azurerm_virtual_network_peering" "isc02_to_ea02" {
  name                      = "peer-isc02-to-ea02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_02]
}

resource "azurerm_virtual_network_peering" "isc02_to_un01" {
  name                      = "peer-isc02-to-un01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_02]
}

resource "azurerm_virtual_network_peering" "isc02_to_un02" {
  name                      = "peer-isc02-to-un02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-un-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-un-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_02]
}

resource "azurerm_virtual_network_peering" "isc02_to_kc01" {
  name                      = "peer-isc02-to-kc01"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-01"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_02]
}

resource "azurerm_virtual_network_peering" "isc02_to_kc02" {
  name                      = "peer-isc02-to-kc02"
  resource_group_name       = "rg-appnet-dev-isc-01"
  virtual_network_name      = "vnet-app-dev-isc-02"
  remote_virtual_network_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-kc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-kc-02"

  allow_virtual_network_access = true
  allow_forwarded_traffic      = false
  allow_gateway_transit        = false
  use_remote_gateways          = false

  depends_on = [azurerm_virtual_network.app_dev_isc_02]
}
