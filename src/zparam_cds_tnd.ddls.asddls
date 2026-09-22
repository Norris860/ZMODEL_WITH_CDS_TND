@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parameters CDS'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZPARAM_CDS_TND
  with parameters pflight_date : abap.dats
  as select from /dmo/booking
{
  key travel_id   as TravelID,
  key booking_id  as BookingID,
      customer_id as CustomerID,
      flight_date as FlightDate
}
where
  flight_date = $parameters.pflight_date
