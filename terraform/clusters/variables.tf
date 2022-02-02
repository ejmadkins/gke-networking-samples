variable "project" {
  type        = string
  description = "the GCP project where the cluster will be created"
  default     = "ejmadkins-gke-net-1934"
}

variable "gke_east_name" {
  type        = string
  description = "the name of the East GKE cluster."
  default     = "cluster-east"
}

variable "gke_west_name" {
  type        = string
  description = "the name of the West GKE cluster."
  default     = "cluster-west"
}

variable "zone_east" {
  type        = string
  description = "the zone for the East GKE cluster."
  default     = "europe-west1-b"
}

variable "zone_west" {
  type        = string
  description = "the zone for the West GKE cluster."
  default     = "europe-west2-a"
}

variable "region_east" {
  type        = string
  description = "the region for the East GKE cluster."
  default     = "europe-west1"
}

variable "region_west" {
  type        = string
  description = "the region for the West GKE cluster."
  default     = "europe-west2"
}

variable "sync_repo" {
  type        = string
  description = "git URL for the repo which will be sync'ed into the cluster via Config Management"
  default     = "https://github.com/ejmadkins/gke-networking-samples.git"
}

variable "policy_dir" {
  type        = string
  description = "the root directory in the repo branch that contains the resources."
  default     = "deploy/"
}