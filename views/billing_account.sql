WITH gCosts AS (
  SELECT distinct(billing_account_id)
  FROM `.multi_cloud_costs.gcp_cloud_billing_export`
), aCosts AS (
  SELECT distinct(billingAccountId) as billing_account_id
  FROM `.multi_cloud_costs.azure_cloud_billing_export`
)
SELECT billing_account_id, billing_account_id as billing_account_key FROM gCosts
UNION ALL
SELECT billing_account_id, billing_account_id as billing_account_key FROM aCosts