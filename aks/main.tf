terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id                 = "3aee3430-ef4c-4171-b904-ec2dd5416a82"
  resource_provider_registrations = "none"
}

# ============================================================
# SSH KEY GENERATION & LOCAL STORAGE
# ============================================================

resource "tls_private_key" "aks" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Saves the private key (.pem) to your local directory
resource "local_sensitive_file" "aks_private_key" {
  content         = tls_private_key.aks.private_key_pem
  filename        = "${path.module}/aks-node-key.pem"
  file_permission = "0600"
}

# Azure metadata object for public key
resource "azurerm_ssh_public_key" "aks" {
  name                = "sshkey-aks-private-01"
  resource_group_name = "rg-app-dev-isc-01"
  location            = "eastus"

  public_key = tls_private_key.aks.public_key_openssh

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

# ============================================================
# MANAGED IDENTITY & NETWORK RBAC
# ============================================================

resource "azurerm_user_assigned_identity" "aks" {
  name                = "id-aks-dev-isc-01"
  resource_group_name = "rg-app-dev-isc-01"
  location            = "eastus"

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

# Grants the cluster identity permission to attach NICs to your subnet
resource "azurerm_role_assignment" "aks_network_contributor" {
  scope                = "/subscriptions/SUBSCRIPTION_ID/resourceGroups/my-existing-rg/providers/Microsoft.Network/virtualNetworks/my-existing-vnet/subnets/aks-subnet"
  role_definition_name = "Network Contributor"
  principal_id         = azurerm_user_assigned_identity.aks.principal_id
  principal_type       = "ServicePrincipal"

  skip_service_principal_aad_check = true
}

# ============================================================
# PRIVATE AKS CLUSTER
# ============================================================

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-dev-cluster-isc-01"
  location            = "eastus"
  resource_group_name = "rg-app-dev-isc-01"
  dns_prefix          = "aks"

  # Enforce private control plane
  private_cluster_enabled = true

  # Azure creates and manages the private DNS zone automatically in the node resource group
  private_dns_zone_id = "System"

  # Identity configuration
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks.id]
  }

  # Node pool configuration
  default_node_pool {
    name           = "system"
    node_count     = 2
    vm_size        = "Standard_D2s_v5"
    vnet_subnet_id = "/subscriptions/3aee3430-ef4c-4171-b904-ec2dd5416a82/resourceGroups/rg-appnet-dev-isc-01/providers/Microsoft.Network/virtualNetworks/vnet-app-dev-isc-01"
    type           = "VirtualMachineScaleSets"
  }

  # Modern Azure CNI Overlay networking
  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    load_balancer_sku   = "standard"

    pod_cidr       = "10.0.2.0/16"
    service_cidr   = "10.0.1.0/16"
    dns_service_ip = "10.0.1.10"
  }

  # Linux OS credentials injected into all nodes
  linux_profile {
    admin_username = "hemant"

    ssh_key {
      key_data = tls_private_key.aks.public_key_openssh
    }
  }

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }

  depends_on = [
    azurerm_role_assignment.aks_network_contributor
  ]
}
