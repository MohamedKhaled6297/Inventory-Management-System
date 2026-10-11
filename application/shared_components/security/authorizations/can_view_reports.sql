prompt --application/shared_components/security/authorizations/can_view_reports
begin
--   Manifest
--     SECURITY SCHEME: CAN_VIEW_REPORTS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>68919995520195961853
,p_default_application_id=>139471
,p_default_id_offset=>5808209737823576
,p_default_owner=>'WKSP_TOKIO2'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(776229832525195)
,p_name=>'CAN_VIEW_REPORTS'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'RETURN HR.INV_HAS_ROLE(:APP_USER, ''ADMIN'')',
'    OR HR.INV_HAS_ROLE(:APP_USER, ''MANAGER'')',
'    OR HR.INV_HAS_ROLE(:APP_USER, ''REPORT_USER'');'))
,p_error_message=>'Access Denied. You do not have permission to view reports.'
,p_version_scn=>5501649
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
