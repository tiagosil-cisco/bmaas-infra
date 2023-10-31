# Link level policies
resource "aci_fabric_if_pol" "llpols" {
  for_each      = var.intpols
  name          = "${var.project_name}-${each.key}"
  description   = each.value.desc
  auto_neg      = each.value.autoneg
  fec_mode      = each.value.fec
  link_debounce = each.value.linkdebounce
  speed         = each.value.speed
}

# LLDP policies
resource "aci_lldp_interface_policy" "lldp_pols" {
  for_each    = var.lldp
  description = each.value.desc
  name        = "${var.project_name}-${each.key}"
  admin_rx_st = each.value.receive
  admin_tx_st = each.value.transmit
}

# CDP policies
resource "aci_cdp_interface_policy" "cdp_pols" {
  for_each    = var.cdp
  description = each.value.desc
  name        = "${var.project_name}-${each.key}"
  admin_st    = each.value.admin_state
}

# MCP policies
resource "aci_miscabling_protocol_interface_policy" "mcp_pols" {
  for_each    = var.mcp
  description = each.value.desc
  name        = "${var.project_name}-${each.key}"
  admin_st    = each.value.admin_state
}

# LACP policies
resource "aci_lacp_policy" "lacp_pols" {
  for_each  = var.lacp
  name      = "${var.project_name}-${each.key}"
  max_links = each.value.max_links
  min_links = each.value.min_links
  mode      = each.value.mode
}