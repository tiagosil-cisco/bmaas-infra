resource "aci_vmm_credential" "vmm_credentials" {
  vmm_domain_dn = aci_vmm_domain.vmm_vmware.id
  name          = "${var.project_name}-creds"
  pwd           = var.credentials.vmware.password
  usr           = var.credentials.vmware.username
}