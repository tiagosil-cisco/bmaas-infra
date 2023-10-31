# Leaf interface profile
resource "aci_leaf_interface_profile" "li_profs" {
  for_each    = var.leafs
  name        = "${var.project_name}-${each.value.name}"
  description = "interface profile associated with ${each.value.name}"
}