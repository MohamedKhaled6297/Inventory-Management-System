
(function () {
    "use strict";

    const dict = {
        "Add Row": "إضافة صف",
        "Edit": "تعديل",
        "Actions": "الإجراءات",
        "Go": "بحث",
        "Reset": "إعادة تعيين",
        "Search": "بحث",
        "Search: All Text Columns": "بحث في جميع الأعمدة النصية",
        "All Text Columns": "جميع الأعمدة النصية",
        "Rows": "صفوف",
        "Row": "صف",
        "No data found": "لا توجد بيانات",
        "No data to display": "لا توجد بيانات للعرض",
        "No records found": "لا توجد سجلات",
        "1 rows selected": "تم تحديد صف واحد",
        "1 row selected": "تم تحديد صف واحد",
        "rows selected 1": "تم تحديد صف واحد",

        "Total Stock": "إجمالي المخزون",
        "Total available units": "إجمالي الوحدات المتاحة",
        "Active Products": "المنتجات النشطة",
        "Active products in catalog": "المنتجات النشطة في الدليل",
        "Low Stock Items": "منتجات منخفضة المخزون",
        "Products below minimum stock": "منتجات أقل من الحد الأدنى",
        "Out of Stock": "نفاد المخزون",
        "Products with zero stock": "منتجات رصيدها صفر",

        "Total Orders": "إجمالي الأذون",
        "Received Qty": "الكمية المستلمة",
        "Total Value": "إجمالي القيمة",
        "Order Lines": "بنود الأذون",
        "Number of receiving orders": "عدد أذون الإضافة",
        "Total received units": "إجمالي الوحدات المستلمة",
        "Total receiving value": "إجمالي قيمة الإضافات",
        "Number of product lines": "عدد بنود المنتجات",

        "Total Products": "إجمالي المنتجات",
        "Low Stock": "مخزون منخفض",
        "Stock Quantity": "كمية المخزون",
        "Matched Records": "السجلات المتطابقة",
        "Mismatched Records": "السجلات غير المتطابقة",
        "Total Difference": "إجمالي الفروق",

        "Order IN": "إذن إضافة",
        "Order OUT": "إذن صرف",
        "Transfers": "التحويلات",
        "Depreciation": "الإهلاك",
        "Total Quantity": "إجمالي الكمية",

        "Branch": "الفرع",
        "Employee": "الموظف",
        "Product": "المنتج",
        "Quantity": "الكمية",
        "Unit Price": "سعر الوحدة",
        "Notes": "ملاحظات",
        "Order Date": "تاريخ الإذن",
        "Order No": "رقم الإذن",

        "Affected Branches": "الفروع المتأثرة",
        "Affected Products": "المنتجات المتأثرة",
        "Depreciated Qty": "الكمية المُهلكة",
        "Issued Quantity": "الكمية المصروفة",
        "Total Stock Qty": "إجمالي كمية المخزون",

        "Branches with depreciation": "الفروع التي تم بها إهلاك",
        "Distinct affected products": "عدد المنتجات المتأثرة",
        "Total depreciated units": "إجمالي الوحدات المُهلكة",
        "Number of depreciation orders": "عدد أذون الإهلاك",

        "Total issued units": "إجمالي الوحدات المصروفة",
        "Total outgoing value": "إجمالي قيمة الصرف",
        "Number of outgoing orders": "عدد أذون الصرف",

        "Actual quantity in selected stock": "الكمية الفعلية بالمخزون المحدد",
        "Balances matching transactions": "الأرصدة المطابقة للحركات",
        "Balances requiring investigation": "الأرصدة التي تحتاج إلى مراجعة",
        "Total absolute quantity difference": "إجمالي فروق الكميات",

        "Total received quantity": "إجمالي الكمية المستلمة",
        "Total issued quantity": "إجمالي الكمية المصروفة",
        "Total transferred out quantity": "إجمالي الكمية المحولة للخارج",
        "Total depreciated quantity": "إجمالي الكمية المُهلكة",

        "Products currently in stock": "المنتجات الموجودة بالمخزون",
        "Total quantity across selected stock": "إجمالي الكمية بالمخزون المحدد",
        "Products at or below minimum level": "المنتجات عند الحد الأدنى أو أقل",
        "Products with zero quantity": "المنتجات التي نفدت كميتها"
    };

    const targets = [
        ".a-Toolbar",
        ".a-IRR",
        ".a-IG",
        ".a-CardView",
        ".t-Card",
        ".t-Cards",
        ".t-Region-header",
        ".a-JETChart-title"
    ].join(",");

    function isArabic() {
        let lang = document.documentElement.lang || "";

        try {
            if (
                window.apex &&
                apex.locale &&
                typeof apex.locale.getLanguage === "function"
            ) {
                lang = apex.locale.getLanguage() || lang;
            }
        } catch (e) {
            // Fall back to HTML language.
        }

        return /^ar(?:-|$)/i.test(lang);
    }

    function translateText(root) {
        if (!root) return;

        const walker = document.createTreeWalker(
            root,
            NodeFilter.SHOW_TEXT
        );

        const nodes = [];

        while (walker.nextNode()) {
            nodes.push(walker.currentNode);
        }

        nodes.forEach(function (node) {
            const parent = node.parentElement;

            if (
                !parent ||
                parent.closest(
                    "script,style,textarea,input,option,[contenteditable='true']"
                )
            ) {
                return;
            }

            const raw = node.nodeValue;
            const key = raw.trim();

            if (
                Object.prototype.hasOwnProperty.call(dict, key)
            ) {
                node.nodeValue = raw.replace(
                    key,
                    dict[key]
                );
            }
        });

        root.querySelectorAll(
            "[title],[aria-label],[placeholder]"
        ).forEach(function (el) {

            ["title", "aria-label", "placeholder"].forEach(
                function (attr) {

                    const value = el.getAttribute(attr);

                    if (
                        value &&
                        Object.prototype.hasOwnProperty.call(
                            dict,
                            value.trim()
                        )
                    ) {
                        el.setAttribute(
                            attr,
                            dict[value.trim()]
                        );
                    }
                }
            );
        });
    }

    let translating = false;

    function translateInventoryGridToolbar() {
        if (!isArabic() || translating) return;

        translating = true;

        try {
            document.querySelectorAll(targets)
                .forEach(translateText);

            document.documentElement.classList.add(
                "inv-translations-ready"
            );

        } finally {
            translating = false;
        }
    }

    window.translateInventoryGridToolbar =
        translateInventoryGridToolbar;

    function showInventoryLoader() {

        if (
            document.getElementById(
                "inventory-loading-overlay"
            )
        ) {
            return;
        }

        const ar = isArabic();

        const labels = ar
            ? {
                title: "نظام إدارة المخازن",
                loading: "جاري تجهيز الصفحة...",
                subtitle: "يرجى الانتظار لحظات"
            }
            : {
                title: "Inventory Management System",
                loading: "Preparing your page...",
                subtitle: "Please wait a moment"
            };

        const overlay = document.createElement("div");

        overlay.id = "inventory-loading-overlay";

        overlay.setAttribute(
            "dir",
            ar ? "rtl" : "ltr"
        );

        overlay.setAttribute("role", "status");
        overlay.setAttribute("aria-live", "polite");

        overlay.innerHTML = `
            <div class="inv-loader-card">

                <div class="inv-loader-icon">
                    <span class="fa fa-cubes"
                          aria-hidden="true"></span>
                </div>

                <div class="inv-loader-title">
                    ${labels.title}
                </div>

                <div class="inv-loader-spinner"
                     aria-hidden="true"></div>

                <div class="inv-loader-text">
                    ${labels.loading}
                </div>

                <div class="inv-loader-subtext">
                    ${labels.subtitle}
                </div>

                <div class="inv-loader-progress">
                    <div class="inv-loader-progress-bar"></div>
                </div>

            </div>
        `;

        document.body.appendChild(overlay);

        // Display loader for 2 seconds.
        setTimeout(function () {

            // Translate before showing the page.
            translateInventoryGridToolbar();

            overlay.classList.add(
                "inv-loader-hide"
            );

            setTimeout(function () {
                overlay.remove();
            }, 350);

        }, 500);
    }

    function init() {

        // Translate only when the APEX language is Arabic.
        if (isArabic()) {

            translateInventoryGridToolbar();

            let queued = false;

            const observer = new MutationObserver(
                function (mutations) {

                    const relevant = mutations.some(
                        function (m) {

                            return (
                                m.addedNodes.length > 0 ||
                                (
                                    m.type === "characterData" &&
                                    Object.prototype.hasOwnProperty.call(
                                        dict,
                                        (m.target.nodeValue || "").trim()
                                    )
                                )
                            );
                        }
                    );

                    if (!relevant || queued) return;

                    queued = true;

                    queueMicrotask(function () {
                        queued = false;
                        translateInventoryGridToolbar();
                    });
                }
            );

            observer.observe(document.body, {
                childList: true,
                subtree: true,
                characterData: true
            });

            document.addEventListener(
                "apexafterrefresh",
                translateInventoryGridToolbar
            );
        }

        showInventoryLoader();
    }

    if (document.readyState === "loading") {

        document.addEventListener(
            "DOMContentLoaded",
            init,
            { once: true }
        );

    } else {
        init();
    }

})();
