@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CUstomer Booking'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MASTER
}
define view entity ZCDS_CUST_BOOK_TND
  as select from /dmo/booking
  association to parent ZCDS_CUSTOMER_ROOT_TND as _Customer on _Customer.CustomerId = $projection.CustomerId

{
  key /dmo/booking.travel_id   as TravelId,
  key /dmo/booking.booking_id  as BookingId,
      /dmo/booking.customer_id as CustomerId,

      _Customer
}
