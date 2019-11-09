variable "project" {}
variable "region" {}
variable "zone" {}
variable "cluster_name" {}
variable "machine_type" {}

provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}


resource "google_container_cluster" "primary" {
  name               = "${var.cluster_name}"
  location           = "${var.zone}"
  initial_node_count = 2
  node_config {
    preemptible  = true
    machine_type = "${var.machine_type}"
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring"
    ]
  }

}
