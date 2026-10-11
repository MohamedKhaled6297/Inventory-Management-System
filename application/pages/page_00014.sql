prompt --application/pages/page_00014
begin
--   Manifest
--     PAGE: 00014
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
 p_id=>14
,p_name=>'Products'
,p_alias=>'PRODUCTS'
,p_step_title=>'Products'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(6912151382968492)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6434932377650101)
,p_plug_name=>'Products'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    P.PROD_ID,',
'    P.PROD_NAME,',
'',
'    C.PROD_CATG_NAME AS CATEGORY_NAME,',
'',
'    U.UNIT_NAME AS UNIT_NAME,',
'',
'    S.SUPPLIER_NAME AS SUPPLIER_NAME,',
'',
'    P.PROD_MIN_STOCK,',
'    P.PROD_MAX_STOCK,',
'',
'    CASE ',
'        WHEN P.PROD_ISACTIVE = ''1'' ',
'        THEN ''Active''',
'        ELSE ''Inactive''',
'    END STATUS,',
'',
'    CASE ',
'        WHEN P.PROD_ISACTIVE = ''1''',
'        THEN ''success''',
'        ELSE ''danger''',
'    END STATUS_COLOR,',
'',
'    P.PROD_CR_USER,',
'    P.PROD_CR_DATE',
'',
'FROM INV_PRODUCT P',
'',
'LEFT JOIN INV_PRODUCT_CATG C',
'    ON C.PROD_CATG_ID = P.PROD_PROD_CATG_ID',
'',
'LEFT JOIN INV_UNITS U',
'    ON U.UNIT_ID = P.PROD_UNIT_ID',
'',
'LEFT JOIN INV_SUPPLIERS S',
'    ON S.SUPPLIER_ID = P.PROD_SUPPLIER_ID',
'',
'ORDER BY P.PROD_ID DESC;'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Products'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6435055164650101)
,p_name=>'Products'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_base_pk1=>'PROD_ID'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:15:&APP_SESSION.::&DEBUG.:RP:P15_PROD_ID:\#PROD_ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'ADMIN'
,p_internal_uid=>6435055164650101
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6435737847650103)
,p_db_column_name=>'PROD_ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Prod ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6436141716650104)
,p_db_column_name=>'PROD_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Product Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4401704326369915)
,p_db_column_name=>'CATEGORY_NAME'
,p_display_order=>12
,p_column_identifier=>'N'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4401815710369916)
,p_db_column_name=>'UNIT_NAME'
,p_display_order=>22
,p_column_identifier=>'O'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4401966698369917)
,p_db_column_name=>'SUPPLIER_NAME'
,p_display_order=>32
,p_column_identifier=>'P'
,p_column_label=>'Supplier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6437784109650106)
,p_db_column_name=>'PROD_MIN_STOCK'
,p_display_order=>42
,p_column_identifier=>'F'
,p_column_label=>'Prod Min Stock'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6438122735650106)
,p_db_column_name=>'PROD_MAX_STOCK'
,p_display_order=>52
,p_column_identifier=>'G'
,p_column_label=>'Prod Max Stock'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6438934981650107)
,p_db_column_name=>'PROD_CR_USER'
,p_display_order=>62
,p_column_identifier=>'I'
,p_column_label=>'Prod Cr User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6439395403650107)
,p_db_column_name=>'PROD_CR_DATE'
,p_display_order=>72
,p_column_identifier=>'J'
,p_column_label=>'Prod Cr Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4402025605369918)
,p_db_column_name=>'STATUS'
,p_display_order=>92
,p_column_identifier=>'Q'
,p_column_label=>'Status'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'TMPL_THEME_42$BADGE'
,p_column_alignment=>'CENTER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'LABEL', 'Status',
  'LABEL_DISPLAY', 'N',
  'STATE', 'STATUS_COLOR',
  'VALUE', 'STATUS')).to_clob
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(4402103365369919)
,p_db_column_name=>'STATUS_COLOR'
,p_display_order=>102
,p_column_identifier=>'R'
,p_column_label=>'Status Color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6442067649652043)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'64421'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PROD_NAME:CATEGORY_NAME:UNIT_NAME:SUPPLIER_NAME:PROD_MIN_STOCK:PROD_MAX_STOCK:STATUS:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6441488909650110)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6439896223650109)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6434932377650101)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:15:&APP_SESSION.::&DEBUG.:15::'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6440148192650109)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(6434932377650101)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6440694478650109)
,p_event_id=>wwv_flow_imp.id(6440148192650109)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6434932377650101)
);
wwv_flow_imp.component_end;
end;
/
