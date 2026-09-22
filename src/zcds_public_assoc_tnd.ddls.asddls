@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Public Association'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MASTER
}

define view entity ZCDS_PUBLIC_ASSOC_TND
  as select from /dmo/travel as Travel

  association [1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerID
  association [1..*] to /dmo/flight   as _Flights  on _Flights.carrier_id = $projection.CarrierID

{
  key Travel.travel_id    as TravelID,
      Travel.agency_id    as AgencyID,
      Travel.customer_id  as CustomerID,
      _Flights.carrier_id as CarrierID,

      _Customer

}
