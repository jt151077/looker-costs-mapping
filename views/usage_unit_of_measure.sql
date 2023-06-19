WITH gCosts AS (
  SELECT usage.unit as usage_unit_of_measure, LOWER(usage.unit) as usage_unit_of_measure_key
  FROM `.multi_cloud_costs.gcp_cloud_billing_export` group by 1,2
), aCosts AS (
  SELECT unitOfMeasure as usage_unit_of_measure, LOWER(unitOfMeasure) as usage_unit_of_measure_key
  FROM `.multi_cloud_costs.azure_cloud_billing_export` group by 1,2
)
SELECT usage_unit_of_measure, usage_unit_of_measure_key FROM gCosts
UNION ALL
SELECT usage_unit_of_measure, usage_unit_of_measure_key FROM aCosts