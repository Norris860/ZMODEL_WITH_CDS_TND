@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight Hierarchy'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MASTER
}

define view entity ZCDS_FLIGHT_HIERA_TND
  as select from zdmo_travel
  association [1..1] to ZCDS_FLIGHT_HIERA_TND as _Agency on _Agency.AgencyID = $projection.CustomerID
{
  key agency_id   as AgencyID,
      customer_id as CustomerID,
      _Agency
}
