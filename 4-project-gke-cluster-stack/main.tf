module "project" {
  source          = "../1-terraform-gcp-project"
  org_id          = "24851311546"
  billing_account = "014413-D964D8-7A33D2"
  sandbox_id      = var.sandbox_id
}
module "cluster" {
  # source = "git::https://github.com/josema88/terraform-aprovisionamiento-gcp-gke-cluster-and-app-deploy.git//2-terraform-gcp-gke"
  source                = "../2-terraform-gcp-gke"
  project               = split("/", module.project.project_id)[1]
  sandbox_id            = var.sandbox_id
  location              = var.location
  gh_api_config_channel = var.gh_api_config_channel
  gke_node_config       = var.gke_node_config
  # Explicit dependency just work if the child module doesn't contain terraform block.
  depends_on = [module.project]
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
  yaml_body  = file("${path.module}/${each.value}")
  depends_on = [module.cluster]
}