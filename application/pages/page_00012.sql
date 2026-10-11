prompt --application/pages/page_00012
begin
--   Manifest
--     PAGE: 00012
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
 p_id=>12
,p_name=>'Employees'
,p_alias=>'EMPLOYEES'
,p_step_title=>'Employees'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(1103941645144916)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(598261687487219)
,p_plug_name=>'Employees'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    E.EMP_ID,',
'    E.EMP_NAME,',
'    E.EMP_PHONE,',
'    E.EMP_EMAIL,',
'    B.BRANCH_NAME AS EMP_BRANCH,',
'    CASE E.EMP_ISACTIVE',
'        WHEN ''1'' THEN ''<span class="t-Badge t-Badge--success">Active</span>''',
'        WHEN ''0'' THEN ''<span class="t-Badge t-Badge--danger">Inactive</span>''',
'    END AS EMP_ISACTIVE,',
'    E.EMP_CR_USER,',
'    E.EMP_CR_DATE',
'FROM INV_EMPLOYEES E',
'JOIN INV_BRANCHES B',
'    ON B.BRANCH_ID = E.EMP_BRANCH_ID',
'ORDER BY E.EMP_ID DESC;'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Employees'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(598370874487219)
,p_name=>'Employees'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_base_pk1=>'EMP_ID'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:13:&APP_SESSION.::&DEBUG.:RP:P13_EMP_ID:\#EMP_ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'ADMIN'
,p_internal_uid=>6406580612310795
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(599078853487220)
,p_db_column_name=>'EMP_ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Emp ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(599391468487222)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Emp Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(599874499487224)
,p_db_column_name=>'EMP_PHONE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Emp Phone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(600262396487224)
,p_db_column_name=>'EMP_EMAIL'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Emp Email'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601012251487225)
,p_db_column_name=>'EMP_ISACTIVE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Emp Isactive'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601433247487225)
,p_db_column_name=>'EMP_CR_USER'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Emp Cr User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(601824100487227)
,p_db_column_name=>'EMP_CR_DATE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Emp Cr Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1406850554453665)
,p_db_column_name=>'EMP_BRANCH'
,p_display_order=>18
,p_column_identifier=>'I'
,p_column_label=>'Emp Branch'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(604560106490538)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'64128'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EMP_NAME:EMP_PHONE:EMP_EMAIL:EMP_BRANCH:EMP_ISACTIVE:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(603908136487231)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(602367450487227)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(598261687487219)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:13:&APP_SESSION.::&DEBUG.:13::'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(602618722487228)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(598261687487219)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(603152951487228)
,p_event_id=>wwv_flow_imp.id(602618722487228)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(598261687487219)
);
wwv_flow_imp.component_end;
end;
/
