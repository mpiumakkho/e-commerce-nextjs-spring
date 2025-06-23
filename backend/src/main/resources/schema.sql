-- =====================================================
-- E-COMMERCE SCHEMA V2 - DOMAIN-DRIVEN DESIGN
-- =====================================================
-- Domains: identity, catalog, inventory, sales, payments
-- Created: 2024
-- =====================================================

-- Clean up existing schemas for fresh start
DROP SCHEMA IF EXISTS identity CASCADE;
DROP SCHEMA IF EXISTS catalog CASCADE;
DROP SCHEMA IF EXISTS inventory CASCADE;
DROP SCHEMA IF EXISTS sales CASCADE;
DROP SCHEMA IF EXISTS payments CASCADE;
DROP SCHEMA IF EXISTS rbac CASCADE;

-- Create schemas for each domain
CREATE SCHEMA identity;
CREATE SCHEMA catalog;
CREATE SCHEMA inventory;
CREATE SCHEMA sales;
CREATE SCHEMA payments;
CREATE SCHEMA rbac;

-- =====================================================
-- IDENTITY DOMAIN - User Management & Authentication
-- =====================================================

-- User roles enum (Hybrid approach - supports both enum and RBAC)
CREATE TYPE identity.user_role AS ENUM (
    'SUPER_ADMIN',
    'ADMIN',
    'MANAGER',
    'STAFF',
    'CUSTOMER',
    'MARKETING',
    'SUPPORT',
    'QA',
    'LOGISTICS',
    'FINANCE'
);

-- User status enum
CREATE TYPE identity.user_status AS ENUM (
    'ACTIVE',
    'INACTIVE',
    'SUSPENDED',
    'PENDING_VERIFICATION'
);

-- =====================================================
-- RBAC DOMAIN - Role-Based Access Control
-- =====================================================

-- Permissions table
CREATE TABLE rbac.permissions (
    permission_id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    resource VARCHAR(100) NOT NULL, -- 'users', 'products', 'orders', etc.
    action VARCHAR(50) NOT NULL, -- 'create', 'read', 'update', 'delete', etc.
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(50),
    updated_by VARCHAR(50),
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- Roles table
CREATE TABLE rbac.roles (
    role_id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(50),
    updated_by VARCHAR(50),
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- Role-Permission mapping table (many-to-many)
CREATE TABLE rbac.role_permissions (
    role_permission_id VARCHAR(36) PRIMARY KEY,
    role_id VARCHAR(36) NOT NULL REFERENCES rbac.roles(role_id) ON DELETE CASCADE,
    permission_id VARCHAR(36) NOT NULL REFERENCES rbac.permissions(permission_id) ON DELETE CASCADE,
    granted_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    granted_by VARCHAR(50),
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255),
    UNIQUE(role_id, permission_id)
);

-- User-Role mapping table (many-to-many)
CREATE TABLE rbac.user_roles (
    user_role_id VARCHAR(36) PRIMARY KEY,
    user_id VARCHAR(36) NOT NULL REFERENCES identity.users(user_id) ON DELETE CASCADE,
    role_id VARCHAR(36) NOT NULL REFERENCES rbac.roles(role_id) ON DELETE CASCADE,
    assigned_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    assigned_by VARCHAR(50),
    expires_at TIMESTAMP WITH TIME ZONE, -- Optional role expiration
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255),
    UNIQUE(user_id, role_id)
);

-- Users table
CREATE TABLE identity.users (
    user_id VARCHAR(36) PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    role identity.user_role NOT NULL DEFAULT 'CUSTOMER',
    status identity.user_status NOT NULL DEFAULT 'PENDING_VERIFICATION',
    email_verified BOOLEAN DEFAULT FALSE,
    phone_verified BOOLEAN DEFAULT FALSE,
    two_factor_enabled BOOLEAN DEFAULT FALSE,
    two_factor_secret VARCHAR(255),
    last_login TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(50),
    updated_by VARCHAR(50),
    -- Generic attributes for future flexibility
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- User sessions for JWT management
CREATE TABLE identity.user_sessions (
    session_id VARCHAR(36) PRIMARY KEY,
    user_id VARCHAR(36) REFERENCES identity.users(user_id) ON DELETE CASCADE,
    session_token VARCHAR(500) NOT NULL,
    refresh_token VARCHAR(500),
    ip_address INET,
    user_agent TEXT,
    expires_at TIMESTAMP WITH TIME ZONE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- User addresses
CREATE TABLE identity.user_addresses (
    address_id VARCHAR(36) PRIMARY KEY,
    user_id VARCHAR(36) REFERENCES identity.users(user_id) ON DELETE CASCADE,
    address_type VARCHAR(20) NOT NULL, -- 'BILLING', 'SHIPPING'
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100) NOT NULL,
    is_default BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- =====================================================
-- CATALOG DOMAIN - Product Catalog & Categories
-- =====================================================

-- Product categories
CREATE TABLE catalog.categories (
    category_id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    parent_id VARCHAR(36) REFERENCES catalog.categories(category_id),
    slug VARCHAR(100) UNIQUE NOT NULL,
    image_url VARCHAR(500),
    sort_order INTEGER DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(50),
    updated_by VARCHAR(50),
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- Product brands
CREATE TABLE catalog.brands (
    brand_id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    logo_url VARCHAR(500),
    website_url VARCHAR(500),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(50),
    updated_by VARCHAR(50),
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- Products
CREATE TABLE catalog.products (
    product_id VARCHAR(36) PRIMARY KEY,
    sku VARCHAR(100) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    short_description VARCHAR(500),
    category_id VARCHAR(36) REFERENCES catalog.categories(category_id),
    brand_id VARCHAR(36) REFERENCES catalog.brands(brand_id),
    price DECIMAL(10,2) NOT NULL,
    compare_price DECIMAL(10,2),
    cost_price DECIMAL(10,2),
    weight DECIMAL(8,3),
    dimensions VARCHAR(100), -- "LxWxH in cm"
    is_active BOOLEAN DEFAULT TRUE,
    is_featured BOOLEAN DEFAULT FALSE,
    meta_title VARCHAR(255),
    meta_description TEXT,
    slug VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(50),
    updated_by VARCHAR(50),
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- Product images
CREATE TABLE catalog.product_images (
    image_id VARCHAR(36) PRIMARY KEY,
    product_id VARCHAR(36) REFERENCES catalog.products(product_id) ON DELETE CASCADE,
    image_url VARCHAR(500) NOT NULL,
    alt_text VARCHAR(255),
    sort_order INTEGER DEFAULT 0,
    is_primary BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- Product variants (for different sizes, colors, etc.)
CREATE TABLE catalog.product_variants (
    variant_id VARCHAR(36) PRIMARY KEY,
    product_id VARCHAR(36) REFERENCES catalog.products(product_id) ON DELETE CASCADE,
    sku VARCHAR(100) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    price_adjustment DECIMAL(10,2) DEFAULT 0,
    weight_adjustment DECIMAL(8,3) DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- =====================================================
-- INVENTORY DOMAIN - Stock Management & Warehouses
-- =====================================================

-- Warehouses
CREATE TABLE inventory.warehouses (
    warehouse_id VARCHAR(36) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- Stock levels for products and variants
CREATE TABLE inventory.stock_levels (
    stock_id VARCHAR(36) PRIMARY KEY,
    product_id VARCHAR(36) REFERENCES catalog.products(product_id) ON DELETE CASCADE,
    variant_id VARCHAR(36) REFERENCES catalog.product_variants(variant_id) ON DELETE CASCADE,
    warehouse_id VARCHAR(36) REFERENCES inventory.warehouses(warehouse_id),
    quantity INTEGER NOT NULL DEFAULT 0,
    reserved_quantity INTEGER NOT NULL DEFAULT 0,
    low_stock_threshold INTEGER DEFAULT 10,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(50),
    updated_by VARCHAR(50),
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- Stock movements for tracking inventory changes
CREATE TABLE inventory.stock_movements (
    movement_id VARCHAR(36) PRIMARY KEY,
    product_id VARCHAR(36) REFERENCES catalog.products(product_id),
    variant_id VARCHAR(36) REFERENCES catalog.product_variants(variant_id),
    warehouse_id VARCHAR(36) REFERENCES inventory.warehouses(warehouse_id),
    movement_type VARCHAR(50) NOT NULL, -- 'IN', 'OUT', 'ADJUSTMENT', 'TRANSFER'
    quantity INTEGER NOT NULL,
    reference_type VARCHAR(50), -- 'ORDER', 'PURCHASE', 'RETURN', 'ADJUSTMENT'
    reference_id VARCHAR(36),
    notes TEXT,
    created_by VARCHAR(50),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- =====================================================
-- SALES DOMAIN - Orders & Shopping Cart
-- =====================================================

-- Order status enum
CREATE TYPE sales.order_status AS ENUM (
    'PENDING',
    'CONFIRMED',
    'PROCESSING',
    'SHIPPED',
    'DELIVERED',
    'CANCELLED',
    'REFUNDED'
);

-- Orders
CREATE TABLE sales.orders (
    order_id VARCHAR(36) PRIMARY KEY,
    order_number VARCHAR(50) UNIQUE NOT NULL,
    customer_id VARCHAR(36) REFERENCES identity.users(user_id),
    order_status sales.order_status NOT NULL DEFAULT 'PENDING',
    subtotal DECIMAL(12,2) NOT NULL DEFAULT 0,
    tax_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
    shipping_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
    discount_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
    total_amount DECIMAL(12,2) NOT NULL DEFAULT 0,
    currency VARCHAR(3) DEFAULT 'THB',
    shipping_address_id VARCHAR(36) REFERENCES identity.user_addresses(address_id),
    billing_address_id VARCHAR(36) REFERENCES identity.user_addresses(address_id),
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(50),
    updated_by VARCHAR(50),
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- Order items
CREATE TABLE sales.order_items (
    item_id VARCHAR(36) PRIMARY KEY,
    order_id VARCHAR(36) REFERENCES sales.orders(order_id) ON DELETE CASCADE,
    product_id VARCHAR(36) REFERENCES catalog.products(product_id),
    variant_id VARCHAR(36) REFERENCES catalog.product_variants(variant_id),
    sku VARCHAR(100) NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    unit_price DECIMAL(10,2) NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- Shopping cart
CREATE TABLE sales.shopping_cart (
    cart_id VARCHAR(36) PRIMARY KEY,
    customer_id VARCHAR(36) REFERENCES identity.users(user_id) ON DELETE CASCADE,
    product_id VARCHAR(36) REFERENCES catalog.products(product_id) ON DELETE CASCADE,
    variant_id VARCHAR(36) REFERENCES catalog.product_variants(variant_id) ON DELETE CASCADE,
    quantity INTEGER NOT NULL DEFAULT 1,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- =====================================================
-- PAYMENTS DOMAIN - Payment Processing & Refunds
-- =====================================================

-- Payment status enum
CREATE TYPE payments.payment_status AS ENUM (
    'PENDING',
    'PROCESSING',
    'COMPLETED',
    'FAILED',
    'CANCELLED',
    'REFUNDED'
);

-- Payment method enum
CREATE TYPE payments.payment_method AS ENUM (
    'CREDIT_CARD',
    'DEBIT_CARD',
    'BANK_TRANSFER',
    'CASH_ON_DELIVERY',
    'DIGITAL_WALLET',
    'CRYPTO'
);

-- Payments
CREATE TABLE payments.payments (
    payment_id VARCHAR(36) PRIMARY KEY,
    order_id VARCHAR(36) REFERENCES sales.orders(order_id),
    payment_method payments.payment_method NOT NULL,
    payment_status payments.payment_status NOT NULL DEFAULT 'PENDING',
    amount DECIMAL(12,2) NOT NULL,
    currency VARCHAR(3) DEFAULT 'THB',
    transaction_id VARCHAR(255),
    gateway_response JSONB,
    processed_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(50),
    updated_by VARCHAR(50),
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- Payment refunds
CREATE TABLE payments.payment_refunds (
    refund_id VARCHAR(36) PRIMARY KEY,
    payment_id VARCHAR(36) REFERENCES payments.payments(payment_id),
    amount DECIMAL(12,2) NOT NULL,
    reason TEXT,
    refunded_by VARCHAR(50),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    -- Generic attributes
    attribute1 VARCHAR(255),
    attribute2 VARCHAR(255),
    attribute3 VARCHAR(255),
    attribute4 VARCHAR(255),
    attribute5 VARCHAR(255)
);

-- =====================================================
-- INDEXES FOR PERFORMANCE
-- =====================================================

-- Identity domain indexes
CREATE INDEX idx_users_email ON identity.users(email);
CREATE INDEX idx_users_username ON identity.users(username);
CREATE INDEX idx_users_role ON identity.users(role);
CREATE INDEX idx_users_status ON identity.users(status);
CREATE INDEX idx_user_sessions_user_id ON identity.user_sessions(user_id);
CREATE INDEX idx_user_sessions_token ON identity.user_sessions(session_token);
CREATE INDEX idx_user_addresses_user_id ON identity.user_addresses(user_id);

-- Catalog domain indexes
CREATE INDEX idx_products_sku ON catalog.products(sku);
CREATE INDEX idx_products_category_id ON catalog.products(category_id);
CREATE INDEX idx_products_brand_id ON catalog.products(brand_id);
CREATE INDEX idx_products_slug ON catalog.products(slug);
CREATE INDEX idx_products_active ON catalog.products(is_active);
CREATE INDEX idx_categories_parent_id ON catalog.categories(parent_id);
CREATE INDEX idx_categories_slug ON catalog.categories(slug);
CREATE INDEX idx_product_variants_product_id ON catalog.product_variants(product_id);
CREATE INDEX idx_product_variants_sku ON catalog.product_variants(sku);

-- Inventory domain indexes
CREATE INDEX idx_stock_levels_product_id ON inventory.stock_levels(product_id);
CREATE INDEX idx_stock_levels_warehouse_id ON inventory.stock_levels(warehouse_id);
CREATE INDEX idx_stock_movements_product_id ON inventory.stock_movements(product_id);
CREATE INDEX idx_stock_movements_warehouse_id ON inventory.stock_movements(warehouse_id);
CREATE INDEX idx_stock_movements_created_at ON inventory.stock_movements(created_at);

-- Sales domain indexes
CREATE INDEX idx_orders_customer_id ON sales.orders(customer_id);
CREATE INDEX idx_orders_order_number ON sales.orders(order_number);
CREATE INDEX idx_orders_status ON sales.orders(order_status);
CREATE INDEX idx_orders_created_at ON sales.orders(created_at);
CREATE INDEX idx_order_items_order_id ON sales.order_items(order_id);
CREATE INDEX idx_order_items_product_id ON sales.order_items(product_id);
CREATE INDEX idx_shopping_cart_customer_id ON sales.shopping_cart(customer_id);

-- Payments domain indexes
CREATE INDEX idx_payments_order_id ON payments.payments(order_id);
CREATE INDEX idx_payments_status ON payments.payments(payment_status);
CREATE INDEX idx_payments_transaction_id ON payments.payments(transaction_id);
CREATE INDEX idx_payment_refunds_payment_id ON payments.payment_refunds(payment_id);

-- RBAC indexes
CREATE INDEX idx_roles_name ON rbac.roles(name);
CREATE INDEX idx_roles_active ON rbac.roles(is_active);

-- Permissions indexes
CREATE INDEX idx_permissions_name ON rbac.permissions(name);
CREATE INDEX idx_permissions_resource ON rbac.permissions(resource);
CREATE INDEX idx_permissions_action ON rbac.permissions(action);
CREATE INDEX idx_permissions_resource_action ON rbac.permissions(resource, action);
CREATE INDEX idx_permissions_active ON rbac.permissions(is_active);

-- Role-Permission indexes
CREATE INDEX idx_role_permissions_role_id ON rbac.role_permissions(role_id);
CREATE INDEX idx_role_permissions_permission_id ON rbac.role_permissions(permission_id);

-- User-Role indexes
CREATE INDEX idx_user_roles_user_id ON rbac.user_roles(user_id);
CREATE INDEX idx_user_roles_role_id ON rbac.user_roles(role_id);
CREATE INDEX idx_user_roles_expires_at ON rbac.user_roles(expires_at);