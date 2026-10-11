<div align="center">

<img src="docs/images/inventory-logo.png" alt="Inventory Management System Logo" width="125" />

# Inventory Management System
### نظام إدارة المخزون

**An Oracle APEX inventory solution for multi-branch stock control, transactions, reporting, and role-based access.**

**نظام لإدارة المخزون بين الفروع، وتسجيل الحركات، وإعداد التقارير، والتحكم في الصلاحيات.**

![Oracle APEX](https://img.shields.io/badge/Oracle-APEX-C74634?style=for-the-badge&logo=oracle&logoColor=white)
![Oracle Database](https://img.shields.io/badge/Oracle-Database-F80000?style=for-the-badge&logo=oracle&logoColor=white)
![PL/SQL](https://img.shields.io/badge/PL%2FSQL-Business%20Logic-184E77?style=for-the-badge)
![Arabic English](https://img.shields.io/badge/UI-Arabic%20%7C%20English-009FD4?style=for-the-badge)

</div>

---

## Overview

**Inventory Management System** is a bilingual Oracle APEX application for recording incoming and outgoing inventory, transfers between branches, and depreciation. It provides stock monitoring, operational reports, reconciliation, and authorization-based navigation.

## Application Preview

### Dashboard — English

<p align="center"><img src="docs/images/dashboard-en.png" alt="Inventory dashboard in English" width="1050" /></p>

### Dashboard — Arabic / RTL

<p align="center"><img src="docs/images/dashboard-ar.png" alt="Inventory dashboard in Arabic" width="1050" /></p>

### Inventory Reports

<p align="center"><img src="docs/images/inventory-report.png" alt="Inventory reporting screen" width="1050" /></p>

### Depreciation Order

<p align="center"><img src="docs/images/depreciation-order.png" alt="Depreciation order screen" width="1050" /></p>

> Screenshots show example local-development data and may differ from the latest deployed version.

---

## Business Workflow

The workflow below follows inventory quantities from transaction entry through stock validation, adjustment, reporting, and reconciliation.

```mermaid
flowchart TD
    A[Master Data: Products / Branches / Users] --> B{Transaction Type}
    B -->|Receive| C[Order IN: Add to branch]
    B -->|Issue| D[Order OUT: Deduct from branch]
    B -->|Transfer| E[Transfer: Deduct source / Add destination]
    B -->|Depreciate| F[Depreciation: Deduct from branch]
    C --> G[Stock Adjustment Procedure]
    D --> H{Sufficient stock?}
    E --> H
    F --> H
    H -->|No| X[Reject insufficient-stock operation]
    H -->|Yes| G
    G --> I[(INV_STOCK: Branch / Product Balance)]
    I --> J[Current Stock / Movement Reports]
    J --> K[Stock Reconciliation]
    K --> L[Dashboard and Monitoring]
```

**Stock control:** `HR.INV_ADJUST_STOCK` and transaction triggers implement the quantity adjustments. A transfer changes stock in two branches; rejected insufficient-stock operations must not create negative balances. Audit metadata is maintained separately from the stock calculation.

## Main Features

| Module | Capabilities |
|---|---|
| **Dashboard** | Total stock, active products, low-stock and out-of-stock indicators, stock charts |
| **Master Data** | Branches, products, categories, units, suppliers, customers, employees |
| **Order IN** | Record receiving orders and increase branch stock |
| **Order OUT** | Record issues and deduct available quantities |
| **Stock Transfer** | Move quantities between source and destination branches |
| **Depreciation** | Record depreciated quantities and deduct branch stock |
| **Current Stock** | Review stock levels, minimums, and stock status |
| **Stock Movement** | View inventory transactions with filtering |
| **Stock Reconciliation** | Compare current stock with calculated movement totals |
| **Operational Reports** | Order IN, Order OUT, and depreciation reports |
| **Security** | Role-based access and authorization schemes |
| **Localization** | Arabic RTL and English LTR interface |

## Inventory Rules

- **Receiving:** adds quantity to the selected branch.
- **Issuing:** subtracts quantity; insufficient stock is rejected.
- **Transfer:** subtracts from the source branch and adds to the destination branch.
- **Depreciation:** subtracts the depreciated quantity.
- **Reconciliation:** compares stored balances with quantities derived from transaction history. Opening balances and any external/manual stock changes must be accounted for to interpret results correctly.

The database uses centralized stock-adjustment logic through `HR.INV_ADJUST_STOCK` and supporting transaction triggers.

## Roles & Permissions

The application maintains **five roles**. Users can be assigned roles through **Security → Users / Roles / User Roles**. A role is a named responsibility; access is enforced by the authorization schemes configured on pages, components, and actions.

| Role | Main responsibility | Typical permitted activities |
|---|---|---|
| `ADMIN` | Full system administration | Manage users and roles, master data, stock transactions, depreciation, and reports |
| `STORE_USER` | Daily warehouse operations | Record authorized incoming/outgoing orders and stock transfers; view required reference data |
| `MANAGER` | Inventory oversight | View stock and reports; perform depreciation **when** the dedicated authorization is granted |
| `REPORT_USER` | Read-only reporting | View authorized stock reports and dashboards without transaction maintenance |
| `MASTER_DATA_MANAGER` | Reference-data maintenance | Create and edit authorized products, branches, suppliers, categories, units, and other master data |

### Authorization scheme matrix

The following describes the intended scheme-to-role mapping. **Verify the live APEX scheme definitions before treating it as an exact access audit**, especially when roles are combined or a scheme has additional conditions.

| Authorization scheme | ADMIN | STORE_USER | MANAGER | REPORT_USER | MASTER_DATA_MANAGER |
|---|:---:|:---:|:---:|:---:|:---:|
| `IS_ADMIN` | ✓ | — | — | — | — |
| `CAN_MANAGE_STOCK` | ✓ | ✓ | — | — | — |
| `CAN_MANAGE_DEPRECIATION` | ✓ | — | ✓ | — | — |
| `CAN_VIEW_REPORTS` | ✓ | — | ✓ | ✓ | — |
| `CAN_VIEW_STOCK` | ✓ | ✓ | ✓ | ✓ | — |
| `CAN_VIEW_MASTER_DATA` | ✓ | ✓ | ✓ | ✓ | ✓ |
| `CAN_MANAGE_MASTER_DATA` | ✓ | — | — | — | ✓ |
| `CAN_VIEW_TRANSACTIONS_MENU` | ✓ | ✓ | ✓ | — | — |

**Important:** Menu visibility is not a security boundary. Apply authorization to the underlying pages, processes, buttons, and data access as appropriate. The `MANAGER` role's description mentions approvals, but this README does **not** claim an implemented approval workflow without corresponding verified pages and processes.

## Audit Tracking

The database includes audit-oriented fields for recording **who created** and **who last updated** inventory records and **when**. This applies to master data, stock, and transaction master/detail tables when the corresponding columns and triggers are installed.

| Event | Audit metadata | Purpose |
|---|---|---|
| Insert | `*_CR_USER`, `*_CR_DATE` | Capture creator and creation timestamp |
| Update | `*_UP_USER`, `*_UP_DATE` | Capture the last user and timestamp when business fields change |
| Update without business-field change | Existing update metadata retained by the improved audit triggers | Avoid misleading last-modified timestamps |

The project includes audit setup SQL, including `03_AUDIT_TRIGGERS_IMPROVED_V3.sql`, which defines audit triggers for **17 inventory tables** and expects the corresponding audit columns to exist. Its actual deployment and enabled status should be checked in the target database.

**Scope limitation:** These columns provide creation and **last-update metadata**, not a full append-only history of every edit. They do not by themselves record old/new field values, deletion history, or a separate approval trail. A dedicated audit-history table and delete triggers would be needed for those requirements.

### Audit verification (Oracle SQL)

```sql
SELECT trigger_name, table_name, status
FROM user_triggers
WHERE trigger_name LIKE 'TRG_INV_AUD_%'
ORDER BY trigger_name;
```

---

## Reports & Dashboard

The dashboard includes stock KPIs and visualizations. Reports provide filters for branches, products, dates, and applicable transaction types. The stock reconciliation report helps identify mismatches between recorded stock and calculated movements.

## Technology Stack

| Technology | Use |
|---|---|
| Oracle APEX | Application UI and reporting |
| Oracle Database | Persistent data storage |
| SQL / PL/SQL | Queries, validations, triggers, and stock procedures |
| JavaScript / CSS | Bilingual UI enhancements and loading experience |
| Git / GitHub | Version control and documentation |

## Project Structure

```text
Inventory-Management-System/
├── application/            # Oracle APEX split application export
├── readable/               # Human-readable APEX export
├── assets/                 # Static assets (where included)
├── docs/
│   ├── images/
│   │   ├── inventory-logo.png
│   │   ├── dashboard-en.png
│   │   ├── dashboard-ar.png
│   │   ├── inventory-report.png
│   │   └── depreciation-order.png
│   └── User_Guide_AR_EN.docx  # If included in repository
├── install.sql             # APEX installation export
├── .gitignore
└── README.md
```

## Installation

**Prerequisites:** an Oracle Database instance, Oracle APEX, ORDS, an APEX workspace, and a schema with the necessary inventory database objects and privileges.

1. Clone the repository:

   ```bash
   git clone https://github.com/MohamedKhaled6297/Inventory-Management-System.git
   ```
2. Review the database scripts and provision the required tables, procedures, triggers, authorization data, and privileges in the target schema.
3. Import the Oracle APEX application from the exported files (`install.sql` or the application import, as appropriate).
4. Configure the parsing schema, authentication, authorization, static files, and environment-specific settings.
5. Test receiving, issuing, transfers, depreciation, and reconciliation with test data before production use.

> **Deployment note:** An APEX export alone does not necessarily provision the database schema. Verify database scripts and dependencies separately; do not assume a clean install is automated.

## User Guide

The project includes an Arabic/English user guide explaining navigation, inventory workflows, and permissions. Place the guide at `docs/User_Guide_AR_EN.docx` to make it available here:

[Download Bilingual User Guide](docs/User_Guide_AR_EN.docx)

## Security Notes

Before publishing a public repository, remove passwords, real user credentials, connection strings, confidential records, internal endpoints, and environment-specific secrets. Review SQL seed scripts and application exports carefully.

## Roadmap

- Automated deployment and database migration scripts
- Additional validation and integration tests
- Dedicated append-only audit history (old/new values and deletion events)
- Exportable management reports
- Further mobile and accessibility refinements

## Author

**Mohamed Khaled** — Oracle APEX / SQL / PL/SQL

---

<div align="center"><strong>Inventory Management System</strong><br/>Multi-Branch Inventory Control · Arabic & English</div>
