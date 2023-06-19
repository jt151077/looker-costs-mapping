WITH
  gCosts AS (
  SELECT
    billing_account_id AS billing_account_key,
    CAST(usage_end_time AS DATE) AS billing_end_date,
    CAST(usage_start_time AS DATE) AS billing_start_date,
    LOWER(usage.pricing_unit) AS charge_key,
    LOWER(cost_type) AS charge_type_key,
    "GCP" AS cloud_provider_key,
    cost,
    LOWER(currency) AS currency_key,
    sku.id AS product_name_key,
    project.number AS project_key,
    LOWER(location.location) AS resource_location_key,
    GENERATE_UUID() AS row_key,
    service.id AS service_key,
    service.id AS service_type_key,
    CAST(usage_end_time AS DATE) AS usage_end_date,
    usage.amount AS usage_quantity,
    CAST(usage_start_time AS DATE) AS usage_start_date,
    LOWER(usage.unit) AS usage_unit_of_measure_key
  FROM
    `.multi_cloud_costs.gcp_cloud_billing_export` ),
  aCosts AS (
  SELECT
    billingAccountId AS billing_account_key,
    CAST(servicePeriodEndDate AS DATE) AS billing_end_date,
    CAST(servicePeriodStartDate AS DATE) AS billing_start_date,
    LOWER(unitOfMeasure) AS charge_key,
    LOWER(chargeType) AS charge_type_key,
    provider AS cloud_provider_key,
    costInUsd AS cost,
    LOWER(pricingCurrency) AS currency_key,
    meterName AS product_name_key,
    SubscriptionId AS project_key,
    LOWER(resourceLocation) AS resource_location_key,
    GENERATE_UUID() AS row_key,
    ProductId AS service_key,
    ProductId AS service_type_key,
    CAST(date AS date) AS usage_end_date,
    quantity AS usage_quantity,
    CAST(servicePeriodStartDate AS DATE) AS usage_start_date,
    LOWER(unitOfMeasure) AS usage_unit_of_measure_key
  FROM
    `.multi_cloud_costs.azure_cloud_billing_export` )
SELECT
  billing_account_key,
  billing_end_date,
  billing_start_date,
  charge_key,
  charge_type_key,
  cloud_provider_key,
  cost,
  currency_key,
  product_name_key,
  project_key,
  resource_location_key,
  row_key,
  service_key,
  service_type_key,
  usage_end_date,
  usage_quantity,
  usage_start_date,
  usage_unit_of_measure_key
FROM
  gCosts
UNION ALL
SELECT
  billing_account_key,
  billing_end_date,
  billing_start_date,
  charge_key,
  charge_type_key,
  cloud_provider_key,
  cost,
  currency_key,
  product_name_key,
  project_key,
  resource_location_key,
  row_key,
  service_key,
  service_type_key,
  usage_end_date,
  usage_quantity,
  usage_start_date,
  usage_unit_of_measure_key
FROM
  aCosts