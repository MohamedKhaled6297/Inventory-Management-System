prompt --application/pages/page_00023
begin
--   Manifest
--     PAGE: 00023
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
 p_id=>23
,p_name=>'Stock Movement'
,p_alias=>'STOCK-MOVEMENT'
,p_step_title=>'Stock Movement'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.movement-badge {',
'    display: inline-flex;',
'    align-items: center;',
'    justify-content: center;',
'    gap: 7px;',
'    padding: 6px 13px;',
'    border-radius: 20px;',
'    font-size: 12px;',
'    font-weight: 600;',
'    white-space: nowrap;',
'    min-width: 125px;',
'}',
'',
'.movement-in {',
'    background: #e8f5e9;',
'    color: #1b5e20;',
'    border: 1px solid #a5d6a7;',
'}',
'',
'.movement-out {',
'    background: #ffebee;',
'    color: #b71c1c;',
'    border: 1px solid #ef9a9a;',
'}',
'',
'.movement-transfer-in {',
'    background: #e3f2fd;',
'    color: #0d47a1;',
'    border: 1px solid #90caf9;',
'}',
'',
'.movement-transfer-out {',
'    background: #fff3e0;',
'    color: #e65100;',
'    border: 1px solid #ffcc80;',
'}',
'',
'.movement-depreciation {',
'    background: #f3e5f5;',
'    color: #6a1b9a;',
'    border: 1px solid #ce93d8;',
'}',
'',
'',
'',
'/* Summery Cards */',
'',
'',
'.movement-card {',
'    border-radius: 12px;',
'    overflow: hidden;',
'    transition: transform .2s ease, box-shadow .2s ease;',
'}',
'',
'.movement-card:hover {',
'    transform: translateY(-3px);',
'    box-shadow: 0 8px 20px rgba(0,0,0,.10);',
'}',
'',
'.movement-card-IN {',
'    border-top: 4px solid #2e7d32;',
'}',
'',
'.movement-card-OUT {',
'    border-top: 4px solid #d32f2f;',
'}',
'',
'.movement-card-TRANSFER {',
'    border-top: 4px solid #1976d2;',
'}',
'',
'.movement-card-DEPRECIATION {',
'    border-top: 4px solid #8e24aa;',
'}',
'',
'',
'/* Movement Summary - Card Values */',
'',
'.movement-card-IN .a-CardView-body {',
'    color: #2e7d32;',
'    font-size: 28px;',
'    font-weight: 700;',
'}',
'',
'.movement-card-OUT .a-CardView-body {',
'    color: #d32f2f;',
'    font-size: 28px;',
'    font-weight: 700;',
'}',
'',
'.movement-card-TRANSFER .a-CardView-body {',
'    color: #1976d2;',
'    font-size: 28px;',
'    font-weight: 700;',
'}',
'',
'.movement-card-DEPRECIATION .a-CardView-body {',
'    color: #8e24aa;',
'    font-size: 28px;',
'    font-weight: 700;',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(6584439570348771)
,p_protection_level=>'C'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6757255342116318)
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
 p_id=>wwv_flow_imp.id(6757922685116339)
,p_plug_name=>'Stock Movement'
,p_region_name=>'stock_movement_report'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH STOCK_MOVEMENTS AS',
'(',
'    ------------------------------------------------------------',
'    -- ORDER IN',
'    ------------------------------------------------------------',
'    SELECT',
'        O.ORDER_IN_DATE AS MOVEMENT_DATE,',
'        O.ORDER_IN_BRANCH_ID AS BRANCH_ID,',
'        D.ORDER_IN_DETAILS_PROD_ID AS PROD_ID,',
'        ''ORDER IN'' AS MOVEMENT_TYPE,',
'        D.ORDER_IN_DETAILS_QUANTITY AS QUANTITY,',
'        ''Order IN #'' || O.ORDER_IN_ID AS REFERENCE_NO,',
'        O.ORDER_IN_EMP_ID AS EMP_ID',
'    FROM INV_ORDER_IN O',
'    JOIN INV_ORDER_IN_DETAILS D',
'      ON D.ORDER_IN_DETAILS_ORDERIN_ID = O.ORDER_IN_ID',
'',
'    UNION ALL',
'',
'    ------------------------------------------------------------',
'    -- ORDER OUT',
'    ------------------------------------------------------------',
'    SELECT',
'        O.ORDER_OUT_DATE,',
'        O.ORDER_OUT_BRANCH_ID,',
'        D.ORDER_OUT_DETAILS_PROD_ID,',
'        ''ORDER OUT'',',
'        -D.ORDER_OUT_DETAILS_QUANTITY,',
'        ''Order OUT #'' || O.ORDER_OUT_ID,',
'        O.ORDER_OUT_EMP_ID',
'    FROM INV_ORDER_OUT O',
'    JOIN INV_ORDER_OUT_DETAILS D',
'      ON D.ORDER_OUT_DETAILS_ORDEROUT_ID = O.ORDER_OUT_ID',
'',
'    UNION ALL',
'',
'    ------------------------------------------------------------',
'    -- TRANSFER OUT',
'    ------------------------------------------------------------',
'    SELECT',
'        T.TRAN_ORD_DATE,',
'        T.TRAN_ORD_FROM_BRANCH_ID,',
'        D.TRAN_ORD_DETAILS_PROD_ID,',
'        ''TRANSFER OUT'',',
'        -D.TRAN_ORD_DETAILS_QUANTITY,',
'        ''Transfer #'' || T.TRAN_ORD_ID,',
'        T.TRAN_ORD_EMP_ID',
'    FROM INV_TRANSFARE_ORDER T',
'    JOIN INV_TRANSFARE_ORDER_DETAILS D',
'      ON D.TRAN_ORD_DETAILS_TRAN_ORD_ID = T.TRAN_ORD_ID',
'',
'    UNION ALL',
'',
'    ------------------------------------------------------------',
'    -- TRANSFER IN',
'    ------------------------------------------------------------',
'    SELECT',
'        T.TRAN_ORD_DATE,',
'        T.TRAN_ORD_TO_BRANCH_ID,',
'        D.TRAN_ORD_DETAILS_PROD_ID,',
'        ''TRANSFER IN'',',
'        D.TRAN_ORD_DETAILS_QUANTITY,',
'        ''Transfer #'' || T.TRAN_ORD_ID,',
'        T.TRAN_ORD_EMP_ID',
'    FROM INV_TRANSFARE_ORDER T',
'    JOIN INV_TRANSFARE_ORDER_DETAILS D',
'      ON D.TRAN_ORD_DETAILS_TRAN_ORD_ID = T.TRAN_ORD_ID',
'',
'    UNION ALL',
'',
'    ------------------------------------------------------------',
'    -- DEPRECIATION',
'    ------------------------------------------------------------',
'    SELECT',
'        O.DEPREC_ORD_DATE,',
'        O.DEPREC_ORD_BRANCH_ID,',
'        D.DEPREC_ORD_DETAILS_PROD_ID,',
'        ''DEPRECIATION'',',
'        -D.DEPREC_ORD_DETAILS_QUANTITY,',
'        ''Depreciation #'' || O.DEPREC_ORD_ID,',
'        O.DEPREC_ORD_EMP_ID',
'    FROM INV_DEPRECIATION_ORDER O',
'    JOIN INV_DEPRECIATION_ORDER_DETAILS D',
'      ON D.DEPREC_ORD_DETAILS_DEPREC_ORD_ID = O.DEPREC_ORD_ID',
')',
'',
'SELECT',
'    M.MOVEMENT_DATE,',
'    B.BRANCH_NAME AS BRANCH,',
'    P.PROD_NAME AS PRODUCT,',
'    M.MOVEMENT_TYPE AS MOVEMENT_TYPE_CODE,',
'    CASE M.MOVEMENT_TYPE',
'        WHEN ''ORDER IN'' THEN',
'            ''<span class="movement-badge movement-in">',
'             <span class="fa fa-arrow-down"></span>',
'             Order IN</span>''',
'',
'        WHEN ''ORDER OUT'' THEN',
'            ''<span class="movement-badge movement-out">',
'             <span class="fa fa-arrow-up"></span>',
'             Order OUT</span>''',
'',
'        WHEN ''TRANSFER IN'' THEN',
'            ''<span class="movement-badge movement-transfer-in">',
'             <span class="fa fa-exchange"></span>',
'             Transfer IN</span>''',
'',
'        WHEN ''TRANSFER OUT'' THEN',
'            ''<span class="movement-badge movement-transfer-out">',
'             <span class="fa fa-exchange"></span>',
'             Transfer OUT</span>''',
'',
'        WHEN ''DEPRECIATION'' THEN',
'            ''<span class="movement-badge movement-depreciation">',
'             <span class="fa fa-minus-circle"></span>',
'             Depreciation</span>''',
'',
'    END AS MOVEMENT_TYPE,',
'    M.QUANTITY,',
'    M.REFERENCE_NO,',
'    E.EMP_NAME AS EMPLOYEE',
'FROM STOCK_MOVEMENTS M',
'LEFT JOIN INV_BRANCHES B',
'  ON B.BRANCH_ID = M.BRANCH_ID',
'LEFT JOIN INV_PRODUCT P',
'  ON P.PROD_ID = M.PROD_ID',
'LEFT JOIN INV_EMPLOYEES E',
'  ON E.EMP_ID = M.EMP_ID',
'WHERE',
'    (',
'        :P23_DATE_FROM IS NULL',
'        OR M.MOVEMENT_DATE >=',
'           TO_DATE(:P23_DATE_FROM, ''DD/MM/YYYY'')',
'    )',
'',
'AND (',
'        :P23_DATE_TO IS NULL',
'        OR M.MOVEMENT_DATE <',
'           TO_DATE(:P23_DATE_TO, ''DD/MM/YYYY'') + 1',
'    )',
'',
'AND (',
'        :P23_BRANCH_ID IS NULL',
'        OR M.BRANCH_ID = :P23_BRANCH_ID',
'    )',
'',
'AND (',
'        :P23_PROD_ID IS NULL',
'        OR M.PROD_ID = :P23_PROD_ID',
'    )',
'',
'AND (',
'        :P23_MOVEMENT_TYPE IS NULL',
'        OR M.MOVEMENT_TYPE = :P23_MOVEMENT_TYPE',
'    )',
'ORDER BY',
'    M.MOVEMENT_DATE DESC,',
'    M.REFERENCE_NO DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P23_DATE_FROM,P23_DATE_TO,P23_BRANCH_ID,P23_PROD_ID,P23_MOVEMENT_TYPE'
,p_prn_page_header=>'Stock Movement'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6758004172116339)
,p_name=>'Stock Movement'
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
,p_internal_uid=>6758004172116339
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6758717535116357)
,p_db_column_name=>'MOVEMENT_DATE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Movement Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6763267834137003)
,p_db_column_name=>'EMPLOYEE'
,p_display_order=>11
,p_column_identifier=>'J'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6763088887137001)
,p_db_column_name=>'BRANCH'
,p_display_order=>21
,p_column_identifier=>'H'
,p_column_label=>'Branch'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6763194366137002)
,p_db_column_name=>'PRODUCT'
,p_display_order=>31
,p_column_identifier=>'I'
,p_column_label=>'Product'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6763342194137004)
,p_db_column_name=>'MOVEMENT_TYPE_CODE'
,p_display_order=>41
,p_column_identifier=>'K'
,p_column_label=>'Movement Type Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6759807923116367)
,p_db_column_name=>'MOVEMENT_TYPE'
,p_display_order=>51
,p_column_identifier=>'D'
,p_column_label=>'Movement Type'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6760211654116367)
,p_db_column_name=>'QUANTITY'
,p_display_order=>61
,p_column_identifier=>'E'
,p_column_label=>'Quantity'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6760600781116368)
,p_db_column_name=>'REFERENCE_NO'
,p_display_order=>71
,p_column_identifier=>'F'
,p_column_label=>'Reference No'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6761666342117406)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'67617'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MOVEMENT_DATE:EMPLOYEE:BRANCH:PRODUCT:MOVEMENT_TYPE:QUANTITY:REFERENCE_NO:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6763421582137005)
,p_plug_name=>'Movement Summary'
,p_region_name=>'movement_summary'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH MOVEMENTS AS',
'(',
'    ------------------------------------------------------------',
'    -- ORDER IN',
'    ------------------------------------------------------------',
'    SELECT',
'        O.ORDER_IN_DATE AS MOVEMENT_DATE,',
'        O.ORDER_IN_BRANCH_ID AS BRANCH_ID,',
'        D.ORDER_IN_DETAILS_PROD_ID AS PROD_ID,',
'        ''ORDER IN'' AS MOVEMENT_TYPE,',
'        D.ORDER_IN_DETAILS_QUANTITY AS QTY',
'    FROM INV_ORDER_IN O',
'    JOIN INV_ORDER_IN_DETAILS D',
'      ON D.ORDER_IN_DETAILS_ORDERIN_ID = O.ORDER_IN_ID',
'',
'    UNION ALL',
'',
'    ------------------------------------------------------------',
'    -- ORDER OUT',
'    ------------------------------------------------------------',
'    SELECT',
'        O.ORDER_OUT_DATE,',
'        O.ORDER_OUT_BRANCH_ID,',
'        D.ORDER_OUT_DETAILS_PROD_ID,',
'        ''ORDER OUT'',',
'        D.ORDER_OUT_DETAILS_QUANTITY',
'    FROM INV_ORDER_OUT O',
'    JOIN INV_ORDER_OUT_DETAILS D',
'      ON D.ORDER_OUT_DETAILS_ORDEROUT_ID = O.ORDER_OUT_ID',
'',
'    UNION ALL',
'',
'    ------------------------------------------------------------',
'    -- TRANSFER OUT',
'    ------------------------------------------------------------',
'    SELECT',
'        T.TRAN_ORD_DATE,',
'        T.TRAN_ORD_FROM_BRANCH_ID,',
'        D.TRAN_ORD_DETAILS_PROD_ID,',
'        ''TRANSFER OUT'',',
'        D.TRAN_ORD_DETAILS_QUANTITY',
'    FROM INV_TRANSFARE_ORDER T',
'    JOIN INV_TRANSFARE_ORDER_DETAILS D',
'      ON D.TRAN_ORD_DETAILS_TRAN_ORD_ID = T.TRAN_ORD_ID',
'',
'    UNION ALL',
'',
'    ------------------------------------------------------------',
'    -- TRANSFER IN',
'    ------------------------------------------------------------',
'    SELECT',
'        T.TRAN_ORD_DATE,',
'        T.TRAN_ORD_TO_BRANCH_ID,',
'        D.TRAN_ORD_DETAILS_PROD_ID,',
'        ''TRANSFER IN'',',
'        D.TRAN_ORD_DETAILS_QUANTITY',
'    FROM INV_TRANSFARE_ORDER T',
'    JOIN INV_TRANSFARE_ORDER_DETAILS D',
'      ON D.TRAN_ORD_DETAILS_TRAN_ORD_ID = T.TRAN_ORD_ID',
'',
'    UNION ALL',
'',
'    ------------------------------------------------------------',
'    -- DEPRECIATION',
'    ------------------------------------------------------------',
'    SELECT',
'        O.DEPREC_ORD_DATE,',
'        O.DEPREC_ORD_BRANCH_ID,',
'        D.DEPREC_ORD_DETAILS_PROD_ID,',
'        ''DEPRECIATION'',',
'        D.DEPREC_ORD_DETAILS_QUANTITY',
'    FROM INV_DEPRECIATION_ORDER O',
'    JOIN INV_DEPRECIATION_ORDER_DETAILS D',
'      ON D.DEPREC_ORD_DETAILS_DEPREC_ORD_ID = O.DEPREC_ORD_ID',
'),',
'FILTERED_MOVEMENTS AS',
'(',
'    SELECT *',
'    FROM MOVEMENTS M',
'    WHERE',
'        (',
'            :P23_DATE_FROM IS NULL',
'            OR M.MOVEMENT_DATE >=',
'               TO_DATE(:P23_DATE_FROM, ''DD/MM/YYYY'')',
'        )',
'        AND (',
'            :P23_DATE_TO IS NULL',
'            OR M.MOVEMENT_DATE <',
'               TO_DATE(:P23_DATE_TO, ''DD/MM/YYYY'') + 1',
'        )',
'        AND (',
'            :P23_BRANCH_ID IS NULL',
'            OR M.BRANCH_ID = :P23_BRANCH_ID',
'        )',
'        AND (',
'            :P23_PROD_ID IS NULL',
'            OR M.PROD_ID = :P23_PROD_ID',
'        )',
'        AND (',
'            :P23_MOVEMENT_TYPE IS NULL',
'            OR M.MOVEMENT_TYPE = :P23_MOVEMENT_TYPE',
'        )',
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
'        ''Order IN'' AS CARD_TITLE,',
'        NVL(SUM(CASE WHEN MOVEMENT_TYPE = ''ORDER IN''',
'                     THEN QTY ELSE 0 END), 0) AS CARD_VALUE,',
'        ''fa-arrow-down'' AS CARD_ICON,',
'        ''Total received quantity'' AS CARD_SUBTITLE,',
'        ''IN'' AS CARD_TYPE,',
'        1 AS SORT_ORDER',
'    FROM FILTERED_MOVEMENTS',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''Order OUT'',',
'        NVL(SUM(CASE WHEN MOVEMENT_TYPE = ''ORDER OUT''',
'                     THEN QTY ELSE 0 END), 0),',
'        ''fa-arrow-up'',',
'        ''Total issued quantity'',',
'        ''OUT'',',
'        2',
'    FROM FILTERED_MOVEMENTS',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''Transfers'',',
'        NVL(SUM(CASE WHEN MOVEMENT_TYPE = ''TRANSFER OUT''',
'                     THEN QTY ELSE 0 END), 0),',
'        ''fa-exchange'',',
'        ''Total transferred out quantity'',',
'        ''TRANSFER'',',
'        3',
'    FROM FILTERED_MOVEMENTS',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''Depreciation'',',
'        NVL(SUM(CASE WHEN MOVEMENT_TYPE = ''DEPRECIATION''',
'                     THEN QTY ELSE 0 END), 0),',
'        ''fa-minus-circle'',',
'        ''Total depreciated quantity'',',
'        ''DEPRECIATION'',',
'        4',
'    FROM FILTERED_MOVEMENTS',
')',
'ORDER BY SORT_ORDER'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P23_DATE_FROM,P23_DATE_TO,P23_BRANCH_ID,P23_PROD_ID,P23_MOVEMENT_TYPE'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6763575412137006)
,p_region_id=>wwv_flow_imp.id(6763421582137005)
,p_layout_type=>'GRID'
,p_grid_column_count=>4
,p_card_css_classes=>'movement-card movement-card-&CARD_TYPE.'
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
 p_id=>wwv_flow_imp.id(6763607042137007)
,p_plug_name=>'Movement Filters'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6764581456137016)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6763607042137007)
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
 p_id=>wwv_flow_imp.id(6763700099137008)
,p_name=>'P23_DATE_FROM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6763607042137007)
,p_prompt=>'Date From'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(6763800732137009)
,p_name=>'P23_DATE_TO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6763607042137007)
,p_prompt=>'Date To'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(6763944884137010)
,p_name=>'P23_BRANCH_ID'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6763607042137007)
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
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6764021558137011)
,p_name=>'P23_PROD_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(6763607042137007)
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
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6764187026137012)
,p_name=>'P23_MOVEMENT_TYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6763607042137007)
,p_prompt=>'Movement Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Order IN;ORDER IN,Order OUT;ORDER OUT,Transfer IN;TRANSFER IN,Transfer OUT;TRANSFER OUT,Depreciation;DEPRECIATION'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Movements -'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6764231037137013)
,p_name=>'Refresh Movement Dashboard'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_DATE_FROM,P23_DATE_TO,P23_BRANCH_ID,P23_PROD_ID,P23_MOVEMENT_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6764303763137014)
,p_event_id=>wwv_flow_imp.id(6764231037137013)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Stock Movement'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6757922685116339)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6764409309137015)
,p_event_id=>wwv_flow_imp.id(6764231037137013)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Refresh Movement Summary'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6763421582137005)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6764645315137017)
,p_name=>'Clear Movement Filters'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(6764581456137016)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6764885346137019)
,p_event_id=>wwv_flow_imp.id(6764645315137017)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// 1. Clear all filters without firing Change events',
'[',
'    "P23_DATE_FROM",',
'    "P23_DATE_TO",',
'    "P23_BRANCH_ID",',
'    "P23_PROD_ID",',
'    "P23_MOVEMENT_TYPE"',
'].forEach(function (itemName) {',
'    apex.item(itemName).setValue("", null, true);',
'});',
'',
'// 2. Refresh both regions after clearing all values',
'apex.region("stock_movement_report").refresh();',
'apex.region("movement_summary").refresh();'))
);
wwv_flow_imp.component_end;
end;
/
