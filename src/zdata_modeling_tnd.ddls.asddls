@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data Modeling'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #B,
    sizeCategory: #S,
    dataClass: #MIXED
}

define view entity ZDATA_MODELING_TND
  as select from /dmo/customer
{

  key customer_id                as customerID,
      first_name                 as FirstName,
      last_name                  as LastName,
      $session.client            as ClientField,
      $session.system_date       as SystemDate,
      $session.system_language   as SystemLanguage,
      $session.user              as UserField,
      $session.user_date         as UserDate,
      $session.user_timezone     as UserTz,

      cast('12345' as abap.int8) as customer_id_User,

      case country_code
        when 'US' then 'United States'
        when 'DE' then 'Germany'      
        else 'Other Country'
      end                        as Case1

}
