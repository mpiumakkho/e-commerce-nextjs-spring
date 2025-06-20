-- Create schemas
CREATE SCHEMA IF NOT EXISTS auth;
CREATE SCHEMA IF NOT EXISTS inventory;

-- Set search path
SET search_path TO auth, inventory, public;

-- Create user_role enum type
DO $$ 
BEGIN 
    IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'user_role') THEN
        CREATE TYPE auth.user_role AS ENUM ('USER', 'ADMIN', 'STAFF', 'MANAGER', 'CUSTOMER_SERVICE');
    END IF;
END $$;

-- If the type already exists and we need to add a new value
DO $$
BEGIN
    ALTER TYPE auth.user_role ADD VALUE IF NOT EXISTS 'CUSTOMER_SERVICE';
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

-- Create users table
CREATE TABLE IF NOT EXISTS auth.users (
    id varchar(36) PRIMARY KEY,
    username varchar(50) NOT NULL UNIQUE,
    email varchar(100) NOT NULL UNIQUE,
    password_hash varchar(255) NOT NULL,
    first_name varchar(50),
    last_name varchar(50),
    phone_number varchar(20),
    address text,
    role user_role NOT NULL,
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamptz,
    created_by varchar(50),
    updated_by varchar(50)
);

-- Create index on commonly searched fields
CREATE INDEX IF NOT EXISTS idx_users_username ON auth.users(username);
CREATE INDEX IF NOT EXISTS idx_users_email ON auth.users(email);
CREATE INDEX IF NOT EXISTS idx_users_role ON auth.users(role);

-- Insert default admin user (password: admin123)
INSERT INTO auth.users (
    id, username, email, password_hash, first_name, last_name, role, created_by
) VALUES (
    'admin-id-001',
    'admin',
    'admin@example.com',
    '$2a$10$ZuGgeoawgOg.6AM6oV6RuOxUy5JGK3h/PSJsQ7pB9Ov9gVyZ.vQi2',
    'System',
    'Administrator',
    'ADMIN',
    'system'
) ON CONFLICT (username) DO NOTHING; 