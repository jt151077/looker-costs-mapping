WITH gCosts AS (
  SELECT "GCP" as cloud_provider, "GCP" as cloud_provider_key 
  FROM `.multi_cloud_costs.gcp_cloud_billing_export` group by 1
), aCosts AS (
  SELECT distinct(provider) as cloud_provider, provider as cloud_provider_key 
  FROM `.multi_cloud_costs.azure_cloud_billing_export`  group by 1
)
SELECT cloud_provider, cloud_provider_key FROM gCosts
UNION ALL
SELECT cloud_provider, cloud_provider_key FROM aCosts