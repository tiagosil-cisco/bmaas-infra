variable "credentials" {}
variable "project_name" {}

locals {
  vpc_to_core = ""
}

# Leafs
variable "leafs" {
  default = {
    "103" = {
      name = "leaf-103"
      from = "103"
      to   = "103"
    },
    "104" = {
      name = "leaf-104"
      from = "104"
      to   = "104"
    },
    "103-104" = {
      name = "leaf-103-104"
      from = "103"
      to   = "104"
    }
  }
}



# Link level policies
variable "intpols" {
  default = {
    link-100M = {
      desc         = "100Mbps"
      speed        = "100M"
      linkdebounce = "100"
      fec          = "inherit"
      autoneg      = "on"
    },
    link-1G = {
      desc         = "1Gbps"
      speed        = "1G"
      linkdebounce = "100"
      fec          = "inherit"
      autoneg      = "on"
    },
    link-10G = {
      desc         = "10Gbps"
      speed        = "10G"
      linkdebounce = "100"
      fec          = "inherit"
      autoneg      = "on"
    },
    link-25G = {
      desc         = "25Gbps - use with short-length passive cables"
      speed        = "25G"
      linkdebounce = "100"
      fec          = "inherit"
      autoneg      = "on"
    },
    link-25G-FEC-CL74-FC = {
      desc         = "25Gbps - use with 3-meter passive cable and 1 to 10-meter active cables"
      speed        = "25G"
      linkdebounce = "100"
      fec          = "cl74-fc-fec"
      autoneg      = "on"
    },
    link-25G-FEC-CL91-RC = {
      desc         = "25Gbps - use with 5-meter passive cable and 100-meter SPF-25G-SR or SPF-25G-LR"
      speed        = "25G"
      linkdebounce = "100"
      fec          = "cl91-rs-fec"
      autoneg      = "on"
    },
    link-40G = {
      desc         = "40Gbps"
      speed        = "40G"
      linkdebounce = "100"
      fec          = "inherit"
      autoneg      = "on"
    },
    link-100G = {
      desc         = "100Gbps"
      speed        = "100G"
      linkdebounce = "100"
      fec          = "inherit"
      autoneg      = "on"
    }
  }
}

# LLDP policies
variable "lldp" {
  default = {
    lldp_enabled = {
      desc     = "lldp TX and RX on"
      receive  = "enabled"
      transmit = "enabled"
    },
    lldp_disabled = {
      desc     = "lldp TX and RX off"
      receive  = "disabled"
      transmit = "disabled"
    }
  }
}

# CDP policies
variable "cdp" {
  default = {
    cdp_enabled = {
      desc        = "cdp enabled"
      admin_state = "enabled"
    },
    cdp_disabled = {
      desc        = "cdp disabled"
      admin_state = "disabled"
    }
  }
}

# MCP policies
variable "mcp" {
  default = {
    mcp_enabled = {
      desc        = "mcp enabled"
      admin_state = "enabled"
    },
    mcp_disabled = {
      desc        = "mcp disabled"
      admin_state = "disabled"
    }
  }
}

# LACP policies
variable "lacp" {
  default = {
    lacp_active = {
      min_links = "1"
      max_links = "16"
      mode      = "active"
    }
  }
}

variable "vlan_pools" {
  default = {
    BRATTICE-FI-UCSX = {
      desc       = "pool for UCS-X used in BRATTICE"
      allocation = "dynamic"
    },
    BRATTICE-VMM-DOMAIN = {
      desc       = "pool for VMM used in BRATTICE"
      allocation = "dynamic"
    }

  }
}
variable "vlan_ranges" {
  default = {
    1 = {
      vlan_pool  = "BRATTICE-FI-UCSX"
      start      = "1500"
      end        = "1500"
      allocation = "dynamic"
    },
    2 = {
      vlan_pool  = "BRATTICE-FI-UCSX"
      start      = "1501"
      end        = "1501"
      allocation = "dynamic"
    },
    3 = {
      vlan_pool  = "BRATTICE-FI-UCSX"
      start      = "1521"
      end        = "1521"
      allocation = "dynamic"
    },
    4 = {
      vlan_pool  = "BRATTICE-FI-UCSX"
      start      = "1525"
      end        = "1525"
      allocation = "dynamic"
    },
    5 = {
      vlan_pool  = "BRATTICE-FI-UCSX"
      start      = "1526"
      end        = "1526"
      allocation = "dynamic"
    }
    6 = {
      vlan_pool  = "BRATTICE-FI-UCSX"
      start      = "1551"
      end        = "1599"
      allocation = "dynamic"
    },
    7 = {
      vlan_pool  = "BRATTICE-VMM-DOMAIN"
      start      = "1550"
      end        = "1599"
      allocation = "dynamic"
    }
  }
}

# Domains
variable "domains" {
  default = {
    BRATTICE-FI-PHYSICAL = {
      type = "phys"
    }
  }
}

# Attachable Entity Profiles (AAEPs)
variable "aaeps" {
  default = {
    BRATTICE-FI-VPC-AAEP = {
      name   = "BRATTICE-FI-VPC-AAEP"
      domain = "BRATTICE-FI-PHYSICAL"
    }
  }
}


# Leaf VPC Port Policy Groups
variable "leafs_vppg" {
  default = {
    VPC_to_BRATTICE-FI-A = {
      lldp         = "lldp_enabled"
      cdp          = "cdp_enabled"
      channel_mode = "lacp_active"
      aaep         = "BRATTICE-FI-VPC-AAEP"
      desc         = "External N9K VPC to RATTICE-FI-A"
    },
    VPC_to_BRATTICE-FI-B = {
      lldp         = "lldp_enabled"
      cdp          = "cdp_enabled"
      channel_mode = "lacp_active"
      aaep         = "BRATTICE-FI-VPC-AAEP"
      desc         = "External N9K VPC to RATTICE-FI-B"
    }
  }
}

# Interfaces
variable "interfaces" {
  default = {
    "leaf_103_eth_1_49" = {
      leaf   = "103"
      iftype = "vpc"
      lfblk  = "1"
      from   = "49"
      end    = "49"
      polgrp = "VPC_to_BRATTICE-FI-A"
    },
    "leaf_104_eth_1_49" = {
      leaf   = "104"
      iftype = "vpc"
      lfblk  = "1"
      from   = "49"
      end    = "49"
      polgrp = "VPC_to_BRATTICE-FI-A"
    },
    "leaf_103_eth_1_50" = {
      leaf   = "103"
      iftype = "vpc"
      lfblk  = "1"
      from   = "50"
      end    = "50"
      polgrp = "VPC_to_BRATTICE-FI-B"
    },
    "leaf_104_eth_1_50" = {
      leaf   = "104"
      iftype = "vpc"
      lfblk  = "1"
      from   = "50"
      end    = "50"
      polgrp = "VPC_to_BRATTICE-FI-B"
    },
  }
}