WITH gCosts AS (
  SELECT *
  FROM `.multi_cloud_costs.gcp_cloud_billing_export`
), aCosts AS (
  SELECT *
  FROM `.multi_cloud_costs.azure_cloud_billing_export`
)
SELECT gCosts.*, aCosts.invoiceId as azinvoiceId, 
aCosts.previousInvoiceId as azpreviousInvoiceId, 
aCosts.billingAccountId as azbillingAccountId, 
aCosts.billingAccountName as azbillingAccountName, 
aCosts.billingProfileId as azbillingProfileId, 
aCosts.billingProfileName as azbillingProfileName, 
aCosts.invoiceSectionId as azinvoiceSectionId, 
aCosts.invoiceSectionName as azinvoiceSectionName, 
aCosts.resellerName as azresellerName, 
aCosts.resellerMpnId as azresellerMpnId, 
aCosts.costCenter as azcostCenter, 
aCosts.billingPeriodEndDate as azbillingPeriodEndDate, 
aCosts.billingPeriodStartDate as azbillingPeriodStartDate, 
aCosts.servicePeriodEndDate as azservicePeriodEndDate, 
aCosts.servicePeriodStartDate as azservicePeriodStartDate, 
aCosts.date as azdate, 
aCosts.serviceFamily as azserviceFamily, 
aCosts.productOrderId as azproductOrderId, 
aCosts.productOrderName as azproductOrderName, 
aCosts.consumedService as azconsumedService, 
aCosts.meterId as azmeterId, 
aCosts.meterName as azmeterName, 
aCosts.meterCategory as azmeterCategory, 
aCosts.meterSubCategory as azmeterSubCategory, 
aCosts.meterRegion as azmeterRegion, 
aCosts.ProductId as azProductId, 
aCosts.ProductName as azProductName, 
aCosts.SubscriptionId as azSubscriptionId, 
aCosts.subscriptionName as azsubscriptionName, 
aCosts.publisherType as azpublisherType, 
aCosts.publisherId as azpublisherId, 
aCosts.publisherName as azpublisherName, 
aCosts.resourceGroupName as azresourceGroupName, 
aCosts.ResourceId as azResourceId, 
aCosts.resourceLocation as azresourceLocation, 
aCosts.location as azlocation, 
aCosts.effectivePrice as azeffectivePrice, 
aCosts.quantity as azquantity, 
aCosts.unitOfMeasure as azunitOfMeasure, 
aCosts.chargeType as azchargeType, 
aCosts.billingCurrency as azbillingCurrency, 
aCosts.pricingCurrency as azpricingCurrency, 
aCosts.costInBillingCurrency as azcostInBillingCurrency, 
aCosts.costInPricingCurrency as azcostInPricingCurrency, 
aCosts.costInUsd as azcostInUsd, 
aCosts.paygCostInBillingCurrency as azpaygCostInBillingCurrency, 
aCosts.paygCostInUsd as azpaygCostInUsd, 
aCosts.exchangeRatePricingToBilling as azexchangeRatePricingToBilling, 
aCosts.exchangeRateDate as azexchangeRateDate, 
aCosts.isAzureCreditEligible as azisAzureCreditEligible, 
aCosts.serviceInfo1 as azserviceInfo1, 
aCosts.serviceInfo2 as azserviceInfo2, 
aCosts.additionalInfo as azadditionalInfo, 
aCosts.tags as aztags, 
aCosts.PayGPrice as azPayGPrice, 
aCosts.frequency as azfrequency, 
aCosts.term as azterm, 
aCosts.reservationId as azreservationId, 
aCosts.reservationName as azreservationName, 
aCosts.pricingModel as azpricingModel, 
aCosts.unitPrice as azunitPrice, 
aCosts.costAllocationRuleName as azcostAllocationRuleName, 
aCosts.benefitId as azbenefitId, 
aCosts.benefitName as azbenefitName, 
aCosts.provider as azprovider
FROM gCosts
FULL JOIN aCosts ON gCosts.billing_account_id = aCosts.billingAccountId