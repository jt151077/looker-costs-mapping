WITH gCosts AS (
  SELECT service.description as service_category, service.description as service_type, service.id as service_type_key
  FROM `.multi_cloud_costs.gcp_cloud_billing_export` group by 3, 1, 2
), aCosts AS (
  SELECT serviceFamily as service_category, consumedService as service_type, ProductId as service_type_key
  FROM `.multi_cloud_costs.azure_cloud_billing_export` group by 3, 1,2
)
SELECT service_category, service_type, service_type_key FROM gCosts
UNION ALL
SELECT service_category, service_type, service_type_key FROM aCosts