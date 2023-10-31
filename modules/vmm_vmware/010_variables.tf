variable "credentials" {}
variable "project_name" {}
variable "vmm_vlan_pool" {}

locals {
  vmm_vlan_pool_name = "BRATTICE-VMM-DOMAIN"
  vmware_datacenter  = "GEPPETTO"
  vmware_mgmt_epg    = "uni/tn-mgmt/ap-INBAND/epg-INBAND"
  vmware_dvs_version = "7.0"
}