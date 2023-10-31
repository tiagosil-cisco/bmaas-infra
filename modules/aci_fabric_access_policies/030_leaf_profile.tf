resource "aci_leaf_profile" "l_profs" {
  for_each                     = var.leafs
  name                         = "${var.project_name}-${each.value.name}"
  relation_infra_rs_acc_port_p = ["${aci_leaf_interface_profile.li_profs[each.key].id}"]
  leaf_selector {
    name                    = each.value.name
    switch_association_type = "range"
    node_block {
      name  = each.value.name
      from_ = each.value.from
      to_   = each.value.to
    }
  }
}