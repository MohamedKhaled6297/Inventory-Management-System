prompt --application/pages/page_groups
begin
--   Manifest
--     PAGE GROUPS: 106
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1600544795405981
,p_default_application_id=>106
,p_default_id_offset=>5808209737823576
,p_default_owner=>'HR'
);
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(114554524594712280786)
,p_group_name=>'Administration'
);
wwv_flow_imp.component_end;
end;
/
