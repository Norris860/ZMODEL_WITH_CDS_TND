@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Data Flight'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}

@Analytics.dataCategory: #CUBE
define view entity ZCDS_AN_DATA_FLIGHT_TND
  as select from /dmo/booking as _Booking

  association [0..*] to ZCDS_VDM_FLIGHT_USER as _Flight on _Flight.CarrierId = $projection.CarrierId
{
  key _Booking.travel_id     as TravelId,
  key _Booking.booking_id    as BookingId,

      @DefaultAggregation: #SUM
      @Semantics.amount.currencyCode: 'CurrencyCode'
      _Booking.flight_price  as FlightPrice,

      _Booking.booking_date  as BookingDate,
      _Booking.customer_id   as CustomerId,
      _Booking.carrier_id    as CarrierId,
      _Booking.connection_id as ConnectionId,
      _Booking.flight_date   as FlightDate,

      _Booking.currency_code as CurrencyCode,

      _Flight
}
