output "kubernetes_host" {
  value       = module.my_eks.kubernetes_host
  description = "EKS cluster host endpoint"
}

output "cluster_id" {
  value       = module.my_eks.cluster_id
  description = "EKS cluster id"
}
