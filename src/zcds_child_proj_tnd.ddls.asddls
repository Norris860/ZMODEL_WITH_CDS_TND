@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection - Child Interface'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_CHILD_PROJ_TND
//  provider contract transactional_interface
  as projection on ZCDS_CUST_BOOK_TND
{
  key TravelId,
  key BookingId,
      CustomerId,
      /* Associations */
      _Customer
}
