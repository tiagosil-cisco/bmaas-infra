# Leaf Access Port Policy Groups
/*
resource "aci_leaf_access_port_policy_group" "leaf_appgs" {
  for_each                      = var.leafs_appg
  name                          = each.key
  relation_infra_rs_lldp_if_pol = aci_lldp_interface_policy.lldp_pols[each.value.lldp].id
  relation_infra_rs_att_ent_p   = aci_attachable_access_entity_profile.aaeps[each.value.aaep].id
  description                   = each.value.desc
}

resource "aci_access_port_selector" "leaf_apss" {
  for_each                       = { for key, value in var.interfaces : key => value if value.iftype == "switch_port" }
  leaf_interface_profile_dn      = aci_leaf_interface_profile.li_profs[each.value.leaf].id
  name                           = each.key
  access_port_selector_type      = "range"
  relation_infra_rs_acc_base_grp = aci_leaf_access_port_policy_group.leaf_appgs[each.value.polgrp].id
}

resource "aci_access_port_block" "leaf_apbs" {
  for_each                = { for key, value in var.interfaces : key => value if value.iftype == "switch_port" }
  access_port_selector_dn = aci_access_port_selector.leaf_apss[each.key].id
  name                    = each.key
  from_card               = each.value.lfblk
  to_card                 = each.value.lfblk
  from_port               = each.value.from
  to_port                 = each.value.end
}
*/