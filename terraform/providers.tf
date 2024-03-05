terraform {
  required_providers {
    rafay = {
      source = "app.terraform.io/tfcd/rafay"
      version = "1.0.0"
    }
  }
}

provider "rafay" { 
  # Configuration options 
  provider_config_file = var.rafay_config_file
}

