CLASS zcl_patch_express_tnd DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_patch_express_tnd IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    SELECT FROM zcds_public_assoc_tnd AS Travel
      FIELDS Travel~agencyid,
             Travel~travelID,
             concat_with_space( \_Customer-first_name, \_Customer-last_name, 1 ) AS CustomerName
             Where Travel~agencyid = '070032'
             INTO TABLE @DATA(It_Results)
             UP TO 10 ROWS.

    IF syst-subrc = 0.
      out->write( It_Results ).
    ENDIF.


  ENDMETHOD.

ENDCLASS.
