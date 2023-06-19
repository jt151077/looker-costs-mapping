WITH gCosts AS (
  SELECT service.id as service_id, service.id as service_key
  FROM `.multi_cloud_costs.gcp_cloud_billing_export` group by 1,2
), aCosts AS (
  SELECT ProductId as service_id, ProductId as service_key
  FROM `.multi_cloud_costs.azure_cloud_billing_export` group by 1,2
)
SELECT service_id, service_key FROM gCosts
UNION ALL
SELECT service_id, service_key FROM aCosts
