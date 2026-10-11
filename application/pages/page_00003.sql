prompt --application/pages/page_00003
begin
--   Manifest
--     PAGE: 00003
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
 p_id=>3
,p_name=>'Branches'
,p_alias=>'BRANCHES1'
,p_step_title=>'Branches'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(6912151382968492)
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(122760650537097378777)
,p_plug_name=>'Branches'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select BRANCH_ID,',
'       BRANCH_NAME,',
'       BRANCH_LOCATION,',
'       CASE BRANCH_ISACTIVE',
'            WHEN ''1'' THEN ''<span class="t-Badge t-Badge--success">Active</span>''',
'            WHEN ''0'' THEN ''<span class="t-Badge t-Badge--danger">Inactive</span>''',
'        END AS BRANCH_ISACTIVE,',
'       BRANCH_CR_USER,',
'       BRANCH_CR_DATE',
'  from INV_BRANCHES'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Branches'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(122760650639409378777)
,p_name=>'Branches'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_base_pk1=>'BRANCH_ID'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:RP:P4_BRANCH_ID:\#BRANCH_ID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'MUHAMED.KHALED2020@GMAIL.COM'
,p_internal_uid=>122754842429671555201
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(122760651348946378778)
,p_db_column_name=>'BRANCH_ID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Branch ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(122760651783937378779)
,p_db_column_name=>'BRANCH_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Branch Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(122760652204186378779)
,p_db_column_name=>'BRANCH_LOCATION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Branch Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(122760652557676378779)
,p_db_column_name=>'BRANCH_ISACTIVE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Branch IsActive'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(122760652967886378780)
,p_db_column_name=>'BRANCH_CR_USER'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Branch Cr User'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(122760653377122378780)
,p_db_column_name=>'BRANCH_CR_DATE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Branch Cr Date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(122760890220413693243)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1227550821'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'BRANCH_ID:BRANCH_NAME:BRANCH_LOCATION:BRANCH_ISACTIVE:BRANCH_CR_USER:BRANCH_CR_DATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(122760655507830378781)
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
 p_id=>wwv_flow_imp.id(122760653876776378780)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(122760650537097378777)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:4::'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(122760654154242378780)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(122760650537097378777)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(122760654685001378781)
,p_event_id=>wwv_flow_imp.id(122760654154242378780)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(122760650537097378777)
);
wwv_flow_imp.component_end;
end;
/
