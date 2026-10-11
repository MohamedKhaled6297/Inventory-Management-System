prompt --application/shared_components/security/authorizations/can_view_stock
begin
--   Manifest
--     SECURITY SCHEME: CAN_VIEW_STOCK
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
 p_id=>wwv_flow_imp.id(6584605025355975)
,p_name=>'CAN_VIEW_STOCK'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'RETURN HR.INV_HAS_ROLE(:APP_USER, ''ADMIN'')',
'    OR HR.INV_HAS_ROLE(:APP_USER, ''STORE_USER'')',
'    OR HR.INV_HAS_ROLE(:APP_USER, ''MANAGER'')',
'    OR HR.INV_HAS_ROLE(:APP_USER, ''REPORT_USER'');'))
,p_error_message=>'Access Denied. You do not have permission to view stock information.'
,p_version_scn=>5501753
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
