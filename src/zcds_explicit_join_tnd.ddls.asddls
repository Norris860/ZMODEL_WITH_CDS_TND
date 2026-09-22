@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Join Explícito'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MASTER
}

define view entity ZCDS_EXPLICIT_JOIN_TND
  as select from /dmo/customer as Customer

  association [0..*] to /dmo/booking as _Booking on _Booking.customer_id = $projection.CustomerID
{
  key Customer.customer_id  as CustomerID,
      Customer.first_name   as FirstName,
      Customer.last_name    as LastName,
      _Booking.booking_date as BookingDate
}
