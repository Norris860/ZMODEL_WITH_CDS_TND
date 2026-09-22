@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Joins'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZCDS_JOIN_TND
  as select from /dmo/booking as Booking
    inner join   /dmo/flight  as Flights on Flights.carrier_id = Booking.carrier_id
{
  key Booking.booking_id    as BookingID,
      Flights.flight_date   as FlightDate,
      
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Flights.price         as FlightsPrice,
      Flights.currency_code as CurrencyCode
}
