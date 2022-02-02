output "kubernetes_host" {
  value       = module.my_eks.eks.cluster_endpoint
  description = "EKS cluster host endpoint"
}

output "cluster_id" {
  value       = module.my_eks.eks.cluster_id
  description = "EKS cluster id"
}
