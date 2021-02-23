variable "user_names" {
  description = "Create IAM users with these names"
  type        = list(string)
  default     = ["student1", "student2", "student3"]
}

variable "nic_numbers" {
  description = "map of VMs and private ips"
  default     = {
    "1" = "nic-vm1"
    "2" = "nic-vm2"
    "3" = "nic-vm3"
  }
}

variable "azure-subscription-id" {
  type        = string
  description = "Azure Subscription Id"
}
variable "azure-client-id" {
  type        = string
  description = "Azure Client Id/appId"
}
variable "azure-client-secret" {
  type        = string
  description = "Azure Client Id/appId"
}
variable "azure-tenant-id" {
  type        = string
  description = "Azure Tenant Id"
}