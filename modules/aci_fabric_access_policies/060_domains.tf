/*
# L3 Domains
resource "aci_l3_domain_profile" "l3_doms" {
  for_each = { for key, value in var.domains : key => value if value.type == "l3dom" }
  name     = each.key
}
*/
# Physical Domains
resource "aci_physical_domain" "phys_doms" {
  for_each                  = { for key, value in var.domains : key => value if value.type == "phys" }
  name                      = each.key
  relation_infra_rs_vlan_ns = aci_vlan_pool.vlan_pools[each.value.vlan_pool].id
}
