resource "aci_vmm_controller" "vmm_controller" {
  vmm_domain_dn             = aci_vmm_domain.vmm_vmware.id
  name                      = "${var.project_name}-vCenter"
  dvs_version               = local.vmware_dvs_version
  host_or_ip                = var.credentials.vmware.url
  root_cont_name            = local.vmware_datacenter
  stats_mode                = "enabled"
  relation_vmm_rs_acc       = aci_vmm_credential.vmm_credentials.id
  relation_vmm_rs_mgmt_e_pg = local.vmware_mgmt_epg


}