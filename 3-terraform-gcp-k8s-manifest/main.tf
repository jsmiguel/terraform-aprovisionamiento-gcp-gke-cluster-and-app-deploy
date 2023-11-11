module "project" {
  source          = "git::https://github.com/jsmiguel/terraform-aprovisionamiento-gcp-gke-cluster-and-app-deploy.git//1-terraform-gcp-project"
  org_id          = var.org_id
  billing_account = var.billing_account
  sandbox_id      = var.sandbox_id
}

module "gke_cluster" {
  source      = "git::https://github.com/jsmiguel/terraform-aprovisionamiento-gcp-gke-cluster-and-app-deploy.git//2-terraform-gcp-gke"
  project_id  = split("/", module.project.project_id)[1]
  location    = var.location
  channel     = var.channel
  node_config = var.node_config
  sandbox_id  = var.sandbox_id
}

resource "kubectl_manifest" "test" {
  for_each = {
    db-deployment     = "k8s-specifications/db-deployment.yaml"
    db-service        = "k8s-specifications/db-service.yaml"
    redis-deployment  = "k8s-specifications/redis-deployment.yaml"
    redis-service     = "k8s-specifications/redis-service.yaml"
    result-deployment = "k8s-specifications/result-deployment.yaml"
    result-service    = "k8s-specifications/result-service.yaml"
    vote-deployment   = "k8s-specifications/vote-deployment.yaml"
    vote-service      = "k8s-specifications/vote-service.yaml"
    worker-deployment = "k8s-specifications/worker-deployment.yaml"
  }
  yaml_body = file("${path.module}/${each.value}")
  depends_on = [ data.google_container_cluster.my_cluster ]
}
