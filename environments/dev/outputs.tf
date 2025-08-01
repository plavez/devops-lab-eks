output "cluster_name" {
  value = module.eks.cluster_name

}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint

}

output "cluster_certificate_authority" {
  value = module.eks.cluster_certificate_authority
}


output "ecr_service_a_url" {
  description = "URL of the ecr_a"
  value       = module.ecr_service_a.repository_url

}

output "ecr_service_b" {
  description = "URL of the ecr_b"
  value       = module.ecr_service_b.repository_url

}
