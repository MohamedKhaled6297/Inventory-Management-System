prompt --application/shared_components/security/authorizations/can_view_transactions_menu
begin
--   Manifest
--     SECURITY SCHEME: CAN_VIEW_TRANSACTIONS_MENU
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1600544795405981
,p_default_application_id=>106
,p_default_id_offset=>5808209737823576
,p_default_owner=>'HR'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(6926485203891951)
,p_name=>'CAN_VIEW_TRANSACTIONS_MENU'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'RETURN HR.INV_HAS_ROLE(:APP_USER, ''ADMIN'')',
'    OR HR.INV_HAS_ROLE(:APP_USER, ''STORE_USER'')',
'    OR HR.INV_HAS_ROLE(:APP_USER, ''MANAGER'');'))
,p_error_message=>'Access Denied: You do not have permission to access this section. Please contact your system administrator.'
,p_version_scn=>5961111
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
