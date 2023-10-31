# VPC Access Port Policy Groups
resource "aci_leaf_access_bundle_policy_group" "leaf_vppgs" {
  for_each                      = var.leafs_vppg
  name                          = each.key
  relation_infra_rs_lacp_pol    = aci_lacp_policy.lacp_pols[each.value.channel_mode].id
  relation_infra_rs_lldp_if_pol = aci_lldp_interface_policy.lldp_pols[each.value.lldp].id
  relation_infra_rs_cdp_if_pol  = aci_cdp_interface_policy.cdp_pols[each.value.cdp].id
  relation_infra_rs_att_ent_p   = aci_attachable_access_entity_profile.aaeps[each.value.aaep].id
  lag_t                         = "node"
}

resource "aci_access_port_selector" "leaf_vpss" {
  for_each                       = { for key, value in var.interfaces : key => value if value.iftype == "vpc" }
  leaf_interface_profile_dn      = aci_leaf_interface_profile.li_profs[each.value.leaf].id
  name                           = each.key
  access_port_selector_type      = "range"
  relation_infra_rs_acc_base_grp = aci_leaf_access_bundle_policy_group.leaf_vppgs[each.value.polgrp].id
}

resource "aci_access_port_block" "leaf_vpbs" {
  for_each                = { for key, value in var.interfaces : key => value if value.iftype == "vpc" }
  access_port_selector_dn = aci_access_port_selector.leaf_vpss[each.key].id
  name                    = each.key
  from_card               = each.value.lfblk
  to_card                 = each.value.lfblk
  from_port               = each.value.from
  to_port                 = each.value.end
}
