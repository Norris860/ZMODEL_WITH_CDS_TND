@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Transient View Entity'
@Metadata.ignorePropagatedAnnotations: true
define transient view entity ZCDS_TRA_VIEW_ENT_BOOK_TND
  provider contract analytical_query
  as projection on ZCDS_AN_DATA_FLIGHT_TND
{

    @AnalyticsDetails.query.axis: #FREE
    TravelId,
    
    @AnalyticsDetails.query.axis: #ROWS
    BookingId,
    
    @AnalyticsDetails.query.axis: #COLUMNS
    CustomerId,
    
      @ObjectModel.text.element: [ 'CurrCode' ]
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      BookingDate,
      
      CarrierId,
      ConnectionId,
      FlightDate,
      CurrencyCode,
      /* Associations */
      _Flight,
      
      virtual CurrCode : abap.cuky
}
