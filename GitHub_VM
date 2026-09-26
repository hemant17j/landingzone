provider "azurerm" {
  features {}
}

###################################################
# Public IP
###################################################

resource "azurerm_public_ip" "github_vm" {
  name                = "pip-githubactions-dev-inc-01"
  location            = "eastasia"
  resource_group_name = "rg-app-dev-ea-01"

  allocation_method = "Static"
  sku               = "Standard"

  tags = {
    Environment = "Dev"
    Workload    = "GitHubActions"
  }
}

###################################################
# Network Interface
###################################################

resource "azurerm_network_interface" "github_vm" {
  name                = "nic-githubactions-dev-inc-01"
  location            = "eastasia"
  resource_group_name = "rg-app-dev-ea-01"

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "/subscriptions/REPLACE_SUBSCRIPTION_ID/resourceGroups/rg-appnet-dev-ea-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-ea-01/subnets/subnet-app-dev-ea-01"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.github_vm.id
  }

  tags = {
    Environment = "Dev"
    Workload    = "GitHubActions"
  }
}

###################################################
# Linux Virtual Machine
###################################################

resource "azurerm_linux_virtual_machine" "github_actions" {
  name                = "vm-githubactions-dev-inc-01"
  location            = "eastasia"
  resource_group_name = "rg-app-dev-ea-01"

  size = "Standard_D4s_v5"

  admin_username = "hemant"
  admin_password = "Hemant@1234567"

  disable_password_authentication = false

  custom_data = base64encode(
    data.local_file.github_cloudinit.content
  )

  network_interface_ids = [
    azurerm_network_interface.github_vm.id
  ]

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
    name                 = "osdisk-githubactions-dev-inc-01"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = {
    Environment = "Dev"
    Workload    = "GitHubActions"
  }
}

###################################################
# Key Vault Lookup
###################################################

data "azurerm_key_vault" "github" {
  name                = "kv-github-dev-inc-01"
  resource_group_name = "rg-app-dev-ea-01"
}

###################################################
# Key Vault Access
###################################################

resource "azurerm_role_assignment" "github_vm_keyvault_secrets_user" {
  scope                = data.azurerm_key_vault.github.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_linux_virtual_machine.github_actions.identity[0].principal_id
}
