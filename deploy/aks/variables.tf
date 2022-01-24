variable "resource_group_name" {
  description = "Name of the Resource Group to create."
  type        = string
}

variable "cluster_name" {
  description = "Name of the Kubernetes Cluster."
  type        = string
}

variable "dns_prefix" {
  description = "Name of the DNS Prefix."
  type        = string
}

variable "tags" {
  type = map(string)
}

variable "api_server_authorized_ip_ranges" {
  description = "The IP ranges to allow for incoming traffic to the server nodes."
  type        = list(string)
}
