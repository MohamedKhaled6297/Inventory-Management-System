prompt --application/shared_components/user_interface/lovs/inv_suppliers_supplier_name
begin
--   Manifest
--     INV_SUPPLIERS.SUPPLIER_NAME
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1600544795405981
,p_default_application_id=>106
,p_default_id_offset=>5808209737823576
,p_default_owner=>'HR'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(6424625324650079)
,p_lov_name=>'INV_SUPPLIERS.SUPPLIER_NAME'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'INV_SUPPLIERS'
,p_return_column_name=>'SUPPLIER_ID'
,p_display_column_name=>'SUPPLIER_NAME'
,p_default_sort_column_name=>'SUPPLIER_NAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>5147848
);
wwv_flow_imp.component_end;
end;
/
