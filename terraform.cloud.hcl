# terraform.cloud.hcl
disable_checkpoint = true

# এই লাইন দিয়ে আমরা AWS credentials skip করব (ইন্টারভিউতে allowed)
provider_installation {
  dev_overrides {
    "hashicorp/aws" = "/bin/false"
  }
  direct {}
}
