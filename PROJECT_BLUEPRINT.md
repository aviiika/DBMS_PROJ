# Hospital Project Management System (Advanced DBMS) — Full Implementation Blueprint

## 1) Project Vision and Scope

Build a **full-stack hospital project management platform** where administrators, doctors, nurses, project managers, finance officers, and vendors can plan and execute hospital initiatives (new ward setup, equipment procurement, IT rollouts, accreditation tasks, maintenance projects) with strong data integrity and analytics.

### Core goals
- Multi-role collaboration with strict access control.
- High-quality relational design with normalization + performance tuning.
- Strong auditability for regulated healthcare operations.
- End-to-end workflow: planning → budgeting → resource allocation → execution → monitoring → closure.
- Dashboards and reports for operational and strategic decisions.

---

## 2) Recommended Technology Stack

## Frontend
- **React + TypeScript + Vite**
- UI: **TailwindCSS** + component library (Shadcn UI / MUI)
- Data fetching: React Query
- Forms & validation: React Hook Form + Zod
- Charts: Recharts / ECharts

## Backend (Java)
- **Java 21 + Spring Boot 3**
- Spring modules: Web, Security, Data JPA, Validation, Actuator
- Auth: JWT + refresh tokens
- API docs: springdoc-openapi (Swagger)
- Async jobs: Spring Scheduler + optional queue integration

## Database
- **PostgreSQL 16** (recommended for advanced SQL features)
- Migration tool: **Flyway**
- Caching (optional): Redis

## DevOps & Quality
- Docker + Docker Compose
- Testing: JUnit5, Testcontainers, Mockito, Postman/Newman
- CI/CD: GitHub Actions
- Observability: Prometheus + Grafana + centralized logs

---

## 3) Suggested Project Starting Directory

```text
hospital-project-management/
├── docs/
│   ├── architecture/
│   │   ├── context-diagram.md
│   │   ├── container-diagram.md
│   │   └── sequence-diagrams/
│   ├── db/
│   │   ├── erd.md
│   │   ├── normalization-notes.md
│   │   ├── indexing-strategy.md
│   │   └── sql-views-materialized-views.md
│   ├── api/
│   │   └── openapi-notes.md
│   └── project-plan/
│       ├── wbs.md
│       ├── risk-register.md
│       └── rollout-plan.md
│
├── backend/
│   ├── src/main/java/com/hospital/pm/
│   │   ├── config/
│   │   ├── security/
│   │   ├── auth/
│   │   ├── user/
│   │   ├── project/
│   │   ├── task/
│   │   ├── resource/
│   │   ├── procurement/
│   │   ├── finance/
│   │   ├── risk/
│   │   ├── compliance/
│   │   ├── notification/
│   │   ├── report/
│   │   └── common/
│   ├── src/main/resources/
│   │   ├── db/migration/
│   │   ├── application.yml
│   │   └── application-dev.yml
│   ├── src/test/java/
│   ├── pom.xml
│   └── Dockerfile
│
├── frontend/
│   ├── src/
│   │   ├── app/
│   │   ├── pages/
│   │   ├── modules/
│   │   │   ├── auth/
│   │   │   ├── projects/
│   │   │   ├── tasks/
│   │   │   ├── resources/
│   │   │   ├── procurement/
│   │   │   ├── finance/
│   │   │   ├── risks/
│   │   │   ├── compliance/
│   │   │   └── reports/
│   │   ├── components/
│   │   ├── services/
│   │   ├── hooks/
│   │   ├── utils/
│   │   └── types/
│   ├── public/
│   ├── package.json
│   └── Dockerfile
│
├── infra/
│   ├── docker-compose.yml
│   ├── nginx/
│   ├── monitoring/
│   └── scripts/
│
├── .github/workflows/
│   ├── backend-ci.yml
│   ├── frontend-ci.yml
│   └── security-scan.yml
│
├── .env.example
├── README.md
└── PROJECT_BLUEPRINT.md
```

---

## 4) Advanced DBMS-Centric Data Model (Core Entities)

### Identity & Access
- `users`, `roles`, `permissions`, `user_roles`, `role_permissions`
- `departments`, `staff_profiles`

### Project Management
- `projects` (hospital initiatives)
- `project_phases`
- `milestones`
- `tasks`
- `task_dependencies`
- `task_assignments`
- `task_status_history`

### Resource & Scheduling
- `resources` (staff/equipment/rooms)
- `resource_allocations`
- `availability_slots`
- `shift_plans`

### Procurement & Inventory
- `vendors`
- `purchase_requests`
- `purchase_orders`
- `po_line_items`
- `inventory_items`
- `inventory_movements`

### Finance
- `budgets`
- `budget_line_items`
- `expenses`
- `invoice_payments`
- `cost_centers`

### Risk, Compliance, Quality
- `risks`
- `risk_mitigations`
- `compliance_requirements`
- `compliance_audits`
- `incident_reports`

### Communication & Audit
- `notifications`
- `comments`
- `attachments`
- `activity_logs` (who changed what and when)

### DBMS Features to Showcase
- 3NF schema with selective denormalization for heavy reporting.
- Transaction boundaries and row-level locking where needed.
- Indexing strategy (B-tree, partial, composite indexes).
- Triggers for audit/versioning.
- Materialized views for KPI dashboards.
- Stored procedures/functions for complex financial rollups.
- Partitioning (e.g., logs, activity tables by month).
- Role-based DB access and least-privilege policies.

---

## 5) Step-by-Step Implementation Plan

## Phase 0 — Discovery & Requirements (Week 1)
1. Capture user personas and workflows.
2. Define MVP vs advanced scope.
3. Build feature matrix and acceptance criteria.
4. Produce ER draft and domain glossary.

**Deliverables:** BRD, use-cases, initial ERD, sprint backlog.

## Phase 1 — Database Design & Setup (Week 2)
1. Finalize logical and physical schema.
2. Write Flyway migration scripts (`V1__init.sql`, `V2__indexes.sql`, etc.).
3. Seed reference data (roles, departments, status values).
4. Create baseline SQL views and KPI materialized views.

**Deliverables:** SQL schema, migration pipeline, seed scripts.

## Phase 2 — Backend Foundation (Week 3)
1. Initialize Spring Boot project and environment profiles.
2. Implement auth (JWT), RBAC, and user management.
3. Add global exception handling, DTO mapping, and validation.
4. Set up OpenAPI docs and health endpoints.

**Deliverables:** Auth-ready API skeleton.

## Phase 3 — Core Modules (Weeks 4–6)
1. Projects + milestones + task dependencies.
2. Resource allocation and scheduling conflicts detection.
3. Budgeting + expense tracking + variance calculations.
4. Procurement workflows and inventory integration.
5. Risk and compliance module.

**Deliverables:** Business-complete APIs + integration tests.

## Phase 4 — Frontend Application (Weeks 4–7, parallel)
1. Auth screens + role-based navigation.
2. Dashboard with KPI cards and trend charts.
3. Project workspace (Kanban/Gantt/list views).
4. Resource planning UI + budget/procurement pages.
5. Notifications, comments, and audit timeline.

**Deliverables:** Role-specific functional UI.

## Phase 5 — Analytics, Reports, and Optimization (Week 8)
1. Add reporting APIs and CSV/PDF exports.
2. Tune slow queries (`EXPLAIN ANALYZE`).
3. Add caching and pagination strategy.
4. Build admin reports for SLA, budget overrun, risk heatmaps.

**Deliverables:** Optimized reports and performance baseline.

## Phase 6 — Testing, Security, Deployment (Weeks 9–10)
1. Unit + integration + end-to-end tests.
2. Security checks (OWASP Top 10 controls).
3. Containerized deployment + CI/CD.
4. UAT and production release checklist.

**Deliverables:** Release candidate + deployment docs.

---

## 6) Essential API Modules (Java Backend)

- **AuthController**: login, refresh token, logout, forgot/reset password.
- **ProjectController**: CRUD projects, phase transitions, status rollups.
- **TaskController**: CRUD tasks, dependencies, assignments, SLA flags.
- **ResourceController**: allocate/deallocate resources, availability checks.
- **FinanceController**: budget planning, expense posting, variance reports.
- **ProcurementController**: purchase requests/orders lifecycle.
- **RiskComplianceController**: risks, controls, audits, incidents.
- **ReportController**: KPI endpoints, exports, trend APIs.

Use layered architecture:
- Controller → Service → Repository → DB
- DTOs for API boundaries
- MapStruct/manual mapper for entity conversions

---

## 7) SQL Design Guidance (Advanced DBMS Project Requirements)

1. Keep operational tables normalized (3NF).
2. Use check constraints for domain integrity.
3. Add composite indexes for join-heavy dashboard queries.
4. Implement soft delete only where legally allowed; otherwise immutable audit records.
5. Use transaction isolation strategically (`READ COMMITTED` baseline, elevate when needed).
6. Create materialized views for expensive monthly reporting.
7. Add trigger-based audit tables for critical entities (`projects`, `budgets`, `purchase_orders`).
8. Add backup/restore and archival policy (e.g., monthly cold archive for logs).

---

## 8) Frontend Feature Blueprint

- **Role-based dashboards:** Admin, PM, Doctor Lead, Finance, Procurement.
- **Project board:** List + Kanban + timeline/Gantt.
- **Task workspace:** dependencies, checklists, attachments, comments.
- **Finance panel:** planned vs actual with variance charts.
- **Risk heatmap:** probability × impact matrix.
- **Compliance tracker:** due dates, evidence uploads, audit logs.
- **Notification center:** in-app alerts + optional email integration.

---

## 9) Security and Compliance Checklist

- JWT + short access token TTL + refresh token rotation.
- Password hashing with BCrypt/Argon2.
- Input validation (backend + frontend).
- SQL injection prevention via prepared statements/JPA.
- CORS and rate limiting.
- Row-level authorization checks.
- Encryption in transit (TLS) and at-rest strategy for sensitive data.
- Immutable audit logs for high-risk actions.

---

## 10) Non-Functional Requirements (NFRs)

- Availability target: 99.5%+ for internal users.
- P95 API latency under agreed threshold (e.g., 300 ms for common reads).
- Horizontal scaling readiness (stateless backend).
- Structured logs + trace IDs.
- Disaster recovery runbook and RPO/RTO goals.

---

## 11) Deliverables for an Advanced DBMS Academic Project

1. Requirements document and use-case catalog.
2. ERD, relational schema, normalization proof.
3. SQL scripts for schema/index/trigger/view/procedure.
4. Transaction/concurrency strategy notes.
5. Benchmark report with query plans.
6. Security and compliance design notes.
7. Working demo (frontend + backend + DB in Docker).
8. Final presentation with architecture and performance evidence.

---

## 12) Prompt for Lovable/Bolt (Frontend)

Use this as-is (or with minimal edits):

```text
Build a production-ready React + TypeScript frontend for a “Hospital Project Management System”.

Requirements:
1) Tech stack: React + TypeScript + Vite + TailwindCSS + React Query + React Hook Form + Zod.
2) Create role-based UI flows for: Admin, Project Manager, Doctor Lead, Finance Officer, Procurement Officer.
3) Pages/modules:
   - Auth: login, forgot password
   - Dashboard: KPI cards, trend charts, alerts
   - Projects: list/create/edit, milestones, phases, status timeline
   - Tasks: Kanban + table + task dependencies UI
   - Resources: staff/equipment allocation calendar
   - Finance: budgets, expenses, planned vs actual variance charts
   - Procurement: purchase requests/orders and vendor pages
   - Risks & Compliance: risk heatmap, compliance checklist, audit tasks
   - Reports: filters + export actions
4) Build reusable design system components and responsive layouts.
5) Add API service layer with typed models for a Spring Boot backend.
6) Add route guards and role-based navigation.
7) Include mock data and loading/error/empty states.
8) Ensure accessibility basics (labels, keyboard nav, contrast).

Output expected:
- Complete project folder structure
- All pages/components wired with clean architecture
- Instructions to run locally
```

---

## 13) Prompt for Lovable/Bolt (Java Backend + SQL)

Use this as-is (or with minimal edits):

```text
Build an enterprise-grade Java backend for a “Hospital Project Management System” with PostgreSQL.

Mandatory stack:
- Java 21, Spring Boot 3
- Spring Web, Spring Security, Spring Data JPA, Validation
- JWT auth with refresh tokens
- Flyway migrations
- PostgreSQL
- OpenAPI/Swagger

Functional modules:
1) Authentication & RBAC (users, roles, permissions)
2) Projects, phases, milestones, tasks, task dependencies
3) Resource allocations (staff/equipment/rooms)
4) Finance (budgets, expenses, variance)
5) Procurement (purchase requests/orders/vendors)
6) Risk & compliance (risk register, audits, incidents)
7) Notifications and activity logs
8) Reporting endpoints with filters and summary KPIs

Technical requirements:
- Layered architecture (controller/service/repository)
- DTO validation and global exception handling
- Pagination, sorting, filtering for list endpoints
- Flyway SQL files for schema + indexes + seed data
- Audit fields in all critical entities
- Integration tests for key workflows
- Dockerfile + docker-compose for app + db
- README with setup/run steps

Database expectations:
- Well-normalized schema (3NF)
- Composite indexes for frequent joins
- Trigger/function for audit history on critical tables
- At least one materialized view for dashboard KPIs
```

---

## 14) Other Necessary Tasks (Often Missed)

1. **Data governance:** define ownership of each master table.
2. **Reference data lifecycle:** departments, statuses, categories management.
3. **Migration strategy:** safe schema evolution with rollback plan.
4. **Seed environments:** dev/test/demo datasets.
5. **Access reviews:** periodic RBAC review and dormant user cleanup.
6. **Backup drills:** test restore, not only backup creation.
7. **Performance budget:** define response time and throughput goals early.
8. **Observability playbook:** alerts, dashboards, and on-call runbooks.
9. **UAT scripts:** scenario-based acceptance scripts for each role.
10. **Release management:** versioning, release notes, and changelog discipline.

---

## 15) Practical Next 10 Actions (Start Immediately)

1. Create repository structure from section 3.
2. Design ERD and finalize MVP entities.
3. Write first Flyway migration for core auth + projects.
4. Bootstrap Spring Boot with security and health endpoint.
5. Implement auth + role model.
6. Scaffold frontend app and route shell.
7. Build project/task CRUD end-to-end path.
8. Add budget tracking and dashboard KPI endpoint.
9. Add integration tests and one E2E scenario.
10. Dockerize and run full stack locally.

This gives you an implementable and presentation-ready roadmap for an **advanced DBMS full-stack project**.
