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

  name = "LLDP-OFF"
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
}
