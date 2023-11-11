variable "sandbox_id" {
}
variable "project_id" {
}
variable "location" {
  default = "us-central1"
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