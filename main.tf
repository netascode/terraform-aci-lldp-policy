resource "aci_rest" "lldpIfPol" {
  dn         = "uni/infra/lldpIfP-${var.name}"
  class_name = "lldpIfPol"
  content = {
    name      = var.name
    adminRxSt = var.admin_rx_state == true ? "enabled" : "disabled"
    adminTxSt = var.admin_tx_state == true ? "enabled" : "disabled"
  }
}
