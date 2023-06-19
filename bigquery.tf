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

resource "google_bigquery_dataset" "multi_cost_ds" {
  project       = local.project_id
  dataset_id    = local.billing_export_dataset_id
  friendly_name = local.billing_export_dataset_id
  location      = local.billing_export_dataset_region
}

resource "google_bigquery_table" "azure_cloud_billing_export" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "azure_cloud_billing_export"
  deletion_protection = false

  view {
    query          = file("./views/azure_cloud_billing_export.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "gcp_cloud_billing_export" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "gcp_cloud_billing_export"
  deletion_protection = false

  view {
    query          = file("./views/gcp_cloud_billing_export.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "all" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "all"
  deletion_protection = false

  view {
    query          = file("./views/all.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "billing_account" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "billing_account"
  deletion_protection = false

  view {
    query          = file("./views/billing_account.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "charge" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "charge"
  deletion_protection = false

  view {
    query          = file("./views/charge.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "charge_type" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "charge_type"
  deletion_protection = false

  view {
    query          = file("./views/charge_type.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "cloud_pricing_export" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "cloud_pricing_export"
  deletion_protection = false

  view {
    query          = file("./views/cloud_pricing_export.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "cloud_provider" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "cloud_provider"
  deletion_protection = false

  view {
    query          = file("./views/cloud_provider.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "currency" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "currency"
  deletion_protection = false

  view {
    query          = file("./views/currency.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "gcp_cloud_pricing_export" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "gcp_cloud_pricing_export"
  deletion_protection = false

  view {
    query          = file("./views/gcp_cloud_pricing_export.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "gcp_costs" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "gcp_costs"
  deletion_protection = false

  view {
    query          = file("./views/gcp_costs.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "product_name" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "product_name"
  deletion_protection = false

  view {
    query          = file("./views/product_name.sql")
    use_legacy_sql = false
  }
}


resource "google_bigquery_table" "project" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "project"
  deletion_protection = false

  view {
    query          = file("./views/project.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "resource_location" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "resource_location"
  deletion_protection = false

  view {
    query          = file("./views/resource_location.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "service" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "service"
  deletion_protection = false

  view {
    query          = file("./views/service.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "service_type" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "service_type"
  deletion_protection = false

  view {
    query          = file("./views/service_type.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "unified_cloud_billing_date_impute" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "unified_cloud_billing_date_impute"
  deletion_protection = false

  view {
    query          = file("./views/unified_cloud_billing_date_impute.sql")
    use_legacy_sql = false
  }
}

resource "google_bigquery_table" "usage_unit_of_measure" {
  depends_on = [
    google_bigquery_dataset.multi_cost_ds,
    google_bigquery_table.gcp_cloud_billing_export,
    google_bigquery_table.azure_cloud_billing_export
  ]

  project             = local.project_id
  dataset_id          = google_bigquery_dataset.multi_cost_ds.dataset_id
  table_id            = "usage_unit_of_measure"
  deletion_protection = false

  view {
    query          = file("./views/usage_unit_of_measure.sql")
    use_legacy_sql = false
  }
}