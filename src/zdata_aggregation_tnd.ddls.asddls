@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Aggregation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZDATA_AGGREGATION_TND
  as select from /dmo/booking
{
  customer_id   as CustomerID,
  currency_code as Currency,

  @Semantics.amount.currencyCode: 'Currency'
  sum(flight_price) as Flight

}
group by
  currency_code,
  customer_id
 
 