resource "kubectl_manifest" "test" {
  for_each = {
    db-deployment = "k8s-specifications/db-deployment.yaml"
    db-service = "k8s-specifications/db-service.yaml"
    redis-deployment = "k8s-specifications/redis-deployment.yaml"
    redis-service = "k8s-specifications/redis-service.yaml"
    result-deployment = "k8s-specifications/result-deployment.yaml"
    result-service = "k8s-specifications/result-service.yaml"
    vote-deployment = "k8s-specifications/vote-deployment.yaml"
    vote-service = "k8s-specifications/vote-service.yaml"
    worker-deployment = "k8s-specifications/worker-deployment.yaml"
  }
  yaml_body = file("${path.module}/${each.value}")
}