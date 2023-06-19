WITH gCosts AS (
  SELECT usage.pricing_unit as charge_id, usage.pricing_unit as charge_description, LOWER(usage.pricing_unit) as charge_key
  FROM `.multi_cloud_costs.gcp_cloud_billing_export`
), aCosts AS (
  SELECT unitOfMeasure as charge_id, unitOfMeasure as charge_description, LOWER(unitOfMeasure) as charge_key
  FROM `.multi_cloud_costs.azure_cloud_billing_export`
)
SELECT charge_id, charge_description, charge_key FROM gCosts
UNION ALL
SELECT charge_id, charge_description, charge_key FROM aCosts
