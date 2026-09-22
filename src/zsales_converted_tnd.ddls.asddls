@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Converted'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
serviceQuality: #B,
sizeCategory: #S,
dataClass: #MIXED
}

define view entity ZSALES_CONVERTED_TND
  as select from /dmo/booking
{
  @Semantics.amount.currencyCode: 'OriginalCurrency'
  flight_price               as OriginaltPrice,
  currency_code              as OriginalCurrency,
  
  @Semantics.amount.currencyCode: 'ConvertedCurrency'
  currency_conversion( amount             => flight_price,
                       source_currency    => currency_code,
                       target_currency    => abap.cuky'USD',
                       exchange_rate_date => flight_date,
                       error_handling     => 'SET_TO_NULL',
                       client             => $session.client ) as fligh_Price_USD,
                       cast( 'USD' as abap.cuky )              as ConvertedCurrency
                       
} // where currency_code = 'EUR';
