terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    aci = {
      source  = "netascode/aci"
      version = ">=0.2.0"
    }
  }
}

module "main" {
  source = "../.."

  name           = "LLDP-ON"
  admin_rx_state = true
  admin_tx_state = true
}

data "aci_rest" "lldpIfPol" {
  dn = "uni/infra/lldpIfP-${module.main.name}"

  depends_on = [module.main]
}

resource "test_assertions" "lldpIfPol" {
  component = "lldpIfPol"

  equal "name" {
    description = "name"
    got         = data.aci_rest.lldpIfPol.content.name
    want        = module.main.name
  }

  equal "adminRxSt" {
    description = "adminRxSt"
    got         = data.aci_rest.lldpIfPol.content.adminRxSt
    want        = "enabled"
  }

  equal "adminTxSt" {
    description = "adminTxSt"
    got         = data.aci_rest.lldpIfPol.content.adminTxSt
    want        = "enabled"
  }
}
