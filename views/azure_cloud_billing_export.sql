SELECT
  invoiceId,
  previousInvoiceId,
  billingAccountId,
  billingAccountName,
  billingProfileId,
  billingProfileName,
  invoiceSectionId,
  invoiceSectionName,
  resellerName,
  resellerMpnId,
  costCenter,
  billingPeriodEndDate,
  billingPeriodStartDate,
  CAST(FORMAT_DATE("%Y-%m-%d",PARSE_DATE("%m/%d/%Y",servicePeriodEndDate)) as DATE) as servicePeriodEndDate,
  CAST(FORMAT_DATE("%Y-%m-%d",PARSE_DATE("%m/%d/%Y",servicePeriodStartDate)) as DATE) as servicePeriodStartDate,
  CAST(FORMAT_DATE("%Y-%m-%d",PARSE_DATE("%m/%d/%Y",date)) as DATE) as date,
  serviceFamily,
  productOrderId,
  productOrderName,
  consumedService,
  meterId,
  meterName,
  meterCategory,
  meterSubCategory,
  meterRegion,
  ProductId,
  ProductName,
  SubscriptionId,
  subscriptionName,
  publisherType,
  publisherId,
  publisherName,
  resourceGroupName,
  ResourceId,
  resourceLocation,
  location,
  CAST(effectivePrice AS FLOAT64) as effectivePrice,
  CAST(quantity AS FLOAT64) as quantity,
  unitOfMeasure,
  chargeType,
  billingCurrency,
  pricingCurrency,
  CAST(costInBillingCurrency AS FLOAT64) as costInBillingCurrency,
  CAST(costInPricingCurrency AS FLOAT64) as costInPricingCurrency,
  CAST(costInUsd AS FLOAT64) as costInUsd,
  CAST(paygCostInBillingCurrency AS FLOAT64) as paygCostInBillingCurrency,
  CAST(paygCostInUsd AS FLOAT64) as paygCostInUsd,
  CAST(exchangeRatePricingToBilling AS FLOAT64) as exchangeRatePricingToBilling,
  CAST(FORMAT_DATE("%Y-%m-%d",PARSE_DATE("%m/%d/%Y",exchangeRateDate)) as DATE) as exchangeRateDate,
  CAST(isAzureCreditEligible AS BOOLEAN) as isAzureCreditEligible,
  serviceInfo1,
  serviceInfo2,
  additionalInfo,
  tags,
  CAST(PayGPrice AS FLOAT64) as PayGPrice,
  frequency,
  term,
  reservationId,
  reservationName,
  pricingModel,
  CAST(unitPrice AS FLOAT64) as unitPrice,
  costAllocationRuleName,
  benefitId,
  benefitName,
  provider
FROM
  `.multi_cloud_costs.azure_billing_export`