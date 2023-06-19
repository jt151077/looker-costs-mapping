WITH gCosts AS (
  SELECT location.location as resource_location, LOWER(location.location) as resource_location_key, location.region as resource_region
  FROM `.multi_cloud_costs.gcp_cloud_billing_export` group by 1,2,3
), aCosts AS (
  SELECT resourceLocation as resource_location, LOWER(resourceLocation) as resource_location_key, meterRegion as resource_region
  FROM `.multi_cloud_costs.azure_cloud_billing_export` group by 1,2,3
)
SELECT resource_location, resource_location_key, resource_region  FROM gCosts
UNION ALL
SELECT resource_location, resource_location_key, resource_region FROM aCosts