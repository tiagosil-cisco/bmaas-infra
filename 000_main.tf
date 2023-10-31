terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
    }
  }
}

provider "aci" {
  username = var.credentials["aci"].username
  password = var.credentials["aci"].password
  url      = var.credentials["aci"].url
  insecure = true
}
