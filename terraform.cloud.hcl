# terraform.cloud.hcl
disable_checkpoint = true


provider_installation {
  dev_overrides {
    "hashicorp/aws" = "/bin/false"
  }
  direct {}
}
