# VLAN pools
resource "aci_vlan_pool" "vlan_pools" {
  for_each    = var.vlan_pools
  name        = each.key
  description = each.value.desc
  alloc_mode  = each.value.allocation
}
/*
# VLAN pool ranges
resource "aci_ranges" "vlan_pool_ranges" {
  for_each     = var.vlan_ranges
  vlan_pool_dn = aci_vlan_pool.vlan_pools[each.value.vlan_pool].id
  from         = "vlan-${each.value.start}"
  to           = "vlan-${each.value.end}"
  alloc_mode   = each.value.allocation
}
*/