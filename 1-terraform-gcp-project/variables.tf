variable "sandbox_id" {
}
variable "org_id" {
  default = "24851311546"
}
variable "billing_account" {
  default = "014413-D964D8-7A33D2"
}
variable "gcp_apis" {
  default = ["compute.googleapis.com", "container.googleapis.com", "certificatemanager.googleapis.com"]
}
