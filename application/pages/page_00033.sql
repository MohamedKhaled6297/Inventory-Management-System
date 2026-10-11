prompt --application/pages/page_00033
begin
--   Manifest
--     PAGE: 00033
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>68919995520195961853
,p_default_application_id=>139471
,p_default_id_offset=>5808209737823576
,p_default_owner=>'WKSP_TOKIO2'
);
wwv_flow_imp_page.create_page(
 p_id=>33
,p_name=>'Order IN Report'
,p_alias=>'ORDER-IN-REPORT'
,p_step_title=>'Order IN Report'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.order-in-card {',
'    border-radius: 12px;',
'    overflow: hidden;',
'    transition: transform .2s, box-shadow .2s;',
'}',
'',
'.order-in-card:hover {',
'    transform: translateY(-3px);',
'    box-shadow: 0 8px 20px rgba(0,0,0,.10);',
'}',
'',
'.order-in-card-ORDERS {',
'    border-top: 4px solid #2196f3;',
'}',
'',
'.order-in-card-QTY {',
'    border-top: 4px solid #2e7d32;',
'}',
'',
'.order-in-card-VALUE {',
'    border-top: 4px solid #8e24aa;',
'}',
'',
'.order-in-card-LINES {',
'    border-top: 4px solid #ff9800;',
'}',
'',
'.order-in-card-ORDERS .a-CardView-body {',
'    color: #1976d2;',
'}',
'',
'.order-in-card-QTY .a-CardView-body {',
'    color: #2e7d32;',
'}',
'',
'.order-in-card-VALUE .a-CardView-body {',
'    color: #8e24aa;',
'}',
'',
'.order-in-card-LINES .a-CardView-body {',
'    color: #e65100;',
'}',
'',
'.order-in-card .a-CardView-body {',
'    font-size: 25px;',
'    font-weight: 700;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(776229832525195)
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(958035146313457)
,p_plug_name=>'Order IN Summary'
,p_region_name=>'order_in_summary'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH FILTERED AS',
'(',
'    SELECT *',
'    FROM HR.INV_V_ORDER_IN_REPORT',
'    WHERE',
'        (',
'            :P33_DATE_FROM IS NULL',
'            OR ORDER_IN_DATE >=',
'               TO_DATE(:P33_DATE_FROM, ''DD/MM/YYYY'')',
'        )',
'        AND (',
'            :P33_DATE_TO IS NULL',
'            OR ORDER_IN_DATE <',
'               TO_DATE(:P33_DATE_TO, ''DD/MM/YYYY'') + 1',
'        )',
'        AND (',
'            :P33_BRANCH_ID IS NULL',
'            OR BRANCH_ID = :P33_BRANCH_ID',
'        )',
'        AND (',
'            :P33_PROD_ID IS NULL',
'            OR PROD_ID = :P33_PROD_ID',
'        )',
'),',
'SUMMARY AS',
'(',
'    SELECT',
'        COUNT(DISTINCT ORDER_IN_ID) AS TOTAL_ORDERS,',
'        NVL(SUM(QUANTITY), 0) AS TOTAL_QTY,',
'        NVL(SUM(TOTAL_VALUE), 0) AS TOTAL_AMOUNT,',
'        COUNT(*) AS TOTAL_LINES',
'    FROM FILTERED',
')',
'SELECT',
'    CARD_TITLE,',
'    CARD_VALUE,',
'    CARD_ICON,',
'    CARD_SUBTITLE,',
'    CARD_TYPE',
'FROM',
'(',
'    SELECT',
'        ''Total Orders'' AS CARD_TITLE,',
'        TOTAL_ORDERS AS CARD_VALUE,',
'        ''fa-file-text-o'' AS CARD_ICON,',
'        ''Number of receiving orders'' AS CARD_SUBTITLE,',
'        ''ORDERS'' AS CARD_TYPE,',
'        1 AS SORT_ORDER',
'    FROM SUMMARY',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''Received Qty'',',
'        TOTAL_QTY,',
'        ''fa-cubes'',',
'        ''Total received units'',',
'        ''QTY'',',
'        2',
'    FROM SUMMARY',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''Total Value'',',
'        TOTAL_AMOUNT,',
'        ''fa-money'',',
'        ''Total receiving value'',',
'        ''VALUE'',',
'        3',
'    FROM SUMMARY',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''Order Lines'',',
'        TOTAL_LINES,',
'        ''fa-list'',',
'        ''Number of product lines'',',
'        ''LINES'',',
'        4',
'    FROM SUMMARY',
')',
'ORDER BY SORT_ORDER'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P33_DATE_FROM,P33_DATE_TO,P33_BRANCH_ID,P33_PROD_ID'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(958236186313459)
,p_region_id=>wwv_flow_imp.id(958035146313457)
,p_layout_type=>'GRID'
,p_grid_column_count=>4
,p_card_css_classes=>'order-in-card order-in-card-&CARD_TYPE.'
,p_title_adv_formatting=>false
,p_title_column_name=>'CARD_TITLE'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'CARD_SUBTITLE'
,p_body_adv_formatting=>false
,p_body_column_name=>'CARD_VALUE'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_css_classes=>'fa &CARD_ICON.'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(958108051313458)
,p_plug_name=>'Order IN Filters'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1008094968256481)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(114548710692820457195)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1008805053256486)
,p_plug_name=>'Order IN Report'
,p_region_name=>'order_in_report'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ORDER_IN_ID,',
'    ORDER_IN_DATE,',
'    BRANCH_NAME,',
'    EMP_NAME,',
'    SUPPLIER_ID,',
'    PROD_NAME,',
'    QUANTITY,',
'    UNIT_PRICE,',
'    TOTAL_VALUE,',
'    ORDER_IN_NOTES',
'FROM HR.INV_V_ORDER_IN_REPORT',
'WHERE',
'    (:P33_DATE_FROM IS NULL',
'     OR ORDER_IN_DATE >= TO_DATE(:P33_DATE_FROM,''DD/MM/YYYY''))',
'AND (:P33_DATE_TO IS NULL',
'     OR ORDER_IN_DATE < TO_DATE(:P33_DATE_TO,''DD/MM/YYYY'') + 1)',
'AND (:P33_BRANCH_ID IS NULL',
'     OR BRANCH_ID = :P33_BRANCH_ID)',
'AND (:P33_PROD_ID IS NULL',
'     OR PROD_ID = :P33_PROD_ID)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P33_DATE_FROM,P33_DATE_TO,P33_BRANCH_ID,P33_PROD_ID'
,p_prn_page_header=>'Order IN Report'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(1008984750256486)
,p_name=>'Order IN Report'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'ADMIN'
,p_internal_uid=>6817194488080062
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1009624756256492)
,p_db_column_name=>'ORDER_IN_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Order No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1010080447256494)
,p_db_column_name=>'ORDER_IN_DATE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Order Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1010430656256495)
,p_db_column_name=>'BRANCH_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Branch'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1010878605256497)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1011239087256497)
,p_db_column_name=>'SUPPLIER_ID'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Supplier ID'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1011680124256499)
,p_db_column_name=>'PROD_NAME'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Product'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1012038484256500)
,p_db_column_name=>'QUANTITY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1012399675256502)
,p_db_column_name=>'UNIT_PRICE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Unit Price'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1012854791256502)
,p_db_column_name=>'TOTAL_VALUE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Total Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990D00'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1013196607256503)
,p_db_column_name=>'ORDER_IN_NOTES'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Notes'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1017750867269786)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'68260'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ORDER_IN_ID:ORDER_IN_DATE:BRANCH_NAME:EMP_NAME:SUPPLIER_ID:PROD_NAME:QUANTITY:UNIT_PRICE:TOTAL_VALUE:ORDER_IN_NOTES'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(958763675313464)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(958108051313458)
,p_button_name=>'CLEAR_FILTERS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear Filters'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-eraser'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(958387543313460)
,p_name=>'P33_DATE_FROM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(958108051313458)
,p_prompt=>'Date From'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(958403894313461)
,p_name=>'P33_DATE_TO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(958108051313458)
,p_prompt=>'Date To'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(958559037313462)
,p_name=>'P33_BRANCH_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(958108051313458)
,p_prompt=>'Branch'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT BRANCH_NAME d, BRANCH_ID r',
'FROM INV_BRANCHES',
'ORDER BY BRANCH_NAME'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Branches -'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(958620011313463)
,p_name=>'P33_PROD_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(958108051313458)
,p_prompt=>'Product'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT PROD_NAME d, PROD_ID r',
'FROM INV_PRODUCT',
'ORDER BY PROD_NAME'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Products -'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(958863523313465)
,p_name=>'Refresh Order IN Dashboard'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P33_DATE_FROM,P33_DATE_TO,P33_BRANCH_ID,P33_PROD_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(958898291313466)
,p_event_id=>wwv_flow_imp.id(958863523313465)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>unistr('Refresh \2192 Order IN Report')
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1008805053256486)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(959024184313467)
,p_event_id=>wwv_flow_imp.id(958863523313465)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>unistr('Refresh \2192 Order IN Summary')
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(958035146313457)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(959104397313468)
,p_name=>'Clear Order IN Filter'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(958763675313464)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(959286674313469)
,p_event_id=>wwv_flow_imp.id(959104397313468)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'[',
'    "P33_DATE_FROM",',
'    "P33_DATE_TO",',
'    "P33_BRANCH_ID",',
'    "P33_PROD_ID"',
'].forEach(function (itemName) {',
'    apex.item(itemName).setValue("", null, true);',
'});',
'',
'apex.region("order_in_report").refresh();',
'apex.region("order_in_summary").refresh();'))
);
wwv_flow_imp.component_end;
end;
/
