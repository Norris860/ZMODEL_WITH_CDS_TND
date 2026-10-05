CLASS zcl_custom_detail_tnd DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_rap_query_provider.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_custom_detail_tnd IMPLEMENTATION.

  METHOD if_rap_query_provider~select.

    DATA lt_table TYPE TABLE OF ZCDS_CUSTOM_DETAIL_TND.

    TRY.
        IF io_request->is_data_requested( ).

          DATA(lv_top)  = io_request->get_paging( )->get_page_size(  ).
          DATA(lv_skip) = io_request->get_paging( )->get_offset( ).

          SELECT FROM /dmo/customer
          FIELDS customer_id,
                 phone_number,
                 email_address
          Order by customer_id Descending
          INTO TABLE @lt_table
          offset @lv_skip
          UP to @lv_top rows.


          IF syst-subrc EQ 0.
            io_response->set_total_number_of_records( lines( lt_table ) ).
            io_response->set_data( lt_table ).
          ENDIF.

        ENDIF.

      CATCH cx_rap_query_response_set_twic INTO DATA(lx_excl).
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
