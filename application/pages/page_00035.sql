prompt --application/pages/page_00035
begin
--   Manifest
--     PAGE: 00035
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
 p_id=>35
,p_name=>'Depreciation Report'
,p_alias=>'DEPRECIATION-REPORT'
,p_step_title=>'Depreciation Report'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.deprec-card {',
'    border-radius: 12px;',
'    overflow: hidden;',
'    transition: transform .2s, box-shadow .2s;',
'}',
'',
'.deprec-card:hover {',
'    transform: translateY(-3px);',
'    box-shadow: 0 8px 20px rgba(0,0,0,.10);',
'}',
'',
'.deprec-card-ORDERS {',
'    border-top: 4px solid #2563eb;',
'}',
'',
'.deprec-card-QTY {',
'    border-top: 4px solid #dc2626;',
'}',
'',
'.deprec-card-PRODUCTS {',
'    border-top: 4px solid #7c3aed;',
'}',
'',
'.deprec-card-BRANCHES {',
'    border-top: 4px solid #0891b2;',
'}',
'',
'.deprec-card-ORDERS .a-CardView-body {',
'    color: #2563eb;',
'}',
'',
'.deprec-card-QTY .a-CardView-body {',
'    color: #dc2626;',
'}',
'',
'.deprec-card-PRODUCTS .a-CardView-body {',
'    color: #7c3aed;',
'}',
'',
'.deprec-card-BRANCHES .a-CardView-body {',
'    color: #0891b2;',
'}',
'',
'.deprec-card .a-CardView-body {',
'    font-size: 25px;',
'    font-weight: 700;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(6584439570348771)
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6847369116329210)
,p_plug_name=>'Depreciation Summary'
,p_region_name=>'depreciation_summary'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH FILTERED AS',
'(',
'    SELECT *',
'    FROM HR.INV_V_DEPRECIATION_REPORT',
'    WHERE',
'        (:P35_DATE_FROM IS NULL',
'         OR DEPREC_ORD_DATE >=',
'            TO_DATE(:P35_DATE_FROM, ''DD/MM/YYYY''))',
'',
'    AND (:P35_DATE_TO IS NULL',
'         OR DEPREC_ORD_DATE <',
'            TO_DATE(:P35_DATE_TO, ''DD/MM/YYYY'') + 1)',
'',
'    AND (:P35_BRANCH_ID IS NULL',
'         OR BRANCH_ID = :P35_BRANCH_ID)',
'',
'    AND (:P35_PROD_ID IS NULL',
'         OR PROD_ID = :P35_PROD_ID)',
'),',
'SUMMARY AS',
'(',
'    SELECT',
'        COUNT(DISTINCT DEPREC_ORD_ID) TOTAL_ORDERS,',
'        NVL(SUM(QUANTITY), 0) TOTAL_QTY,',
'        COUNT(DISTINCT PROD_ID) TOTAL_PRODUCTS,',
'        COUNT(DISTINCT BRANCH_ID) TOTAL_BRANCHES',
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
'        ''Total Orders'' CARD_TITLE,',
'        TOTAL_ORDERS CARD_VALUE,',
'        ''fa-file-text-o'' CARD_ICON,',
'        ''Number of depreciation orders'' CARD_SUBTITLE,',
'        ''ORDERS'' CARD_TYPE,',
'        1 SORT_ORDER',
'    FROM SUMMARY',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''Depreciated Qty'',',
'        TOTAL_QTY,',
'        ''fa-minus-circle'',',
'        ''Total depreciated units'',',
'        ''QTY'',',
'        2',
'    FROM SUMMARY',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''Affected Products'',',
'        TOTAL_PRODUCTS,',
'        ''fa-cubes'',',
'        ''Distinct affected products'',',
'        ''PRODUCTS'',',
'        3',
'    FROM SUMMARY',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''Affected Branches'',',
'        TOTAL_BRANCHES,',
'        ''fa-building-o'',',
'        ''Branches with depreciation'',',
'        ''BRANCHES'',',
'        4',
'    FROM SUMMARY',
')',
'ORDER BY SORT_ORDER'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P35_DATE_FROM,P35_DATE_TO,P35_BRANCH_ID,P35_PROD_ID'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6847519060329212)
,p_region_id=>wwv_flow_imp.id(6847369116329210)
,p_layout_type=>'GRID'
,p_grid_column_count=>4
,p_card_css_classes=>'deprec-card deprec-card-&CARD_TYPE.'
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
 p_id=>wwv_flow_imp.id(6847467576329211)
,p_plug_name=>'Depreciation Filters'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6857261850472267)
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
 p_id=>wwv_flow_imp.id(6857990344472271)
,p_plug_name=>'Depreciation Report'
,p_region_name=>'depreciation_report'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    DEPREC_ORD_ID,',
'    DEPREC_ORD_DATE,',
'    BRANCH_NAME,',
'    EMP_NAME,',
'    PROD_NAME,',
'    QUANTITY,',
'    DEPREC_ORD_NOTES,',
'    CREATED_BY,',
'    CREATED_DATE',
'FROM HR.INV_V_DEPRECIATION_REPORT',
'WHERE',
'    (',
'        :P35_DATE_FROM IS NULL',
'        OR DEPREC_ORD_DATE >=',
'           TO_DATE(:P35_DATE_FROM, ''DD/MM/YYYY'')',
'    )',
'AND (',
'        :P35_DATE_TO IS NULL',
'        OR DEPREC_ORD_DATE <',
'           TO_DATE(:P35_DATE_TO, ''DD/MM/YYYY'') + 1',
'    )',
'AND (',
'        :P35_BRANCH_ID IS NULL',
'        OR BRANCH_ID = :P35_BRANCH_ID',
'    )',
'AND (',
'        :P35_PROD_ID IS NULL',
'        OR PROD_ID = :P35_PROD_ID',
'    )'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P35_DATE_FROM,P35_DATE_TO,P35_BRANCH_ID,P35_PROD_ID'
,p_prn_page_header=>'Depreciation Report'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6858034246472271)
,p_name=>'Depreciation Report'
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
,p_internal_uid=>6858034246472271
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6858764932472276)
,p_db_column_name=>'DEPREC_ORD_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Depreciation No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6859186106472281)
,p_db_column_name=>'DEPREC_ORD_DATE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Depreciation Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6859585318472282)
,p_db_column_name=>'BRANCH_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Branch'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6859904735472282)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6860348654472284)
,p_db_column_name=>'PROD_NAME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Product'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6860780799472284)
,p_db_column_name=>'QUANTITY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Depreciated Quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6861156132472285)
,p_db_column_name=>'DEPREC_ORD_NOTES'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Notes'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6861588963472285)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6861939422472287)
,p_db_column_name=>'CREATED_DATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Created Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6866563739488882)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'68666'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DEPREC_ORD_ID:DEPREC_ORD_DATE:BRANCH_NAME:EMP_NAME:PROD_NAME:QUANTITY:DEPREC_ORD_NOTES:CREATED_BY:CREATED_DATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6848397678329220)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6847467576329211)
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
 p_id=>wwv_flow_imp.id(6847631294329213)
,p_name=>'P35_DATE_FROM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6847467576329211)
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
 p_id=>wwv_flow_imp.id(6847736936329214)
,p_name=>'P35_DATE_TO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6847467576329211)
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
 p_id=>wwv_flow_imp.id(6847809208329215)
,p_name=>'P35_BRANCH_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6847467576329211)
,p_prompt=>'Branch'
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
,p_colspan=>3
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6847967251329216)
,p_name=>'P35_PROD_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6847467576329211)
,p_prompt=>'Product'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT PROD_NAME d,',
'       PROD_ID r',
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
 p_id=>wwv_flow_imp.id(6848033918329217)
,p_name=>'DA_REFRESH_DEPRECIATION'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P35_DATE_FROM,P35_DATE_TO,P35_BRANCH_ID,P35_PROD_ID'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6848151322329218)
,p_event_id=>wwv_flow_imp.id(6848033918329217)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>unistr('Refresh \2192 Depreciation Report')
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6857990344472271)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6848231380329219)
,p_event_id=>wwv_flow_imp.id(6848033918329217)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>unistr('Refresh \2192 Depreciation Summary')
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6847369116329210)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6848406026329221)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6848397678329220)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6848581904329222)
,p_event_id=>wwv_flow_imp.id(6848406026329221)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Clear Depreciation Filter'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'[',
'    "P35_DATE_FROM",',
'    "P35_DATE_TO",',
'    "P35_BRANCH_ID",',
'    "P35_PROD_ID"',
'].forEach(function(itemName) {',
'    apex.item(itemName).setValue("", null, true);',
'});',
'',
'var reportRegion = apex.region("depreciation_report");',
'',
'if (reportRegion) {',
'    reportRegion.refresh();',
'}',
'',
'var summaryRegion = apex.region("depreciation_summary");',
'',
'if (summaryRegion) {',
'    summaryRegion.refresh();',
'}'))
);
wwv_flow_imp.component_end;
end;
/
