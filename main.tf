variable "hetzner_dns_api_token" {
  type = string
}

module "dns_ipv4" {
    source = "./modules/dns"

    hetzner_dns_api_token = var.hetzner_dns_api_token

    dns_zone_name      = "with42.de"
    dns_record_name    = "test"
    dns_record_value   = "23.88.119.215"
    dns_record_type    = "A"
    dns_record_ttl     = 60
}

module "dns_ipv6" {
    source = "./modules/dns"

    hetzner_dns_api_token = var.hetzner_dns_api_token

    dns_zone_name      = "with42.de"
    dns_record_name    = "test"
    dns_record_value   = "2a01:4f8:c17:4d56::1"
    dns_record_type    = "AAAA"
    dns_record_ttl     = 60
}

resource "null_resource" "long_run" {
  provisioner "local-exec" {
    command = "sleep 30"
  }
}
