variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "dns_prefix" {
  type    = string
  default = "cluster.local"
}

variable "node_count" {
  type    = number
  default = 3
}

variable "kubernetes_version" {
  type    = string
  default = "1.20.9"
}

variable "vm_size" {
  type    = string
  default = "Standard_D2_v2"
}

variable "tags" {
  description = "A map of tags to be associated with the resources created."
  default     = {}
  type        = map(any)
}

variable "sku" {
  type    = string
  default = "Standard"
}

variable "api_server_authorized_ip_ranges" {
  description = "The IP ranges to allow for incoming traffic to the server nodes."
  type        = list(string)
}