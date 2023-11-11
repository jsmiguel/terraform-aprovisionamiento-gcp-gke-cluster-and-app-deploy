variable "sandbox_id" {
}
variable "location" {
  default = "us-central1"
}
variable "org_id" {
  default = "24851311546"
}
variable "billing_account" {
  default = "014413-D964D8-7A33D2"
}
variable "channel" {
  default = "CHANNEL_STANDARD"
}

variable "node_config" {
  default = {
    machine_type = "e2-standard-2"
    disk_size_gb = 50
  }
}
