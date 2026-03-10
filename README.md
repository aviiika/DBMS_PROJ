# Hospital Project Management (Starter Code)

This repository now contains a **working full-stack starter** for an advanced DBMS project:

- **Backend**: Java 21 + Spring Boot 3 + Flyway + PostgreSQL
- **Frontend**: React + TypeScript + Vite
- **Database**: PostgreSQL 16
- **Infra**: Docker Compose

## What is implemented

- Spring Boot application bootstrap and health endpoint (`GET /api/health`)
- Initial Project API (`GET /api/projects`, `POST /api/projects`)
- Flyway migration with core tables:
  - departments, users, roles, user_roles, projects, tasks
- Basic React dashboard that reads backend health + project list
- Dockerized local dev stack for db/backend/frontend

## Run with Docker

```bash
cd infra
docker compose up --build
```

Then open:
- Frontend: http://localhost:5173
- Backend health: http://localhost:8080/api/health

## Local backend run

```bash
cd backend
mvn spring-boot:run
```

## Local frontend run

```bash
cd frontend
npm install
npm run dev
```

## Next coding steps

1. Add JWT auth and RBAC entities/services.
2. Add task dependencies, milestones, and allocations.
3. Add budget/procurement/risk modules.
4. Add integration tests with Testcontainers.
5. Add role-based frontend routes and forms.
