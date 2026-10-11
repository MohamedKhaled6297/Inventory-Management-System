prompt --application/shared_components/security/authentications/inventory_authentication
begin
--   Manifest
--     AUTHENTICATION: Inventory Authentication
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1600544795405981
,p_default_application_id=>106
,p_default_id_offset=>5808209737823576
,p_default_owner=>'HR'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(6575694925343003)
,p_name=>'Inventory Authentication'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_03=>'HR.INV_AUTHENTICATE_USER'
,p_attribute_05=>'N'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>5461528
);
wwv_flow_imp.component_end;
end;
/
