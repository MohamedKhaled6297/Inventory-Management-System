prompt --application/pages/page_00031
begin
--   Manifest
--     PAGE: 00031
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1600544795405981
,p_default_application_id=>106
,p_default_id_offset=>5808209737823576
,p_default_owner=>'HR'
);
wwv_flow_imp_page.create_page(
 p_id=>31
,p_name=>'Stock Reconciliation'
,p_alias=>'STOCK-RECONCILIATION'
,p_step_title=>'Stock Reconciliation'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Reconciliation Status */',
'',
'.recon-badge {',
'    display: inline-flex;',
'    align-items: center;',
'    justify-content: center;',
'    gap: 7px;',
'    padding: 6px 14px;',
'    border-radius: 20px;',
'    font-size: 12px;',
'    font-weight: 600;',
'    min-width: 115px;',
'}',
'',
'.recon-match {',
'    color: #1b5e20;',
'    background: #e8f5e9;',
'    border: 1px solid #a5d6a7;',
'}',
'',
'.recon-mismatch {',
'    color: #b71c1c;',
'    background: #ffebee;',
'    border: 1px solid #ef9a9a;',
'}',
'',
'/* Smmery Cards  */',
'',
'.recon-card {',
'    border-radius: 12px;',
'    overflow: hidden;',
'    transition: transform .2s ease,',
'                box-shadow .2s ease;',
'}',
'',
'.recon-card:hover {',
'    transform: translateY(-3px);',
'    box-shadow: 0 8px 20px rgba(0,0,0,.10);',
'}',
'',
'.recon-card-STOCK {',
'    border-top: 4px solid #2196f3;',
'}',
'',
'.recon-card-MATCH {',
'    border-top: 4px solid #2e7d32;',
'}',
'',
'.recon-card-MISMATCH {',
'    border-top: 4px solid #d32f2f;',
'}',
'',
'.recon-card-DIFFERENCE {',
'    border-top: 4px solid #8e24aa;',
'}',
'',
'.recon-card-STOCK .a-CardView-body {',
'    color: #1976d2;',
'}',
'',
'.recon-card-MATCH .a-CardView-body {',
'    color: #2e7d32;',
'}',
'',
'.recon-card-MISMATCH .a-CardView-body {',
'    color: #d32f2f;',
'}',
'',
'.recon-card-DIFFERENCE .a-CardView-body {',
'    color: #8e24aa;',
'}',
'',
'.recon-card .a-CardView-body {',
'    font-size: 24px;',
'    font-weight: 700;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(6584439570348771)
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6765101229137022)
,p_plug_name=>'Reconciliation Summary'
,p_region_name=>'recon_summary'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH FILTERED_DATA AS',
'(',
'    SELECT *',
'    FROM HR.INV_V_STOCK_RECONCILIATION',
'    WHERE',
'        (:P31_BRANCH_ID IS NULL',
'         OR BRANCH_ID = :P31_BRANCH_ID)',
'',
'    AND (:P31_STATUS IS NULL',
'         OR RECON_STATUS = :P31_STATUS)',
'),',
'SUMMARY AS',
'(',
'    SELECT',
'        NVL(SUM(ACTUAL_QTY), 0) TOTAL_STOCK,',
'        NVL(SUM(CASE WHEN RECON_STATUS = ''MATCH''',
'                     THEN 1 ELSE 0 END), 0) MATCHED,',
'        NVL(SUM(CASE WHEN RECON_STATUS = ''MISMATCH''',
'                     THEN 1 ELSE 0 END), 0) MISMATCHED,',
'        NVL(SUM(ABS(DIFFERENCE)), 0) TOTAL_DIFFERENCE',
'    FROM FILTERED_DATA',
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
'        ''Stock Quantity'' CARD_TITLE,',
'        TOTAL_STOCK CARD_VALUE,',
'        ''fa-database'' CARD_ICON,',
'        ''Actual quantity in selected stock'' CARD_SUBTITLE,',
'        ''STOCK'' CARD_TYPE,',
'        1 SORT_ORDER',
'    FROM SUMMARY',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''Matched Records'',',
'        MATCHED,',
'        ''fa-check-circle'',',
'        ''Balances matching transactions'',',
'        ''MATCH'',',
'        2',
'    FROM SUMMARY',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''Mismatched Records'',',
'        MISMATCHED,',
'        ''fa-exclamation-triangle'',',
'        ''Balances requiring investigation'',',
'        ''MISMATCH'',',
'        3',
'    FROM SUMMARY',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''Total Difference'',',
'        TOTAL_DIFFERENCE,',
'        ''fa-balance-scale'',',
'        ''Total absolute quantity difference'',',
'        ''DIFFERENCE'',',
'        4',
'    FROM SUMMARY',
')',
'ORDER BY SORT_ORDER'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P31_BRANCH_ID,P31_STATUS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6765224338137023)
,p_region_id=>wwv_flow_imp.id(6765101229137022)
,p_layout_type=>'GRID'
,p_grid_column_count=>4
,p_card_css_classes=>'recon-card recon-card-&CARD_TYPE.'
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
 p_id=>wwv_flow_imp.id(6765344379137024)
,p_plug_name=>'Reconciliation Filters'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6795945351912426)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(114554518902558280771)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6796647109912439)
,p_plug_name=>'Stock Reconciliation'
,p_region_name=>'recon_report'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    BRANCH_ID,',
'    BRANCH_NAME,',
'    PROD_ID,',
'    PROD_NAME,',
'    ACTUAL_QTY,',
'    CALCULATED_QTY,',
'    DIFFERENCE,',
'    RECON_STATUS,',
'',
'    CASE RECON_STATUS',
'        WHEN ''MATCH'' THEN',
'            ''<span class="recon-badge recon-match">',
'                <span class="fa fa-check-circle"></span>',
'                MATCH',
'             </span>''',
'',
'        ELSE',
'            ''<span class="recon-badge recon-mismatch">',
'                <span class="fa fa-exclamation-triangle"></span>',
'                MISMATCH',
'             </span>''',
'    END AS STATUS_BADGE',
'',
'FROM HR.INV_V_STOCK_RECONCILIATION',
'WHERE',
'    (:P31_BRANCH_ID IS NULL',
'     OR BRANCH_ID = :P31_BRANCH_ID)',
'',
'AND (:P31_STATUS IS NULL',
'     OR RECON_STATUS = :P31_STATUS)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P31_BRANCH_ID,P31_STATUS'
,p_prn_page_header=>'Stock Reconciliation'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6796760864912439)
,p_name=>'Stock Reconciliation'
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
,p_internal_uid=>6796760864912439
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6797463637912450)
,p_db_column_name=>'BRANCH_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Branch Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6797886978912454)
,p_db_column_name=>'BRANCH_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Branch'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6798286149912456)
,p_db_column_name=>'PROD_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Prod Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6798686438912456)
,p_db_column_name=>'PROD_NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Product'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6799081794912460)
,p_db_column_name=>'ACTUAL_QTY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Actual Stock'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6799407086912464)
,p_db_column_name=>'CALCULATED_QTY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Calculated Stock'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6799804702912464)
,p_db_column_name=>'DIFFERENCE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Difference'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6800285995912465)
,p_db_column_name=>'RECON_STATUS'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6765059983137021)
,p_db_column_name=>'STATUS_BADGE'
,p_display_order=>18
,p_column_identifier=>'I'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6803256473923843)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'68033'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'BRANCH_NAME:PROD_NAME:ACTUAL_QTY:CALCULATED_QTY:DIFFERENCE:STATUS_BADGE:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6765996896137030)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6765344379137024)
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
 p_id=>wwv_flow_imp.id(6765474944137025)
,p_name=>'P31_BRANCH_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6765344379137024)
,p_prompt=>'Branch Id'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT BRANCH_NAME d,',
'       BRANCH_ID r',
'FROM INV_BRANCHES',
'ORDER BY BRANCH_NAME'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Branches -'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6765595983137026)
,p_name=>'P31_STATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6765344379137024)
,p_prompt=>'Status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Matched;MATCH,Mismatched;MISMATCH'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Statuses -'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6765672288137027)
,p_name=>'Refresh Reconciliation Dashboard'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P31_BRANCH_ID,P31_STATUS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6765792679137028)
,p_event_id=>wwv_flow_imp.id(6765672288137027)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Stock Reconciliation'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6796647109912439)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6765851474137029)
,p_event_id=>wwv_flow_imp.id(6765672288137027)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Reconciliation Summary'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6765101229137022)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6766016065137031)
,p_name=>'Clear Reconciliation Filters'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6765996896137030)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6766138973137032)
,p_event_id=>wwv_flow_imp.id(6766016065137031)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'[',
'    "P31_BRANCH_ID",',
'    "P31_STATUS"',
'].forEach(function (itemName) {',
'    apex.item(itemName).setValue("", null, true);',
'});',
'',
'apex.region("recon_report").refresh();',
'apex.region("recon_summary").refresh();'))
);
wwv_flow_imp.component_end;
end;
/
