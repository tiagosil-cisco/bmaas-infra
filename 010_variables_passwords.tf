variable "credentials" {
  type = map(any)
  default = {
    aci = {
      username = "dovetail"
      password = "C!sco123"
      url      = "https://10.0.255.100"
    }
    vmware = {
      username = "administrator@vsphere.local"
      password = "C!sco123"
      url      = "10.0.10.44"
    }

  }
}
