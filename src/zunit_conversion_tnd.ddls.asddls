@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Unit Conversion'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZUNIT_CONVERSION_TND
  as select from /dmo/fsa_root_a
{
  key id                                                   as DataID,
      string_property                                      as StrigProp,

      @Semantics.quantity.unitOfMeasure: 'OriginalUnit'
      field_with_quantity                                  as OriginalQty,
      uom                                                  as OriginalUnit,

      @Semantics.quantity.unitOfMeasure: 'ConvertedUnit'
      unit_conversion( quantity       => field_with_quantity,
                       source_unit    => uom,
                       target_unit    => abap.unit'KJ',
                       error_handling => 'SET_TO_NULL',
                       client         => $session.client ) as ConvertedQty,
      abap.unit'KJ'                                         as ConvertedUnit
}
where uom = 'M3';
