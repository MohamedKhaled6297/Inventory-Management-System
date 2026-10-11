prompt --application/pages/page_09999
begin
--   Manifest
--     PAGE: 09999
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
 p_id=>9999
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'Inventory Management System'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/************************************',
' * 1) LOGIN PAGE CONTAINER (Background)',
' ************************************/',
'.t-Login-container  {',
'    display: flex;',
'    justify-content: center;',
'    align-items: center;',
'    min-height: 100vh;',
'',
'    /* Base gradient */',
'    background: radial-gradient(circle at 20% 30%, #00BFFF 0%, #0096D6 40%, #0077B6 100%);',
'    position: relative;',
'    overflow: hidden;',
'}',
'',
'',
'/************************************',
' * 2) LIGHT BIG GLOW DOTS BEHIND EVERYTHING',
' ************************************/',
'.t-Login-container::before,',
'.t-Login-container::after {',
'    content: "";',
'    position: absolute;',
'    width: 350px;',
'    height: 350px;',
'    background: rgba(255, 255, 255, 0.20);',
'    border-radius: 50%;',
'    filter: blur(40px);',
'    animation: bubbleFloat 12s infinite ease-in-out;',
'    z-index: 0; /* behind bubble layer */',
'}',
'',
'.t-Login-container::before {',
'    top: 15%;',
'    left: 10%;',
'}',
'',
'.t-Login-container::after {',
'    bottom: 15%;',
'    right: 10%;',
'}',
'',
'@keyframes bubbleFloat {',
'    0%, 100% { transform: translateY(0) scale(1); opacity: 0.5; }',
'    50%      { transform: translateY(-50px) scale(1.2); opacity: 0.8; }',
'}',
'',
'/************************************',
' * 3) LOGIN REGION (White Card)',
' ************************************/',
'.t-Login-region {',
'    position: relative;',
'    z-index: 999; /* keeps it ALWAYS above bubbles */',
'    background: #ffffff;',
'    border-radius: 20px;',
'    padding: 40px;',
'    width: 420px;',
'    box-shadow:',
'        0 10px 40px rgba(0, 0, 0, 0.15),',
'        0 0 25px rgba(0,150,214,0.4);',
'}',
'',
'/************************************',
' * 4) LOGIN LOGO',
' ************************************/',
'.t-Login-logo {',
'    width: 140px;',
'    height: 140px;',
'    margin: 0 auto 20px;',
'    border-radius: 20px;',
'    background: #ffffff;',
'    box-shadow: 0 0 25px rgba(0,150,214,0.4);',
'    position: relative;',
'    overflow: hidden;',
'}',
'',
'.t-Login-logo::after {',
'    content: "";',
'    position: absolute;',
'    inset: 0;',
'    /* background-image: url("#APP_FILES#RQ.png"); */',
'    background-size: 75%;',
'    background-position: center;',
'    background-repeat: no-repeat;',
'}',
'',
'',
'',
'/************************************',
' * 7) BUTTON',
' ************************************/',
'.t-Button {',
'    background: linear-gradient(90deg, #0077B6, #0096D6) !important;',
'    color: #fff !important;',
'    border-radius: 10px !important;',
'    padding: 10px 20px !important;',
'    font-weight: bold;',
'    border: none !important;',
'}',
'',
'.t-Button:hover {',
'    background: linear-gradient(90deg, #0096D6, #00BFFF) !important;',
'}',
'',
'',
'/************************************',
' BUBBLE STYLE',
'************************************/',
'.bubble {',
'    position: absolute;',
'    width: 180px;',
'    height: 180px;',
'    background: rgba(255, 255, 255, 0.15);',
'    border-radius: 50%;',
'    box-shadow:',
'        0 0 60px rgba(255,255,255,0.5) inset,',
'        0 0 40px rgba(255,255,255,0.3);',
'    animation: moveBubble 20s infinite ease-in-out;',
'}',
'',
'.bubble::before {',
'    content: "";',
'    position: absolute;',
'    width: 70px;',
'    height: 32px;',
'    background: rgba(255,255,255,0.25);',
'    top: 25px;',
'    left: 40px;',
'    border-radius: 50%;',
'    transform: rotate(-22deg);',
'}',
'',
'/************************************',
' FULL-SCREEN ANIMATION',
'************************************/',
'@keyframes moveBubble {',
'    0%   { transform: translate(-60vw, 0) scale(1); opacity: .4; }  /* START far left */',
'    25%  { transform: translate(0vw, -15vh) scale(1.2); opacity: .7; }',
'    50%  { transform: translate(20vw, 20vh) scale(1.1); opacity: .8; }',
'    75%  { transform: translate(40vw, 30vh) scale(1.3); opacity: .9; }',
'    100% { transform: translate(-60vw, 0) scale(1); opacity: .4; }  /* RETURN left */',
'}',
'',
'',
'/************************************',
' RANDOM POSITIONS / DELAYS',
'************************************/',
'.bubble:nth-child(1) { top: 5%; left: 10%; animation-delay: 0s; }',
'.bubble:nth-child(2) { top: 20%; left: 2%; animation-delay: 1s; }',
'.bubble:nth-child(3) { top: 65%; left: 5%; animation-delay: 3s; }',
'.bubble:nth-child(4) { top: 40%; left: 20%; animation-delay: 5s; }',
'.bubble:nth-child(5) { top: 85%; left: 45%; animation-delay: 2s; }',
'.bubble:nth-child(6) { top: 10%; left: 55%; animation-delay: 4s; }',
'.bubble:nth-child(7) { top: 50%; left: 1%; animation-delay: 6s; }',
'.bubble:nth-child(8) { top: 35%; left: 15%; animation-delay: 7s; }',
'.bubble:nth-child(9) { top: 75%; left: 10%; animation-delay: 8s; }',
'.bubble:nth-child(10){ top: 30%; left: 45%; animation-delay: 9s; }',
''))
,p_step_template=>2101157952850466385
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'12'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(114548716972810457212)
,p_plug_name=>'Inventory Management System'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2674157997338192145
,p_plug_display_sequence=>30
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="bubble"></div>',
'<div class="bubble"></div>',
'<div class="bubble"></div>',
'<div class="bubble"></div>',
'<div class="bubble"></div>',
'<div class="bubble"></div>',
'<div class="bubble"></div>',
'<div class="bubble"></div>',
'<div class="bubble"></div>',
'<div class="bubble"></div>'))
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(114548718680283457214)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(114548716972810457212)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'NEXT'
,p_button_alignment=>'LEFT'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(114548717458428457213)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(114548716972810457212)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="username"'
,p_label_alignment=>'RIGHT'
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(114548717895849457214)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(114548716972810457212)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="current-password"'
,p_label_alignment=>'RIGHT'
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(114548718294167457214)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(114548716972810457212)
,p_prompt=>'Remember username'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_display_when=>'apex_authentication.persistent_cookies_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', '',
  'unchecked_value', '',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(114548720867644457216)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Set Username Cookie'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_AUTHENTICATION'
,p_attribute_04=>'SEND_LOGIN_USERNAME_COOKIE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>114548720867644457216
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(114548721365280457216)
,p_page_process_id=>wwv_flow_imp.id(114548720867644457216)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'lower( :P9999_USERNAME )'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(114548721870139457217)
,p_page_process_id=>wwv_flow_imp.id(114548720867644457216)
,p_page_id=>9999
,p_name=>'p_consent'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_REMEMBER'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(114548718989153457215)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Login'
,p_attribute_01=>'PLSQL_PACKAGE'
,p_attribute_03=>'APEX_AUTHENTICATION'
,p_attribute_04=>'LOGIN'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>114548718989153457215
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(114548719423828457215)
,p_page_process_id=>wwv_flow_imp.id(114548718989153457215)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'ITEM'
,p_value=>'P9999_USERNAME'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(114548719947794457216)
,p_page_process_id=>wwv_flow_imp.id(114548718989153457215)
,p_page_id=>9999
,p_name=>'p_password'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_PASSWORD'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(114548720424263457216)
,p_page_process_id=>wwv_flow_imp.id(114548718989153457215)
,p_page_id=>9999
,p_name=>'p_set_persistent_auth'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>3
,p_value_type=>'API_DEFAULT'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(114548722706462457217)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>114548722706462457217
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(114548722354449457217)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>114548722354449457217
);
wwv_flow_imp.component_end;
end;
/
