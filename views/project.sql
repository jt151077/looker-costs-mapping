WITH gCosts AS (
  SELECT project.id as project_id, project.number as project_key, project.name as project_name
  FROM `.multi_cloud_costs.gcp_cloud_billing_export` group by 1, 2, 3
), aCosts AS (
  SELECT SubscriptionId as project_id, SubscriptionId as project_key, subscriptionName as project_name
  FROM `.multi_cloud_costs.azure_cloud_billing_export` group by 1,2,3
)
SELECT project_id, project_key, project_name  FROM gCosts
UNION ALL
SELECT project_id, project_key, project_name FROM aCosts