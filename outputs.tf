output "dn" {
  value       = aci_rest.lldpIfPol.id
  description = "Distinguished name of `lldpIfPol` object."
}

output "name" {
  value       = aci_rest.lldpIfPol.content.name
  description = "LLDP interface policy name."
}
