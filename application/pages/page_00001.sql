prompt --application/pages/page_00001
begin
--   Manifest
--     PAGE: 00001
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
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'Inventory Management System'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(function () {',
'    "use strict";',
'',
'    const DASHBOARD_REGIONS = [',
'        "dashboard_overview",',
'        "stock_by_branch_chart",',
'        "stock_movement_trend",',
'        "recent_stock_movements",',
'        "dashboard_stock_alerts"',
'    ];',
'',
'    const REFRESH_INTERVAL = 60000;',
'',
'    let isRefreshing = false;',
'    let savedScrollY = 0;',
'',
'    function restoreScroll() {',
'        window.scrollTo({',
'            top: savedScrollY,',
'            left: 0,',
'            behavior: "instant"',
'        });',
'    }',
'',
'    function refreshDashboard() {',
'',
'        if (isRefreshing) {',
'            return;',
'        }',
'',
'        isRefreshing = true;',
'',
'        // Save current scroll position',
'        savedScrollY = window.scrollY;',
'',
'        const refreshPromises = [];',
'',
'        DASHBOARD_REGIONS.forEach(function (regionId) {',
'',
'            const region = apex.region(regionId);',
'',
'            if (!region || typeof region.refresh !== "function") {',
'                return;',
'            }',
'',
'            const regionElement = apex.jQuery("#" + regionId);',
'',
'            // Restore scroll after each region refresh',
'            regionElement.one("apexafterrefresh", function () {',
'',
'                // Remove focus from refreshed search controls',
'                const activeElement = document.activeElement;',
'',
'                if (',
'                    activeElement &&',
'                    activeElement.matches &&',
'                    activeElement.matches(',
'                        ".a-IRR-search-field, .a-IRR-search-button, .a-IRR-search-field-button"',
'                    )',
'                ) {',
'                    activeElement.blur();',
'                }',
'',
'                restoreScroll();',
'            });',
'',
'            region.refresh();',
'        });',
'',
'        // Final scroll restoration',
'        setTimeout(function () {',
'            restoreScroll();',
'            isRefreshing = false;',
'        }, 1500);',
'    }',
'',
'    if (window.inventoryDashboardTimer) {',
'        clearInterval(window.inventoryDashboardTimer);',
'    }',
'',
'    window.inventoryDashboardTimer = setInterval(',
'        refreshDashboard,',
'        REFRESH_INTERVAL',
'    );',
'',
'})();'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.dashboard-card {',
'    border-radius: 14px;',
'    overflow: hidden;',
'    transition: transform .2s ease,',
'                box-shadow .2s ease;',
'}',
'',
'.dashboard-card:hover {',
'    transform: translateY(-4px);',
'    box-shadow: 0 10px 25px rgba(0,0,0,.12);',
'}',
'',
'.dashboard-card-STOCK {',
'    border-top: 4px solid #2563eb;',
'}',
'',
'.dashboard-card-PRODUCTS {',
'    border-top: 4px solid #16a34a;',
'}',
'',
'.dashboard-card-LOW {',
'    border-top: 4px solid #ea580c;',
'}',
'',
'.dashboard-card-OUT {',
'    border-top: 4px solid #dc2626;',
'}',
'',
'.dashboard-card-STOCK .a-CardView-body {',
'    color: #2563eb;',
'}',
'',
'.dashboard-card-PRODUCTS .a-CardView-body {',
'    color: #16a34a;',
'}',
'',
'.dashboard-card-LOW .a-CardView-body {',
'    color: #ea580c;',
'}',
'',
'.dashboard-card-OUT .a-CardView-body {',
'    color: #dc2626;',
'}',
'',
'.dashboard-card .a-CardView-body {',
'    font-size: 28px;',
'    font-weight: 700;',
'}',
'',
'',
'/* ******************************  */',
'',
'.movement-badge {',
'    display: inline-block;',
'    padding: 5px 10px;',
'    border-radius: 20px;',
'    font-size: 11px;',
'    font-weight: 700;',
'    white-space: nowrap;',
'}',
'',
'.movement-in {',
'    background: #dcfce7;',
'    color: #166534;',
'}',
'',
'.movement-out {',
'    background: #fee2e2;',
'    color: #991b1b;',
'}',
'',
'.movement-transfer-in {',
'    background: #dbeafe;',
'    color: #1d4ed8;',
'}',
'',
'.movement-transfer-out {',
'    background: #fef3c7;',
'    color: #92400e;',
'}',
'',
'.movement-deprec {',
'    background: #f3e8ff;',
'    color: #7e22ce;',
'}',
'',
'/* ********************  */',
'',
'.stock-alert-badge {',
'    display: inline-block;',
'    padding: 5px 12px;',
'    border-radius: 20px;',
'    font-size: 11px;',
'    font-weight: 700;',
'    white-space: nowrap;',
'}',
'',
'.stock-alert-low {',
'    background: #fff3cd;',
'    color: #9a6700;',
'}',
'',
'.stock-alert-out {',
'    background: #fee2e2;',
'    color: #b91c1c;',
'}',
'',
'#dashboard_stock_alerts .t-Report-report {',
'    width: 100%;',
'}',
'',
'#dashboard_stock_alerts .t-Report-cell {',
'    padding: 12px 14px;',
'}',
'',
'',
'/* ********** Inventory managment System *********** */',
'.inventory-home-brand {',
'    display: flex;',
'    align-items: center;',
'    gap: 20px;',
'    padding: 20px 0;',
'}',
'',
'.inventory-home-logo {',
'    width: 80px;',
'    height: 80px;',
'    object-fit: contain;',
'    flex-shrink: 0;',
'}',
'',
'.inventory-home-title {',
'    margin: 0;',
'    font-size: 34px;',
'    font-weight: 700;',
'    color: #111827;',
'}',
'',
'@media (max-width: 768px) {',
'    .inventory-home-logo {',
'        width: 58px;',
'        height: 58px;',
'    }',
'',
'    .inventory-home-title {',
'        font-size: 23px;',
'    }',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6848673629329223)
,p_plug_name=>'Inventory Overview'
,p_region_name=>'dashboard_overview'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH STOCK_SUMMARY AS',
'(',
'    SELECT',
'        NVL(SUM(S.STOCK_QTY), 0) AS TOTAL_STOCK,',
'        COUNT(DISTINCT S.STOCK_PROD_ID) AS STOCKED_PRODUCTS',
'    FROM HR.INV_STOCK S',
'),',
'PRODUCT_SUMMARY AS',
'(',
'    SELECT',
'        COUNT(*) AS ACTIVE_PRODUCTS',
'    FROM HR.INV_PRODUCT',
'    WHERE PROD_ISACTIVE = ''1''',
'),',
'STOCK_ALERTS AS',
'(',
'    SELECT',
'        COUNT(',
'            CASE',
'                WHEN NVL(S.STOCK_QTY, 0) > 0',
'                 AND NVL(S.STOCK_QTY, 0) < NVL(P.PROD_MIN_STOCK, 0)',
'                THEN 1',
'            END',
'        ) AS LOW_STOCK,',
'',
'        COUNT(',
'            CASE',
'                WHEN NVL(S.STOCK_QTY, 0) = 0',
'                 AND NVL(P.PROD_MIN_STOCK, 0) > 0',
'                THEN 1',
'            END',
'        ) AS OUT_OF_STOCK',
'',
'    FROM HR.INV_BRANCHES B',
'    CROSS JOIN HR.INV_PRODUCT P',
'    LEFT JOIN HR.INV_STOCK S',
'        ON S.STOCK_BRANCH_ID = B.BRANCH_ID',
'       AND S.STOCK_PROD_ID = P.PROD_ID',
'',
'    WHERE P.PROD_ISACTIVE = ''1''',
'      AND B.BRANCH_ISACTIVE = ''1''',
'),',
'SUMMARY AS',
'(',
'    SELECT',
'        S.TOTAL_STOCK,',
'        P.ACTIVE_PRODUCTS,',
'        A.LOW_STOCK,',
'        A.OUT_OF_STOCK',
'    FROM STOCK_SUMMARY S',
'    CROSS JOIN PRODUCT_SUMMARY P',
'    CROSS JOIN STOCK_ALERTS A',
')',
'SELECT',
'    CARD_TITLE,',
'    CARD_VALUE,',
'    CARD_ICON,',
'    CARD_SUBTITLE,',
'    CARD_TYPE',
'FROM',
'(',
'    SELECT',
'        ''Total Stock'' AS CARD_TITLE,',
'        TOTAL_STOCK AS CARD_VALUE,',
'        ''fa-cubes'' AS CARD_ICON,',
'        ''Total available units'' AS CARD_SUBTITLE,',
'        ''STOCK'' AS CARD_TYPE,',
'        1 AS SORT_ORDER',
'    FROM SUMMARY',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''Active Products'',',
'        ACTIVE_PRODUCTS,',
'        ''fa-cube'',',
'        ''Active products in catalog'',',
'        ''PRODUCTS'',',
'        2',
'    FROM SUMMARY',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''Low Stock Items'',',
'        LOW_STOCK,',
'        ''fa-exclamation-triangle'',',
'        ''Products below minimum stock'',',
'        ''LOW'',',
'        3',
'    FROM SUMMARY',
'',
'    UNION ALL',
'',
'    SELECT',
'        ''Out of Stock'',',
'        OUT_OF_STOCK,',
'        ''fa-times-circle'',',
'        ''Products with zero stock'',',
'        ''OUT'',',
'        4',
'    FROM SUMMARY',
')',
'ORDER BY SORT_ORDER'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(6848757393329224)
,p_region_id=>wwv_flow_imp.id(6848673629329223)
,p_layout_type=>'GRID'
,p_grid_column_count=>4
,p_card_css_classes=>'dashboard-card dashboard-card-&CARD_TYPE.'
,p_title_adv_formatting=>false
,p_title_column_name=>'CARD_TITLE'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'CARD_SUBTITLE'
,p_body_adv_formatting=>false
,p_body_column_name=>'CARD_VALUE'
,p_second_body_adv_formatting=>false
,p_icon_source_type=>'STATIC_CLASS'
,p_icon_css_classes=>'fa &CARD_ICON.'
,p_icon_position=>'START'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6848889067329225)
,p_plug_name=>'Stock by Branch'
,p_region_name=>'stock_by_branch_chart'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>6
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6848946380329226)
,p_region_id=>wwv_flow_imp.id(6848889067329225)
,p_chart_type=>'bar'
,p_height=>'350'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6849034082329227)
,p_chart_id=>wwv_flow_imp.id(6848946380329226)
,p_seq=>10
,p_name=>'Stock Quantity'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    B.BRANCH_NAME AS BRANCH,',
'    NVL(SUM(S.STOCK_QTY), 0) AS TOTAL_QTY',
'FROM HR.INV_BRANCHES B',
'LEFT JOIN HR.INV_STOCK S',
'    ON S.STOCK_BRANCH_ID = B.BRANCH_ID',
'GROUP BY',
'    B.BRANCH_ID,',
'    B.BRANCH_NAME',
'ORDER BY',
'    TOTAL_QTY DESC'))
,p_items_value_column_name=>'TOTAL_QTY'
,p_items_label_column_name=>'BRANCH'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6849189769329228)
,p_chart_id=>wwv_flow_imp.id(6848946380329226)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6849236290329229)
,p_chart_id=>wwv_flow_imp.id(6848946380329226)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6849346052329230)
,p_plug_name=>'Stock Movement Trend'
,p_region_name=>'stock_movement_trend'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(6849515566329232)
,p_region_id=>wwv_flow_imp.id(6849346052329230)
,p_chart_type=>'line'
,p_height=>'350'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(6849694687329233)
,p_chart_id=>wwv_flow_imp.id(6849515566329232)
,p_seq=>10
,p_name=>'Stock Movements'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH MOVEMENTS AS',
'(',
'    -- ORDER IN',
'    SELECT',
'        TRUNC(O.ORDER_IN_DATE) AS MOVEMENT_DATE,',
'        D.ORDER_IN_DETAILS_QUANTITY AS QTY,',
'        ''ORDER IN'' AS MOVEMENT_TYPE',
'    FROM HR.INV_ORDER_IN O',
'    JOIN HR.INV_ORDER_IN_DETAILS D',
'      ON D.ORDER_IN_DETAILS_ORDERIN_ID = O.ORDER_IN_ID',
'',
'    UNION ALL',
'',
'    -- ORDER OUT',
'    SELECT',
'        TRUNC(O.ORDER_OUT_DATE),',
'        D.ORDER_OUT_DETAILS_QUANTITY,',
'        ''ORDER OUT''',
'    FROM HR.INV_ORDER_OUT O',
'    JOIN HR.INV_ORDER_OUT_DETAILS D',
'      ON D.ORDER_OUT_DETAILS_ORDEROUT_ID = O.ORDER_OUT_ID',
'',
'    UNION ALL',
'',
'    -- TRANSFERS',
'    SELECT',
'        TRUNC(O.TRAN_ORD_DATE),',
'        D.TRAN_ORD_DETAILS_QUANTITY,',
'        ''TRANSFER''',
'    FROM HR.INV_TRANSFARE_ORDER O',
'    JOIN HR.INV_TRANSFARE_ORDER_DETAILS D',
'      ON D.TRAN_ORD_DETAILS_TRAN_ORD_ID = O.TRAN_ORD_ID',
'',
'    UNION ALL',
'',
'    -- DEPRECIATION',
'    SELECT',
'        TRUNC(O.DEPREC_ORD_DATE),',
'        D.DEPREC_ORD_DETAILS_QUANTITY,',
'        ''DEPRECIATION''',
'    FROM HR.INV_DEPRECIATION_ORDER O',
'    JOIN HR.INV_DEPRECIATION_ORDER_DETAILS D',
'      ON D.DEPREC_ORD_DETAILS_DEPREC_ORD_ID = O.DEPREC_ORD_ID',
')',
'SELECT',
'    MOVEMENT_DATE,',
'',
'    TO_CHAR(',
'        MOVEMENT_DATE,',
'        ''DD Mon YYYY'',',
'        ''NLS_DATE_LANGUAGE=ENGLISH''',
'    ) AS MOVEMENT_LABEL,',
'',
'    MOVEMENT_TYPE,',
'',
'    SUM(QTY) AS TOTAL_QTY',
'',
'FROM MOVEMENTS',
'',
'WHERE MOVEMENT_DATE >= TRUNC(SYSDATE) - 29',
'  AND MOVEMENT_DATE < TRUNC(SYSDATE) + 1',
'',
'GROUP BY',
'    MOVEMENT_DATE,',
'    MOVEMENT_TYPE',
'',
'ORDER BY',
'    MOVEMENT_DATE,',
'    MOVEMENT_TYPE'))
,p_series_name_column_name=>'MOVEMENT_TYPE'
,p_items_value_column_name=>'TOTAL_QTY'
,p_items_label_column_name=>'MOVEMENT_LABEL'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6849740118329234)
,p_chart_id=>wwv_flow_imp.id(6849515566329232)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(6849849795329235)
,p_chart_id=>wwv_flow_imp.id(6849515566329232)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6849473452329231)
,p_plug_name=>'Recent Stock Movements'
,p_region_name=>'recent_stock_movements'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH MOVEMENTS AS',
'(',
'    -- ORDER IN',
'    SELECT',
'        O.ORDER_IN_DATE AS MOVEMENT_DATE,',
'        ''ORDER IN'' AS MOVEMENT_TYPE,',
'        B.BRANCH_NAME,',
'        P.PROD_NAME,',
'        E.EMP_NAME,',
'        D.ORDER_IN_DETAILS_QUANTITY AS QTY,',
'        D.ORDER_IN_DETAILS_QUANTITY AS QTY_CHANGE,',
'        O.ORDER_IN_ID AS REFERENCE_NO',
'',
'    FROM HR.INV_ORDER_IN O',
'    JOIN HR.INV_ORDER_IN_DETAILS D',
'      ON D.ORDER_IN_DETAILS_ORDERIN_ID = O.ORDER_IN_ID',
'    LEFT JOIN HR.INV_BRANCHES B',
'      ON B.BRANCH_ID = O.ORDER_IN_BRANCH_ID',
'    LEFT JOIN HR.INV_PRODUCT P',
'      ON P.PROD_ID = D.ORDER_IN_DETAILS_PROD_ID',
'    LEFT JOIN HR.INV_EMPLOYEES E',
'      ON E.EMP_ID = O.ORDER_IN_EMP_ID',
'',
'    UNION ALL',
'',
'    -- ORDER OUT',
'    SELECT',
'        O.ORDER_OUT_DATE,',
'        ''ORDER OUT'',',
'        B.BRANCH_NAME,',
'        P.PROD_NAME,',
'        E.EMP_NAME,',
'        D.ORDER_OUT_DETAILS_QUANTITY,',
'        -D.ORDER_OUT_DETAILS_QUANTITY,',
'        O.ORDER_OUT_ID',
'',
'    FROM HR.INV_ORDER_OUT O',
'    JOIN HR.INV_ORDER_OUT_DETAILS D',
'      ON D.ORDER_OUT_DETAILS_ORDEROUT_ID = O.ORDER_OUT_ID',
'    LEFT JOIN HR.INV_BRANCHES B',
'      ON B.BRANCH_ID = O.ORDER_OUT_BRANCH_ID',
'    LEFT JOIN HR.INV_PRODUCT P',
'      ON P.PROD_ID = D.ORDER_OUT_DETAILS_PROD_ID',
'    LEFT JOIN HR.INV_EMPLOYEES E',
'      ON E.EMP_ID = O.ORDER_OUT_EMP_ID',
'',
'    UNION ALL',
'',
'    -- TRANSFER OUT',
'    SELECT',
'        O.TRAN_ORD_DATE,',
'        ''TRANSFER OUT'',',
'        B.BRANCH_NAME,',
'        P.PROD_NAME,',
'        E.EMP_NAME,',
'        D.TRAN_ORD_DETAILS_QUANTITY,',
'        -D.TRAN_ORD_DETAILS_QUANTITY,',
'        O.TRAN_ORD_ID',
'',
'    FROM HR.INV_TRANSFARE_ORDER O',
'    JOIN HR.INV_TRANSFARE_ORDER_DETAILS D',
'      ON D.TRAN_ORD_DETAILS_TRAN_ORD_ID = O.TRAN_ORD_ID',
'    LEFT JOIN HR.INV_BRANCHES B',
'      ON B.BRANCH_ID = O.TRAN_ORD_FROM_BRANCH_ID',
'    LEFT JOIN HR.INV_PRODUCT P',
'      ON P.PROD_ID = D.TRAN_ORD_DETAILS_PROD_ID',
'    LEFT JOIN HR.INV_EMPLOYEES E',
'      ON E.EMP_ID = O.TRAN_ORD_EMP_ID',
'',
'    UNION ALL',
'',
'    -- TRANSFER IN',
'    SELECT',
'        O.TRAN_ORD_DATE,',
'        ''TRANSFER IN'',',
'        B.BRANCH_NAME,',
'        P.PROD_NAME,',
'        E.EMP_NAME,',
'        D.TRAN_ORD_DETAILS_QUANTITY,',
'        D.TRAN_ORD_DETAILS_QUANTITY,',
'        O.TRAN_ORD_ID',
'',
'    FROM HR.INV_TRANSFARE_ORDER O',
'    JOIN HR.INV_TRANSFARE_ORDER_DETAILS D',
'      ON D.TRAN_ORD_DETAILS_TRAN_ORD_ID = O.TRAN_ORD_ID',
'    LEFT JOIN HR.INV_BRANCHES B',
'      ON B.BRANCH_ID = O.TRAN_ORD_TO_BRANCH_ID',
'    LEFT JOIN HR.INV_PRODUCT P',
'      ON P.PROD_ID = D.TRAN_ORD_DETAILS_PROD_ID',
'    LEFT JOIN HR.INV_EMPLOYEES E',
'      ON E.EMP_ID = O.TRAN_ORD_EMP_ID',
'',
'    UNION ALL',
'',
'    -- DEPRECIATION',
'    SELECT',
'        O.DEPREC_ORD_DATE,',
'        ''DEPRECIATION'',',
'        B.BRANCH_NAME,',
'        P.PROD_NAME,',
'        E.EMP_NAME,',
'        D.DEPREC_ORD_DETAILS_QUANTITY,',
'        -D.DEPREC_ORD_DETAILS_QUANTITY,',
'        O.DEPREC_ORD_ID',
'',
'    FROM HR.INV_DEPRECIATION_ORDER O',
'    JOIN HR.INV_DEPRECIATION_ORDER_DETAILS D',
'      ON D.DEPREC_ORD_DETAILS_DEPREC_ORD_ID = O.DEPREC_ORD_ID',
'    LEFT JOIN HR.INV_BRANCHES B',
'      ON B.BRANCH_ID = O.DEPREC_ORD_BRANCH_ID',
'    LEFT JOIN HR.INV_PRODUCT P',
'      ON P.PROD_ID = D.DEPREC_ORD_DETAILS_PROD_ID',
'    LEFT JOIN HR.INV_EMPLOYEES E',
'      ON E.EMP_ID = O.DEPREC_ORD_EMP_ID',
')',
'SELECT',
'    MOVEMENT_DATE,',
'    -- MOVEMENT_TYPE,',
'    CASE MOVEMENT_TYPE',
'        WHEN ''ORDER IN'' THEN',
'            ''<span class="movement-badge movement-in">ORDER IN</span>''',
'        WHEN ''ORDER OUT'' THEN',
'            ''<span class="movement-badge movement-out">ORDER OUT</span>''',
'        WHEN ''TRANSFER IN'' THEN',
'            ''<span class="movement-badge movement-transfer-in">TRANSFER IN</span>''',
'        WHEN ''TRANSFER OUT'' THEN',
'            ''<span class="movement-badge movement-transfer-out">TRANSFER OUT</span>''',
'        WHEN ''DEPRECIATION'' THEN',
'            ''<span class="movement-badge movement-deprec">DEPRECIATION</span>''',
'    END AS MOVEMENT_TYPE,',
'    REFERENCE_NO,',
'    BRANCH_NAME,',
'    PROD_NAME,',
'    EMP_NAME,',
'    QTY,',
'    QTY_CHANGE',
'FROM MOVEMENTS',
'ORDER BY MOVEMENT_DATE DESC, REFERENCE_NO DESC',
'FETCH FIRST 10 ROWS ONLY'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_required_role=>wwv_flow_imp.id(6584439570348771)
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6850782209329244)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'ADMIN'
,p_internal_uid=>6850782209329244
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6850823555329245)
,p_db_column_name=>'MOVEMENT_DATE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Movement Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6850927583329246)
,p_db_column_name=>'MOVEMENT_TYPE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Movement Type'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6851074984329247)
,p_db_column_name=>'REFERENCE_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Reference'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6851166095329248)
,p_db_column_name=>'BRANCH_NAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Branch'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6851207927329249)
,p_db_column_name=>'PROD_NAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Product'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6851384613329250)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6883629792827901)
,p_db_column_name=>'QTY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6883727429827902)
,p_db_column_name=>'QTY_CHANGE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Stock Impact'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6894495740828584)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'68945'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MOVEMENT_DATE:MOVEMENT_TYPE:REFERENCE_NO:BRANCH_NAME:PROD_NAME:EMP_NAME:QTY:QTY_CHANGE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6883809897827903)
,p_plug_name=>'Stock Alerts'
,p_title=>'Stock Alerts'
,p_region_name=>'dashboard_stock_alerts'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>50
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    B.BRANCH_NAME,',
'    P.PROD_NAME,',
'    NVL(S.STOCK_QTY, 0) AS CURRENT_STOCK,',
'    NVL(P.PROD_MIN_STOCK, 0) AS MIN_STOCK,',
'    GREATEST(',
'        NVL(P.PROD_MIN_STOCK, 0) - NVL(S.STOCK_QTY, 0),',
'        0',
'    ) AS SHORTAGE_QTY,',
'    CASE',
'        WHEN NVL(S.STOCK_QTY, 0) = 0 THEN',
'            ''<span class="stock-alert-badge stock-alert-out">OUT OF STOCK</span>''',
'        ELSE',
'            ''<span class="stock-alert-badge stock-alert-low">LOW STOCK</span>''',
'    END AS STOCK_STATUS',
'FROM HR.INV_BRANCHES B',
'CROSS JOIN HR.INV_PRODUCT P',
'LEFT JOIN HR.INV_STOCK S',
'    ON S.STOCK_BRANCH_ID = B.BRANCH_ID',
'   AND S.STOCK_PROD_ID = P.PROD_ID',
'WHERE P.PROD_ISACTIVE = ''1''',
'  AND B.BRANCH_ISACTIVE = ''1''',
'  AND NVL(S.STOCK_QTY, 0) < NVL(P.PROD_MIN_STOCK, 0)',
'ORDER BY',
'    CASE WHEN NVL(S.STOCK_QTY, 0) = 0 THEN 0 ELSE 1 END,',
'    SHORTAGE_QTY DESC,',
'    B.BRANCH_NAME,',
'    P.PROD_NAME'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_required_role=>wwv_flow_imp.id(6584605025355975)
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Stock Alerts'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(6883976934827904)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'ADMIN'
,p_internal_uid=>6883976934827904
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6884038118827905)
,p_db_column_name=>'BRANCH_NAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Branch'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6884128624827906)
,p_db_column_name=>'PROD_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Product'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6884223017827907)
,p_db_column_name=>'CURRENT_STOCK'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Current Stock'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6884345700827908)
,p_db_column_name=>'MIN_STOCK'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Minimum Stock'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6884405327827909)
,p_db_column_name=>'SHORTAGE_QTY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Shortage Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(6884533485827910)
,p_db_column_name=>'STOCK_STATUS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Stock Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(6900192764908993)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69002'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'BRANCH_NAME:PROD_NAME:CURRENT_STOCK:MIN_STOCK:SHORTAGE_QTY:STOCK_STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(114554532185038280796)
,p_plug_name=>'Inventory Management System'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="inventory-home-brand">',
'    <img',
'        src="#APP_FILES#Inventory.png"',
'        alt="Inventory Management System"',
'        class="inventory-home-logo"',
'    >',
'',
'    <h1 class="inventory-home-title">',
'        Inventory Management System',
'    </h1>',
'</div>'))
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6884631835827911)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6883809897827903)
,p_button_name=>'VIEW_CURRENT_STOCK'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'View Current Stock'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-external-link'
);
wwv_flow_imp.component_end;
end;
/
