data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

module "aks" {
  source = "../../modules/aks"

  cluster_name                    = var.cluster_name
  resource_group_name             = data.azurerm_resource_group.this.name
  location                        = data.azurerm_resource_group.this.location
  tags                            = var.tags
  dns_prefix                      = var.dns_prefix
  api_server_authorized_ip_ranges = var.api_server_authorized_ip_ranges
}
