prompt --application/pages/page_00030
begin
--   Manifest
--     PAGE: 00030
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
 p_id=>30
,p_name=>'Current Stock'
,p_alias=>'CURRENT-STOCK'
,p_step_title=>'Current Stock'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.stock-badge {',
'    display: inline-flex;',
'    align-items: center;',
'    gap: 6px;',
'    padding: 5px 12px;',
'    border-radius: 20px;',
'    font-size: 12px;',
'    font-weight: 600;',
'    white-space: nowrap;',
'}',
'',
'.stock-badge .fa {',
'    font-size: 13px;',
'}',
'',
'/* Normal Stock */',
'.stock-normal {',
'    background: #e8f5e9;',
'    color: #1b5e20;',
'    border: 1px solid #a5d6a7;',
'}',
'',
'/* Low Stock */',
'.stock-low {',
'    background: #fff3e0;',
'    color: #e65100;',
'    border: 1px solid #ffcc80;',
'}',
'',
'/* Out Of Stock */',
'.stock-out {',
'    background: #ffebee;',
'    color: #b71c1c;',
'    border: 1px solid #ef9a9a;',
'}',
'',
'/* Over Stock */',
'.stock-over {',
'    background: #e3f2fd;',
'    color: #0d47a1;',
'    border: 1px solid #90caf9;',
'}',
'',
'',
'',
'',
'/******************************/',
'/* Current Stock Summary Cards */',
'',
'.stock-card {',
'    border-radius: 12px;',
'    overflow: hidden;',
'    transition: transform .2s ease, box-shadow .2s ease;',
'}',
'',
'.stock-card:hover {',
'    transform: translateY(-3px);',
'    box-shadow: 0 8px 20px rgba(0,0,0,.10);',
'}',
'',
'/* Total Products */',
'.stock-card-PRODUCTS {',
'    border-top: 4px solid #2196f3;',
'}',
'',
'/* Total Quantity */',
'.stock-card-QUANTITY {',
'    border-top: 4px solid #00acc1;',
'}',
'',
'/* Low Stock */',
'.stock-card-LOW {',
'    border-top: 4px solid #ff9800;',
'}',
'',
'/* Out of Stock */',
'.stock-card-OUT {',
'    border-top: 4px solid #f44336;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(6584439570348771)
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4403942086369937)
,p_plug_name=>'Stock Summary'
,p_title=>'Stock Summary'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ''Total Products'' AS CARD_TITLE,',
'       COUNT(DISTINCT S.STOCK_PROD_ID) AS CARD_VALUE,',
'       ''fa-cubes'' AS CARD_ICON,',
'       ''Products currently in stock'' AS CARD_SUBTITLE,',
'       ''PRODUCTS'' AS CARD_TYPE',
'FROM INV_STOCK S',
'JOIN INV_PRODUCT P',
'  ON P.PROD_ID = S.STOCK_PROD_ID',
'WHERE (:P30_BRANCH_ID IS NULL',
'       OR S.STOCK_BRANCH_ID = :P30_BRANCH_ID)',
'  AND (',
'       :P30_STOCK_STATUS IS NULL',
'       OR :P30_STOCK_STATUS =',
'          CASE',
'              WHEN S.STOCK_QTY = 0 THEN ''OUT_OF_STOCK''',
'              WHEN P.PROD_MIN_STOCK IS NOT NULL',
'               AND S.STOCK_QTY <= P.PROD_MIN_STOCK THEN ''LOW_STOCK''',
'              WHEN P.PROD_MAX_STOCK IS NOT NULL',
'               AND S.STOCK_QTY > P.PROD_MAX_STOCK THEN ''OVER_STOCK''',
'              ELSE ''NORMAL''',
'          END',
'      )',
'',
'UNION ALL',
'',
'SELECT ''Total Stock Qty'',',
'       NVL(SUM(S.STOCK_QTY), 0),',
'       ''fa-database'',',
'       ''Total quantity across selected stock'',',
'       ''QUANTITY''',
'FROM INV_STOCK S',
'JOIN INV_PRODUCT P',
'  ON P.PROD_ID = S.STOCK_PROD_ID',
'WHERE (:P30_BRANCH_ID IS NULL',
'       OR S.STOCK_BRANCH_ID = :P30_BRANCH_ID)',
'  AND (',
'       :P30_STOCK_STATUS IS NULL',
'       OR :P30_STOCK_STATUS =',
'          CASE',
'              WHEN S.STOCK_QTY = 0 THEN ''OUT_OF_STOCK''',
'              WHEN P.PROD_MIN_STOCK IS NOT NULL',
'               AND S.STOCK_QTY <= P.PROD_MIN_STOCK THEN ''LOW_STOCK''',
'              WHEN P.PROD_MAX_STOCK IS NOT NULL',
'               AND S.STOCK_QTY > P.PROD_MAX_STOCK THEN ''OVER_STOCK''',
'              ELSE ''NORMAL''',
'          END',
'      )',
'',
'UNION ALL',
'',
'SELECT ''Low Stock'',',
'       COUNT(*),',
'       ''fa-exclamation-triangle'',',
'       ''Products at or below minimum level'',',
'       ''LOW''',
'FROM INV_STOCK S',
'JOIN INV_PRODUCT P',
'  ON P.PROD_ID = S.STOCK_PROD_ID',
'WHERE (:P30_BRANCH_ID IS NULL',
'       OR S.STOCK_BRANCH_ID = :P30_BRANCH_ID)',
'  AND S.STOCK_QTY > 0',
'  AND P.PROD_MIN_STOCK IS NOT NULL',
'  AND S.STOCK_QTY <= P.PROD_MIN_STOCK',
'  AND (:P30_STOCK_STATUS IS NULL',
'       OR :P30_STOCK_STATUS = ''LOW_STOCK'')',
'',
'UNION ALL',
'',
'SELECT ''Out of Stock'',',
'       COUNT(*),',
'       ''fa-times-circle'',',
'       ''Products with zero quantity'',',
'       ''OUT''',
'FROM INV_STOCK S',
'JOIN INV_PRODUCT P',
'  ON P.PROD_ID = S.STOCK_PROD_ID',
'WHERE (:P30_BRANCH_ID IS NULL',
'       OR S.STOCK_BRANCH_ID = :P30_BRANCH_ID)',
'  AND S.STOCK_QTY = 0',
'  AND (:P30_STOCK_STATUS IS NULL',
'       OR :P30_STOCK_STATUS = ''OUT_OF_STOCK'')'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P30_BRANCH_ID,P30_STOCK_STATUS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(4404086154369938)
,p_region_id=>wwv_flow_imp.id(4403942086369937)
,p_layout_type=>'GRID'
,p_grid_column_count=>4
,p_card_css_classes=>'stock-card stock-card-&CARD_TYPE.'
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
 p_id=>wwv_flow_imp.id(4404222800369940)
,p_plug_name=>'Stock Filters'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6714769494730118)
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
 p_id=>wwv_flow_imp.id(6715424407730125)
,p_plug_name=>'Current Stock'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    S.STOCK_ID,',
'',
'    B.BRANCH_ID,',
'    B.BRANCH_NAME,',
'',
'    P.PROD_ID,',
'    P.PROD_NAME,',
'',
'    P.PROD_MIN_STOCK,',
'    P.PROD_MAX_STOCK,',
'',
'    S.STOCK_QTY,',
'',
'    CASE',
'        WHEN S.STOCK_QTY = 0 THEN ''OUT_OF_STOCK''',
'',
'        WHEN P.PROD_MIN_STOCK IS NOT NULL',
'         AND S.STOCK_QTY <= P.PROD_MIN_STOCK THEN ''LOW_STOCK''',
'',
'        WHEN P.PROD_MAX_STOCK IS NOT NULL',
'         AND S.STOCK_QTY > P.PROD_MAX_STOCK THEN ''OVER_STOCK''',
'',
'        ELSE ''NORMAL''',
'    END AS STOCK_STATUS_CODE,',
'',
'',
'    CASE',
'        WHEN S.STOCK_QTY = 0 THEN',
'            ''<span class="stock-badge stock-out">',
'                <span class="fa fa-times-circle"></span>',
'                Out of Stock',
'             </span>''',
'',
'        WHEN P.PROD_MIN_STOCK IS NOT NULL',
'             AND S.STOCK_QTY <= P.PROD_MIN_STOCK THEN',
'            ''<span class="stock-badge stock-low">',
'                <span class="fa fa-exclamation-triangle"></span>',
'                Low Stock',
'             </span>''',
'',
'        WHEN P.PROD_MAX_STOCK IS NOT NULL',
'             AND S.STOCK_QTY > P.PROD_MAX_STOCK THEN',
'            ''<span class="stock-badge stock-over">',
'                <span class="fa fa-arrow-circle-up"></span>',
'                Over Stock',
'             </span>''',
'',
'        ELSE',
'            ''<span class="stock-badge stock-normal">',
'                <span class="fa fa-check-circle"></span>',
'                Normal',
'             </span>''',
'    END AS STOCK_STATUS',
'',
'FROM INV_STOCK S',
'',
'JOIN INV_BRANCHES B',
'    ON B.BRANCH_ID = S.STOCK_BRANCH_ID',
'',
'JOIN INV_PRODUCT P',
'    ON P.PROD_ID = S.STOCK_PROD_ID',
'',
'WHERE (:P30_BRANCH_ID IS NULL',
'       OR S.STOCK_BRANCH_ID = :P30_BRANCH_ID)',
'',
'AND (',
'    :P30_STOCK_STATUS IS NULL',
'',
'    OR :P30_STOCK_STATUS =',
'       CASE',
'           WHEN S.STOCK_QTY = 0 THEN ''OUT_OF_STOCK''',
'',
'           WHEN P.PROD_MIN_STOCK IS NOT NULL',
'            AND S.STOCK_QTY <= P.PROD_MIN_STOCK',
'               THEN ''LOW_STOCK''',
'',
'           WHEN P.PROD_MAX_STOCK IS NOT NULL',
'            AND S.STOCK_QTY > P.PROD_MAX_STOCK',
'               THEN ''OVER_STOCK''',
'',
'           ELSE ''NORMAL''',
'       END',
')',
'',
'',
'ORDER BY',
'    B.BRANCH_NAME,',
'    P.PROD_NAME'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P30_BRANCH_ID,P30_STOCK_STATUS'
,p_prn_page_header=>'Current Stock'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6715553689730125)
,p_name=>'Current Stock'
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
,p_internal_uid=>6715553689730125
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6716165819730140)
,p_db_column_name=>'STOCK_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Stock Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6716596988730143)
,p_db_column_name=>'BRANCH_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Branch Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6716938594730145)
,p_db_column_name=>'BRANCH_NAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Branch'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6717327185730145)
,p_db_column_name=>'PROD_ID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Prod Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6717756513730146)
,p_db_column_name=>'PROD_NAME'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Product'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6718162046730148)
,p_db_column_name=>'PROD_MIN_STOCK'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Min Stock'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6718564283730148)
,p_db_column_name=>'PROD_MAX_STOCK'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Max Stock'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6718967647730148)
,p_db_column_name=>'STOCK_QTY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Current Stock'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4404141127369939)
,p_db_column_name=>'STOCK_STATUS_CODE'
,p_display_order=>18
,p_column_identifier=>'J'
,p_column_label=>'Stock Status Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6719353649730150)
,p_db_column_name=>'STOCK_STATUS'
,p_display_order=>28
,p_column_identifier=>'I'
,p_column_label=>'Stock Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6719726581731968)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'67198'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'STOCK_ID:BRANCH_ID:BRANCH_NAME:PROD_ID:PROD_NAME:PROD_MIN_STOCK:PROD_MAX_STOCK:STOCK_QTY:STOCK_STATUS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(4404878470369946)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(4404222800369940)
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
 p_id=>wwv_flow_imp.id(4404311183369941)
,p_name=>'P30_BRANCH_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(4404222800369940)
,p_prompt=>'Branch'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT BRANCH_NAME d,',
'       BRANCH_ID r',
'FROM INV_BRANCHES',
'WHERE BRANCH_ISACTIVE = ''1''',
'ORDER BY BRANCH_NAME'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Branches -'
,p_cHeight=>1
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4404483621369942)
,p_name=>'P30_STOCK_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(4404222800369940)
,p_prompt=>'Stock Status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Normal;NORMAL,Low Stock;LOW_STOCK,Out of Stock;OUT_OF_STOCK,Over Stock;OVER_STOCK'
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
 p_id=>wwv_flow_imp.id(4404544502369943)
,p_name=>'Refresh Stock Dashboard'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P30_BRANCH_ID, P30_STOCK_STATUS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4404692734369944)
,p_event_id=>wwv_flow_imp.id(4404544502369943)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6715424407730125)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4404728838369945)
,p_event_id=>wwv_flow_imp.id(4404544502369943)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(4403942086369937)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(4404972989369947)
,p_name=>'Clear Stock Filters'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(4404878470369946)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4405024633369948)
,p_event_id=>wwv_flow_imp.id(4404972989369947)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P30_BRANCH_ID,P30_STOCK_STATUS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4405156046369949)
,p_event_id=>wwv_flow_imp.id(4404972989369947)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Current Stock'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6715424407730125)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4405277947369950)
,p_event_id=>wwv_flow_imp.id(4404972989369947)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Cards'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(4403942086369937)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
