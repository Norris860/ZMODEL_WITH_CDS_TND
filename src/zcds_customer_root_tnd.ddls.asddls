@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer Root'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZCDS_CUSTOMER_ROOT_TND
  as select from /dmo/customer

  composition [1..*] of ZCDS_CUST_BOOK_TND as _Booking
  
  association [1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerId
  association [1..*] to /dmo/airport  as _Airport  on _Airport.city = $projection.City
{
  key customer_id as CustomerId,
      first_name  as FirstName,
      last_name   as LastName,
      city        as City,
      _Customer, 
      _Booking,
      _Airport
      
}
