# AD Deen Engineering — ERP System

A single-page Enterprise Resource Planning system for **AD Deen Engineering Sdn Bhd**, a Malaysian boiler & pressure vessel specialist. Manages the complete business workflow from quotation through fabrication/repair to invoicing and documentation.

## Tech Stack

| Layer | Technology |
|---|---|
| Frontend | HTML5, CSS3 (custom properties, dark/light themes), Vanilla JavaScript |
| Backend | Python 3 — built-in `http.server` (no external frameworks) |
| Database | Flat-file JSON (`erp_data.json`) with auto-save every 5 min |
| Fonts | Google Fonts — Inter |
| Remote Access | Cloudflare Tunnel (`cloudflared`) |

**Zero external Python dependencies.** No `requirements.txt`, no `package.json`.

## Workflow

```
📄 Quotation ⇄ 🧾 P.O. (Client) → 🛒 New Sales Order → 💰 Account + 📐 Design Dept → 📋 Work Order
→ 🔬 Quality (QMW) / 📦 Purchasing (PW) / 🏭 Fabrication or 🔧 Repair
→ ✅ Quality Management → 💳 Sale & Billing → 💰 Account → 🗄️ Data & Documentation Center
```

## Main Sections

### Core Operations
| Section | Description |
|---|---|
| **Dashboard** | Real-time ops overview, kanban board, ERP workflow visualization |
| **Job / Work Orders** | Full WO lifecycle, status filters, search |
| **Fabrication / MRP** | BOM management, work centers, shop floor control |
| **Maintenance & Repair** | Service calls, repair jobs, maintenance scheduling |
| **Quality Management** | QA/QC tracking, NDT management, inspection pass rates |
| **Design & Engineering** | Design review, ASME calculations, DOSH/JKKP compliance |

### Asset & Inventory
| Section | Description |
|---|---|
| **Maintenance / Assets** | Asset register, preventive maintenance |
| **Inventory & Materials** | Stock status, material specs (SA-516, SA106, A105, etc.) |

### Commercial
| Section | Description |
|---|---|
| **Customer Management** | Customer database, contact management |
| **Purchasing / Suppliers** | Purchase requisitions & orders, supplier management |
| **Sales & Billing** | Quotations (create, send via email), sales orders, invoicing, PV Calculator, Tonnes Calculator, Weld Cost Calculator |
| **Accounting** | Financial tracking, payments, revenue reporting |

### Reports & Admin
| Section | Description |
|---|---|
| **Reports & BI** | Analytics and business intelligence |
| **Document Management** | Document repository, file storage, document control |
| **AI Assistant** | Built-in Claude AI chat assistant |

## Key Tools

- **PV Calculator** — ASME VIII Div 1 pressure vessel calculations (shell/head thickness, weight, cost, hydrotest) with local JS fallback
- **Tonnes Calculator** — Weight calculator for plate, pipe, angle, flat bar, round bar, electrode, dish end, flange
- **Weld Cost Calculator** — Welding cost estimation
- **PDF Print** — Sales order PDF with complete sections (customer, product, PE/Repair/NP materials, schedule, cost breakdown, attachments)

## Getting Started

### Prerequisites

- Python 3 (https://www.python.org/downloads/)

### Run

```
python server.py
```

Open http://127.0.0.1:8080

Or double-click `start_all.bat` (verifies Python, starts server, opens browser).

### Default Login

| Username | Password | Role |
|---|---|---|
| `admin` | `admin123` | Administrator |
| `user` | `user123` | Viewer |

## Server

| Setting | Value |
|---|---|
| Port | `8080` |
| Host | `0.0.0.0` (all interfaces) |
| Data file | `erp_data.json` |
| Auto-save | Every 5 minutes |

### API Endpoints

| Endpoint | Method | Description |
|---|---|---|
| `/api/data` | GET | Return all data stores |
| `/api/health` | GET | Server status, port, timestamp |
| `/api/users` | GET | Usernames and count |
| `/api/save` | POST | Persist JSON payload |

CORS enabled (`Access-Control-Allow-Origin: *`).

## Batch Files

| File | Purpose |
|---|---|
| `start_all.bat` | Main launcher |
| `Window 1 - ERP Server.bat` | Start server only |
| `Window 2 - Cloudflare Tunnel.bat` | Remote access via Cloudflare |
| `backup.bat` | Back up `erp_data.json` to `C:\ADDeen_ERP_Backups\` |

## Structure

```
├── ADDeen_ERP.html          Main application (6,000+ lines)
├── app.js                   All client-side logic (9,500+ lines)
├── server.py                Python HTTP server
├── styles.css               Theming and layout
├── erp_data.json            Flat-file database
├── logo.png                 Brand logo
├── favicon.ico              Browser icon
├── Start_ERP.bat            Quick start
├── start_all.bat            Launcher
├── erp_menu.bat             Control panel
├── backup.bat               Data backup
└── qr_generator.html        QR code for ERP URL
```
