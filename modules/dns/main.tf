terraform {
  required_providers {
    hetznerdns = {
      source  = "timohirt/hetznerdns"
      version = "2.0.0"
    }
  }
  required_version = ">= 0.14"
}

variable "hetzner_dns_api_token" {
  type = string
}

provider "hetznerdns" {
  apitoken = var.hetzner_dns_api_token
}

variable "dns_zone_name" {
  type = string
}

data "hetznerdns_zone" "dns_zone" {
  name = var.dns_zone_name
}

variable "dns_record_name" {
  type = string
}

variable "dns_record_type" {
  type    = string
}

variable "dns_record_value" {
  type = string
}

variable "dns_record_ttl" {
  type    = number
}

resource "hetznerdns_record" "dns_record" {
  zone_id = data.hetznerdns_zone.dns_zone.id
  name    = var.dns_record_name
  value   = var.dns_record_value
  type    = var.dns_record_type
  ttl     = var.dns_record_ttl
}