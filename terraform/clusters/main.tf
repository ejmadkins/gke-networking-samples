module "gke_east" {

  source   = "../modules/gke_cluster"
  project  = var.project
  gke_name = var.gke_east_name
  zone     = var.zone_east
  region   = var.region_east
  sync_repo   = var.sync_repo
  policy_dir  = var.policy_dir
}

module "gke_west" {

  source   = "../modules/gke_cluster"
  project  = var.project
  gke_name = var.gke_west_name
  zone     = var.zone_west
  region   = var.region_west
  sync_repo   = var.sync_repo
  policy_dir  = var.policy_dir
}



resource "google_gke_hub_feature" "feature" {
  name = "multiclusteringress"
  location = "global"
  project = var.project
  spec {
    multiclusteringress {
      config_membership = module.gke_east.membership_id
    }
  }
  provider = google-beta
}