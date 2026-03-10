CREATE TABLE departments (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(80) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    email VARCHAR(120) NOT NULL UNIQUE,
    full_name VARCHAR(120) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    department_id BIGINT REFERENCES departments(id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE roles (
    id BIGSERIAL PRIMARY KEY,
    code VARCHAR(30) NOT NULL UNIQUE,
    description VARCHAR(120) NOT NULL
);

CREATE TABLE user_roles (
    user_id BIGINT NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    role_id BIGINT NOT NULL REFERENCES roles(id) ON DELETE CASCADE,
    PRIMARY KEY (user_id, role_id)
);

CREATE TABLE projects (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    status VARCHAR(30) NOT NULL,
    department_id BIGINT NOT NULL REFERENCES departments(id),
    start_date DATE,
    target_end_date DATE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (status IN ('PLANNED', 'ACTIVE', 'ON_HOLD', 'COMPLETED', 'CANCELLED'))
);

CREATE TABLE tasks (
    id BIGSERIAL PRIMARY KEY,
    project_id BIGINT NOT NULL REFERENCES projects(id) ON DELETE CASCADE,
    title VARCHAR(140) NOT NULL,
    status VARCHAR(30) NOT NULL,
    assignee_id BIGINT REFERENCES users(id),
    due_date DATE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    CHECK (status IN ('TODO', 'IN_PROGRESS', 'BLOCKED', 'DONE'))
);

CREATE INDEX idx_projects_department_status ON projects(department_id, status);
CREATE INDEX idx_tasks_project_status ON tasks(project_id, status);

INSERT INTO departments(name) VALUES ('Administration'), ('Emergency'), ('Surgery');
INSERT INTO roles(code, description) VALUES
('ADMIN', 'System administrator'),
('PROJECT_MANAGER', 'Hospital project manager'),
('FINANCE', 'Finance officer');
