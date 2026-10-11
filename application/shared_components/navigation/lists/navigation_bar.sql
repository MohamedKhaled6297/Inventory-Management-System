prompt --application/shared_components/navigation/lists/navigation_bar
begin
--   Manifest
--     LIST: Navigation Bar
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>1600544795405981
,p_default_application_id=>106
,p_default_id_offset=>5808209737823576
,p_default_owner=>'HR'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(114554520569292280776)
,p_name=>'Navigation Bar'
,p_list_status=>'PUBLIC'
,p_version_scn=>5997720
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(114554532740962280797)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(114554533235357280798)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(114554532740962280797)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(114554533626077280799)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(114554532740962280797)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(122763108744857743508)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Master Data'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-folder'
,p_list_item_current_type=>'TARGET_PAGE'
,p_sub_list_id=>wwv_flow_imp.id(114554519366664280772)
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7186973030366529)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'&APP_TEXT$LANGUAGE_LABEL.'
,p_list_item_link_target=>'f?p=&APP_ID.:#:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-globe'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7187297748375640)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>unistr('\0627\0644\0639\0631\0628\064A\0629')
,p_list_item_link_target=>'javascript:apex.navigation.redirect(''f?p=&APP_ID.:&APP_PAGE_ID.:&APP_SESSION.::NO::&P_LANG=ar'');'
,p_list_item_icon=>'fa-language'
,p_parent_list_item_id=>wwv_flow_imp.id(7186973030366529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7187573083379400)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'English'
,p_list_item_link_target=>'javascript:apex.navigation.redirect(''f?p=&APP_ID.:&APP_PAGE_ID.:&APP_SESSION.::NO::&P_LANG=en'');'
,p_list_item_icon=>'fa-language'
,p_parent_list_item_id=>wwv_flow_imp.id(7186973030366529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
