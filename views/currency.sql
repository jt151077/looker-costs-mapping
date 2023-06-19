WITH gCosts AS (
  SELECT currency, LOWER(currency) as currency_key
  FROM `.multi_cloud_costs.gcp_cloud_billing_export` group by 1, 2
), aCosts AS (
  SELECT pricingCurrency as currency, LOWER(pricingCurrency) as currency_key
  FROM `.multi_cloud_costs.azure_cloud_billing_export` group by 1,2
)
SELECT currency, currency_key FROM gCosts
UNION ALL
SELECT currency, currency_key FROM aCosts