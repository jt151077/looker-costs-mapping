WITH gCosts AS (
  SELECT cost_type as charge_type, LOWER(cost_type) as charge_type_key
  FROM `.multi_cloud_costs.gcp_cloud_billing_export`
), aCosts AS (
  SELECT chargeType as charge_type, LOWER(chargeType) as charge_type_key
  FROM `.multi_cloud_costs.azure_cloud_billing_export`
)
SELECT charge_type, charge_type_key FROM gCosts
UNION ALL
SELECT charge_type, charge_type_key FROM aCosts
