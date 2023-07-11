output "client_certificate" {
  value     = module.aks-dev.client_certificate
  sensitive = true
}

output "kube_config" {
  value = module.aks-dev.kube_config

  sensitive = true
}