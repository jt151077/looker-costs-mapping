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


locals {
  project_id                    = var.project_id
  project_number                = var.project_nmr
  project_default_region        = var.project_default_region
  billing_export_project_id     = var.billing_export_project_id
  billing_export_dataset_id     = var.billing_export_dataset_id
  billing_export_dataset_region = var.billing_export_dataset_region

  gcp_service_list = [
    "bigquery.googleapis.com"
  ]
}


resource "google_project_service" "gcp_services" {
  count              = length(local.gcp_service_list)
  project            = local.project_id
  service            = local.gcp_service_list[count.index]
  disable_on_destroy = false
}

terraform {
  required_version = ">= 1.4.6"

  required_providers {
    archive = {
      source  = "hashicorp/archive"
      version = "= 2.0.0"
    }

    google = {
      source  = "hashicorp/google"
      version = "= 4.63.1"
    }

    google-beta = {
      source  = "hashicorp/google-beta"
      version = "= 4.63.1"
    }
  }
}