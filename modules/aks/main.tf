resource "azurerm_kubernetes_cluster" "this" {
  name                    = var.cluster_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_prefix              = var.dns_prefix
  kubernetes_version      = var.kubernetes_version
  private_cluster_enabled = false
  # automatic_channel_upgrade = "none"
  # Since "none" is not honored by Terraform now, we need to enable
  # preview on Azure:
  # az feature register --namespace Microsoft.ContainerService -n AutoUpgradePreview
  public_network_access_enabled   = true
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges


  default_node_pool {
    name                         = "system"
    node_count                   = var.node_count
    vm_size                      = var.vm_size
    only_critical_addons_enabled = true
    enable_auto_scaling          = false
    availability_zones           = ["1", "2", "3"]
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  tags = var.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "node_work" {
  name                  = "workload"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size               = "Standard_D4_v3"
  node_count            = 1

  tags = {
    Environment = "Production"
  }
}