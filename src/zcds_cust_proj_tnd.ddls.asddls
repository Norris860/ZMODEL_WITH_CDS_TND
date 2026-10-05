@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection - Contract Customer'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCDS_CUST_PROJ_TND
  provider contract transactional_interface
  as projection on ZCDS_CUSTOMER_ROOT_TND
{
  key CustomerId,
      FirstName,
      LastName,
      City,
      /* Associations */
      _Airport,
      _Booking,
      _Customer
}
