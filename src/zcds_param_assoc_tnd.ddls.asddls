@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Asociaciones con Parámetros'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #A,
    sizeCategory: #S,
    dataClass: #MASTER
}

define view entity ZCDS_PARAM_ASSOC_TND

  with parameters
    pCarrierID : /dmo/carrier_id

  as select from /dmo/flight

  association [0..1] to /dmo/carrier as _Carrier on _Carrier.carrier_id = /dmo/flight.carrier_id

{
  key carrier_id    as CarrierID,
  key connection_id as ConnectionID,
  key flight_date   as FlightDate,
      _Carrier.name as Name

}
where
  carrier_id = $parameters.pCarrierID;
