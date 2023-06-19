WITH gCosts AS (
  SELECT sku.description as product_name, sku.id as product_name_key
  FROM `.multi_cloud_costs.gcp_cloud_billing_export` group by 1, 2
), aCosts AS (
  SELECT meterId as product_name, meterName as product_name_key
  FROM `.multi_cloud_costs.azure_cloud_billing_export` group by 1,2
)
SELECT product_name, product_name_key FROM gCosts
UNION ALL
SELECT product_name, product_name_key FROM aCosts