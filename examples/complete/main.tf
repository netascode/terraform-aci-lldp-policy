module "aci_lldp_policy" {
  source = "netascode/lldp-policy/aci"

  name           = "LLDP-ON"
  admin_rx_state = true
  admin_tx_state = true
}
