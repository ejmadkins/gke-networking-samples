/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "google_gke_hub_membership" "membership" {
  provider      = google-beta
  membership_id = module.gke.name
  endpoint {
    gke_cluster {
      resource_link = "//container.googleapis.com/${module.gke.cluster_id}"
    }
  }
}

resource "google_gke_hub_feature_membership" "feature_member" {
  provider   = google-beta
  location   = "global"
  feature    = "configmanagement"
  membership = google_gke_hub_membership.membership.membership_id
  configmanagement {
    version = "1.9.1"
    config_sync {
      source_format = "unstructured"
      git {
        sync_repo   = var.sync_repo
        sync_branch = var.sync_branch
        policy_dir  = var.policy_dir
        secret_type = "none"
      }
    }
    policy_controller {
      enabled                    = true
      template_library_installed = true
      referential_rules_enabled  = true
    }
  }
}
