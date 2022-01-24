resource_group_name             = "FFive"
cluster_name                    = "os-prod2"
tags                            = { project = "aks" }
dns_prefix                      = "os-int"
api_server_authorized_ip_ranges = ["0.0.0.0/32", "62.0.0.0/24"]
