terraform {
  required_providers {
    rafay = {
      version = "= 1.1.26"
      source = "registry.terraform.io/RafaySystems/rafay"
    }
  }
}

provider "rafay" { 
  # Configuration options 
  provider_config_file = var.rafay_config_file
}

