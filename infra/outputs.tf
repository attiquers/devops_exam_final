output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "The endpoint for the EKS control plane"
  value       = aws_eks_cluster.main.endpoint
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket created for persistence"
  value       = aws_s3_bucket.app_bucket.id
}

output "region" {
  description = "AWS Region"
  value       = var.aws_region
}