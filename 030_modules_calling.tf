
module "aci_fabric_access_policies" {

  source = "./modules/aci_fabric_access_policies"

  credentials  = var.credentials
  project_name = local.project_name

}

module "vmm_vmware" {
  depends_on = [module.aci_fabric_access_policies]
  source     = "./modules/vmm_vmware"

  credentials   = var.credentials
  project_name  = local.project_name
  vmm_vlan_pool = module.aci_fabric_access_policies.aci_vlan_pool

}

