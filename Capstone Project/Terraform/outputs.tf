output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "node_group_name" {
  value = aws_eks_node_group.nodes.node_group_name
}
