resource "aci_vmm_domain" "vmm_vmware" {
  provider_profile_dn       = "uni/vmmp-VMware"
  name                      = var.project_name
  access_mode               = "read-write"
  relation_infra_rs_vlan_ns = var.vmm_vlan_pool[local.vmm_vlan_pool_name].id
}


