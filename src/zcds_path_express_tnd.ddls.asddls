@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Asociaciones Filtradas - Path Expression - cardinalidad'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZCDS_PATH_EXPRESS_TND
  as select from /dmo/booking as Booking

  association [0..*] to /dmo/flight as _Flights on _Flights.carrier_id    = Booking.carrier_id
                                               and _Flights.connection_id = Booking.connection_id
                                               and _Flights.flight_date   = Booking.flight_date

{
  key Booking.booking_id                              as BookingID,
  key Booking.travel_id                               as TravelID,
      _Flights[connection_id = '0001'].seats_occupied as SeatOcc,

      // Necesito desplegar toda la llave para que funcione:
      Booking.carrier_id                              as CarrierID,
      Booking.connection_id                           as ConnectionID,
      Booking.flight_date                             as FlightDate,

      _Flights

}
