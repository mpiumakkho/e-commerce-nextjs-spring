-- =====================================================
-- SEED DATA FOR E-COMMERCE SCHEMA (DOMAIN-DRIVEN, V2)
-- =====================================================

-- =====================
-- IDENTITY DOMAIN
-- =====================

-- Users (UUID v4 สุ่มใหม่)
INSERT INTO identity.users (user_id, username, email, password_hash, first_name, last_name, phone, role, status, email_verified, phone_verified, two_factor_enabled, two_factor_secret, last_login, created_at, updated_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('9c928021-01c7-4423-b3ab-c504fecf0b65', 'admin', 'admin@smartstore.com', '$2a$10$G1A.oV5c2b29r9kWeCKde.X4DRzR8pY72bJqjZpGg5Iahz75bVzS2', 'อารี', 'แอดมิน', '0812345678', 'ADMIN', 'ACTIVE', TRUE, TRUE, TRUE, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('dcb78487-4085-4cb7-85d6-7df4ec52bccd', 'staff', 'staff@smartstore.com', '$2a$10$G1A.oV5c2b29r9kWeCKde.X4DRzR8pY72bJqjZpGg5Iahz75bVzS2', 'วีระ', 'พนักงาน', '0887654321', 'STAFF', 'ACTIVE', TRUE, FALSE, FALSE, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('a25fa278-5eaa-4dbe-a37f-ebdfcd6bfa3b', 'somsak', 'somsak.t@email.com', '$2a$10$G1A.oV5c2b29r9kWeCKde.X4DRzR8pY72bJqjZpGg5Iahz75bVzS2', 'สมศักดิ์', 'ทองดี', '0911223344', 'CUSTOMER', 'ACTIVE', TRUE, FALSE, FALSE, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('dfd734ce-e83e-4673-93d5-5bba0fc79d5c', 'supaporn', 'supaporn.m@email.com', '$2a$10$G1A.oV5c2b29r9kWeCKde.X4DRzR8pY72bJqjZpGg5Iahz75bVzS2', 'สุภาพร', 'มณีวรรณ', '0955667788', 'CUSTOMER', 'ACTIVE', TRUE, TRUE, TRUE, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('3d3f4773-caf6-4613-8041-87926d9d737a', 'somchai', 'somchai.j@email.com', '$2a$10$G1A.oV5c2b29r9kWeCKde.X4DRzR8pY72bJqjZpGg5Iahz75bVzS2', 'สมชาย', 'ใจดี', '0812341234', 'CUSTOMER', 'ACTIVE', TRUE, FALSE, FALSE, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('7e2e2b2a-2e2e-4e2e-8e2e-2e2e2e2e2e2e', 'manee', 'manee.r@email.com', '$2a$10$G1A.oV5c2b29r9kWeCKde.X4DRzR8pY72bJqjZpGg5Iahz75bVzS2', 'มานี', 'รักเรียน', '0823452345', 'CUSTOMER', 'ACTIVE', TRUE, TRUE, FALSE, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('8f8e8d8c-8b8a-4a8a-9a8a-8a8a8a8a8a8a', 'somsri', 'somsri.m@email.com', '$2a$10$G1A.oV5c2b29r9kWeCKde.X4DRzR8pY72bJqjZpGg5Iahz75bVzS2', 'สมศรี', 'มีสุข', '0834563456', 'CUSTOMER', 'INACTIVE', FALSE, FALSE, FALSE, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('1a2b3c4d-5e6f-4a7b-8c9d-0e1f2a3b4c5d', 'chatchai', 'chatchai.p@email.com', '$2a$10$G1A.oV5c2b29r9kWeCKde.X4DRzR8pY72bJqjZpGg5Iahz75bVzS2', 'ชัชชัย', 'ประกอบกิจ', '0845674567', 'CUSTOMER', 'ACTIVE', TRUE, FALSE, FALSE, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('2b3c4d5e-6f7a-4b8c-9d0e-1f2a3b4c5d6e', 'piyanuch', 'piyanuch.s@smartstore.com', '$2a$10$G1A.oV5c2b29r9kWeCKde.X4DRzR8pY72bJqjZpGg5Iahz75bVzS2', 'ปิยะนุช', 'สุขสวัสดิ์', '0856785678', 'STAFF', 'ACTIVE', TRUE, TRUE, TRUE, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('3c4d5e6f-7a8b-4c9d-0e1f-2a3b4c5d6e7f', 'inactive_user', 'inactive@email.com', '$2a$10$G1A.oV5c2b29r9kWeCKde.X4DRzR8pY72bJqjZpGg5Iahz75bVzS2', 'ยูสเซอร์', 'ถูกปิด', '0867896789', 'CUSTOMER', 'INACTIVE', FALSE, FALSE, FALSE, NULL, NULL, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL);

-- User addresses (UUID v4 สุ่มใหม่)
INSERT INTO identity.user_addresses (address_id, user_id, address_type, address_line1, address_line2, city, state, postal_code, country, is_default, created_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('b1c2d3e4-f5a6-4b7c-8d9e-0f1a2b3c4d5e', '9c928021-01c7-4423-b3ab-c504fecf0b65', 'SHIPPING', '123 ถนนสุขุมวิท', NULL, 'กรุงเทพฯ', NULL, '10110', 'TH', TRUE, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('c2d3e4f5-a6b7-4c8d-9e0f-1a2b3c4d5e6f', 'dcb78487-4085-4cb7-85d6-7df4ec52bccd', 'SHIPPING', '456 ถนนพหลโยธิน', NULL, 'กรุงเทพฯ', NULL, '10400', 'TH', TRUE, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('d3e4f5a6-b7c8-4d9e-0f1a-2b3c4d5e6f7a', 'a25fa278-5eaa-4dbe-a37f-ebdfcd6bfa3b', 'SHIPPING', '789 ถนนเพชรบุรี', NULL, 'กรุงเทพฯ', NULL, '10400', 'TH', TRUE, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('e4f5a6b7-c8d9-4e0f-1a2b-3c4d5e6f7a8b', 'dfd734ce-e83e-4673-93d5-5bba0fc79d5c', 'SHIPPING', '101 ถนนพระราม 4', NULL, 'กรุงเทพฯ', NULL, '10500', 'TH', TRUE, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL);

-- =====================
-- RBAC DOMAIN
-- =====================

-- Roles (UUID v4 สุ่มใหม่)
INSERT INTO rbac.roles (role_id, name, description, is_active, created_at, updated_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'SUPER_ADMIN', 'ผู้ดูแลระบบสูงสุด - มีสิทธิ์ทุกอย่างในระบบ', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Permissions: All', 'Level: System', NULL, NULL, NULL),
('f2d3e4a5-6b7c-5d8e-9f0a-1b2c3d4e5f6a', 'ADMIN', 'ผู้ดูแลระบบ - จัดการระบบและผู้ใช้', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Permissions: User Management, System Config', 'Level: Application', NULL, NULL, NULL),
('a3e4f5b6-7c8d-6e9f-0a1b-2c3d4e5f6a7b', 'MANAGER', 'ผู้จัดการ - จัดการสินค้าและคำสั่งซื้อ', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Permissions: Product Management, Order Management', 'Level: Business', NULL, NULL, NULL),
('b4f5a6c7-8d9e-7f0a-1b2c-3d4e5f6a7b8c', 'STAFF', 'พนักงาน - จัดการคำสั่งซื้อและลูกค้า', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Permissions: Order Processing, Customer Service', 'Level: Operational', NULL, NULL, NULL),
('c5a6b7d8-9e0f-8a1b-2c3d-4e5f6a7b8c9d', 'CUSTOMER', 'ลูกค้า - ดูและสั่งซื้อสินค้า', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Permissions: Product View, Order Placement', 'Level: Customer', NULL, NULL, NULL),
('d6b7c8e9-0f1a-9b2c-3d4e-5f6a7b8c9d0e', 'MARKETING', 'ฝ่ายการตลาด - จัดการโปรโมชั่นและแคมเปญ', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Permissions: Marketing Management, Campaign Control', 'Level: Marketing', NULL, NULL, NULL),
('e7c8d9f0-1a2b-0c3d-4e5f-6a7b8c9d0e1f', 'SUPPORT', 'ฝ่ายสนับสนุน - ช่วยเหลือลูกค้า', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Permissions: Customer Support, Ticket Management', 'Level: Support', NULL, NULL, NULL),
('f8d9e0a1-2b3c-1d4e-5f6a-7b8c9d0e1f2a', 'QA', 'ฝ่ายควบคุมคุณภาพ - ตรวจสอบสินค้า', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Permissions: Quality Control, Product Review', 'Level: Quality', NULL, NULL, NULL),
('a9e0f1b2-3c4d-2e5f-6a7b-8c9d0e1f2a3b', 'LOGISTICS', 'ฝ่ายโลจิสติกส์ - จัดการคลังและจัดส่ง', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Permissions: Inventory Management, Shipping Control', 'Level: Logistics', NULL, NULL, NULL),
('b0f1a2c3-4d5e-3f6a-7b8c-9d0e1f2a3b4c', 'FINANCE', 'ฝ่ายการเงิน - จัดการการชำระเงิน', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Permissions: Payment Management, Financial Reports', 'Level: Finance', NULL, NULL, NULL);

-- Permissions
INSERT INTO rbac.permissions (permission_id, name, description, resource, action, is_active, created_at, updated_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('a1b2c3d4-5e6f-4a7b-8c9d-0e1f2a3b4c5d', 'user.create', 'สร้างผู้ใช้ใหม่', 'users', 'create', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Identity', 'Scope: User Management', NULL, NULL, NULL),
('b2c3d4e5-6f7a-5b8c-9d0e-1f2a3b4c5d6e', 'user.read', 'ดูข้อมูลผู้ใช้', 'users', 'read', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Identity', 'Scope: User Management', NULL, NULL, NULL),
('c3d4e5f6-7a8b-6c9d-0e1f-2a3b4c5d6e7f', 'user.update', 'แก้ไขข้อมูลผู้ใช้', 'users', 'update', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Identity', 'Scope: User Management', NULL, NULL, NULL),
('d4e5f6a7-8b9c-7d0e-1f2a-3b4c5d6e7f8a', 'user.delete', 'ลบผู้ใช้', 'users', 'delete', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Identity', 'Scope: User Management', NULL, NULL, NULL),
('e5f6a7b8-9c0d-8e1f-2a3b-4c5d6e7f8a9b', 'product.create', 'สร้างสินค้าใหม่', 'products', 'create', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Catalog', 'Scope: Product Management', NULL, NULL, NULL),
('f6a7b8c9-0d1e-9f2a-3b4c-5d6e7f8a9b0c', 'product.read', 'ดูข้อมูลสินค้า', 'products', 'read', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Catalog', 'Scope: Product Management', NULL, NULL, NULL),
('a7b8c9d0-1e2f-0a3b-4c5d-6e7f8a9b0c1d', 'product.update', 'แก้ไขข้อมูลสินค้า', 'products', 'update', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Catalog', 'Scope: Product Management', NULL, NULL, NULL),
('b8c9d0e1-2f3a-1b4c-5d6e-7f8a9b0c1d2e', 'product.delete', 'ลบสินค้า', 'products', 'delete', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Catalog', 'Scope: Product Management', NULL, NULL, NULL),
('c9d0e1f2-3a4b-2c5d-6e7f-8a9b0c1d2e3f', 'order.create', 'สร้างคำสั่งซื้อ', 'orders', 'create', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Sales', 'Scope: Order Management', NULL, NULL, NULL),
('d0e1f2a3-4b5c-3d6e-7f8a-9b0c1d2e3f4a', 'order.read', 'ดูคำสั่งซื้อ', 'orders', 'read', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Sales', 'Scope: Order Management', NULL, NULL, NULL),
('e1f2a3b4-5c6d-4e7f-8a9b-0c1d2e3f4a5b', 'order.update', 'แก้ไขคำสั่งซื้อ', 'orders', 'update', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Sales', 'Scope: Order Management', NULL, NULL, NULL),
('f2a3b4c5-6d7e-5f8a-9b0c-1d2e3f4a5b6c', 'order.delete', 'ลบคำสั่งซื้อ', 'orders', 'delete', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Sales', 'Scope: Order Management', NULL, NULL, NULL),
('a3b4c5d6-7e8f-6a9b-0c1d-2e3f4a5b6c7d', 'payment.create', 'สร้างการชำระเงิน', 'payments', 'create', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Payments', 'Scope: Payment Management', NULL, NULL, NULL),
('b4c5d6e7-8f9a-7b0c-1d2e-3f4a5b6c7d8e', 'payment.read', 'ดูการชำระเงิน', 'payments', 'read', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Payments', 'Scope: Payment Management', NULL, NULL, NULL),
('c5d6e7f8-9a0b-8c1d-2e3f-4a5b6c7d8e9f', 'payment.update', 'แก้ไขการชำระเงิน', 'payments', 'update', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Payments', 'Scope: Payment Management', NULL, NULL, NULL),
('d6e7f8a9-0b1c-9d2e-3f4a-5b6c7d8e9f0a', 'payment.delete', 'ลบการชำระเงิน', 'payments', 'delete', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Payments', 'Scope: Payment Management', NULL, NULL, NULL),
('e7f8a9b0-1c2d-0e3f-4a5b-6c7d8e9f0a1b', 'inventory.read', 'ดูคลังสินค้า', 'inventory', 'read', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Inventory', 'Scope: Inventory Management', NULL, NULL, NULL),
('f8a9b0c1-2d3e-1f4a-5b6c-7d8e9f0a1b2c', 'inventory.update', 'แก้ไขคลังสินค้า', 'inventory', 'update', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Inventory', 'Scope: Inventory Management', NULL, NULL, NULL),
('a9b0c1d2-3e4f-2a5b-6c7d-8e9f0a1b2c3d', 'report.read', 'ดูรายงาน', 'reports', 'read', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: Analytics', 'Scope: Reporting', NULL, NULL, NULL),
('b0c1d2e3-4f5a-3b6c-7d8e-9f0a1b2c3d4e', 'system.config', 'ตั้งค่าระบบ', 'system', 'config', TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Domain: System', 'Scope: System Administration', NULL, NULL, NULL);

-- Role-Permissions
INSERT INTO rbac.role_permissions (role_permission_id, role_id, permission_id, granted_at, granted_by, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('c1d2e3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'a1b2c3d4-5e6f-4a7b-8c9d-0e1f2a3b4c5d', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: user.create', NULL, NULL, NULL),
('d2e3f4a5-6b7c-5d8e-9f0a-1b2c3d4e5f6a', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'b2c3d4e5-6f7a-5b8c-9d0e-1f2a3b4c5d6e', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: user.read', NULL, NULL, NULL),
('e3f4a5b6-7c8d-6e9f-0a1b-2c3d4e5f6a7b', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'c3d4e5f6-7a8b-6c9d-0e1f-2a3b4c5d6e7f', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: user.update', NULL, NULL, NULL),
('f4a5b6c7-8d9e-7f0a-1b2c-3d4e5f6a7b8c', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'd4e5f6a7-8b9c-7d0e-1f2a-3b4c5d6e7f8a', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: user.delete', NULL, NULL, NULL),
('a5b6c7d8-9e0f-8a1b-2c3d-4e5f6a7b8c9d', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'e5f6a7b8-9c0d-8e1f-2a3b-4c5d6e7f8a9b', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: product.create', NULL, NULL, NULL),
('b6c7d8e9-0f1a-9b2c-3d4e-5f6a7b8c9d0e', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'f6a7b8c9-0d1e-9f2a-3b4c-5d6e7f8a9b0c', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: product.read', NULL, NULL, NULL),
('c7d8e9f0-1a2b-0c3d-4e5f-6a7b8c9d0e1f', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'a7b8c9d0-1e2f-0a3b-4c5d-6e7f8a9b0c1d', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: product.update', NULL, NULL, NULL),
('d8e9f0a1-2b3c-1d4e-5f6a-7b8c9d0e1f2a', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'b8c9d0e1-2f3a-1b4c-5d6e-7f8a9b0c1d2e', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: product.delete', NULL, NULL, NULL),
('e9f0a1b2-3c4d-2e5f-6a7b-8c9d0e1f2a3b', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'c9d0e1f2-3a4b-2c5d-6e7f-8a9b0c1d2e3f', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: order.create', NULL, NULL, NULL),
('f0a1b2c3-4d5e-3f6a-7b8c-9d0e1f2a3b4c', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'd0e1f2a3-4b5c-3d6e-7f8a-9b0c1d2e3f4a', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: order.read', NULL, NULL, NULL),
('a1b2c3d4-5e6f-4a7b-8c9d-0e1f2a3b4c5d', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'e1f2a3b4-5c6d-4e7f-8a9b-0c1d2e3f4a5b', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: order.update', NULL, NULL, NULL),
('b2c3d4e5-6f7a-5b8c-9d0e-1f2a3b4c5d6e', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'f2a3b4c5-6d7e-5f8a-9b0c-1d2e3f4a5b6c', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: order.delete', NULL, NULL, NULL),
('c3d4e5f6-7a8b-6c9d-0e1f-2a3b4c5d6e7f', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'a3b4c5d6-7e8f-6a9b-0c1d-2e3f4a5b6c7d', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: payment.create', NULL, NULL, NULL),
('d4e5f6a7-8b9c-7d0e-1f2a-3b4c5d6e7f8a', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'b4c5d6e7-8f9a-7b0c-1d2e-3f4a5b6c7d8e', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: payment.read', NULL, NULL, NULL),
('e5f6a7b8-9c0d-8e1f-2a3b-4c5d6e7f8a9b', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'c5d6e7f8-9a0b-8c1d-2e3f-4a5b6c7d8e9f', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: payment.update', NULL, NULL, NULL),
('f6a7b8c9-0d1e-9f2a-3b4c-5d6e7f8a9b0c', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'd6e7f8a9-0b1c-9d2e-3f4a-5b6c7d8e9f0a', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: payment.delete', NULL, NULL, NULL),
('a7b8c9d0-1e2f-0a3b-4c5d-6e7f8a9b0c1d', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'e7f8a9b0-1c2d-0e3f-4a5b-6c7d8e9f0a1b', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: inventory.read', NULL, NULL, NULL),
('b8c9d0e1-2f3a-1b4c-5d6e-7f8a9b0c1d2e', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'f8a9b0c1-2d3e-1f4a-5b6c-7d8e9f0a1b2c', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: inventory.update', NULL, NULL, NULL),
('c9d0e1f2-3a4b-2c5d-6e7f-8a9b0c1d2e3f', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'a9b0c1d2-3e4f-2a5b-6c7d-8e9f0a1b2c3d', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: report.read', NULL, NULL, NULL),
('d0e1f2a3-4b5c-3d6e-7f8a-9b0c1d2e3f4a', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'b0c1d2e3-4f5a-3b6c-7d8e-9f0a1b2c3d4e', CURRENT_TIMESTAMP, 'system', 'Role: SUPER_ADMIN', 'Permission: system.config', NULL, NULL, NULL);

-- User-Roles (user_id อ้างอิง users จริง)
INSERT INTO rbac.user_roles (user_role_id, user_id, role_id, assigned_at, assigned_by, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('f1a2b3c4-5d6e-4f7a-8b9c-0d1e2f3a4b5c', 'a25fa278-5eaa-4dbe-a37f-ebdfcd6bfa3b', 'e1c2d3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', CURRENT_TIMESTAMP, 'system', 'User: somsak', 'Role: SUPER_ADMIN', NULL, NULL, NULL),
('a2b3c4d5-6e7f-5a8b-9c0d-1e2f3a4b5c6d', 'dfd734ce-e83e-4673-93d5-5bba0fc79d5c', 'f2d3e4a5-6b7c-5d8e-9f0a-1b2c3d4e5f6a', CURRENT_TIMESTAMP, 'system', 'User: supaporn', 'Role: ADMIN', NULL, NULL, NULL),
('b3c4d5e6-7f8a-6b9c-0d1e-2f3a4b5c6d7e', '3d3f4773-caf6-4613-8041-87926d9d737a', 'a3e4f5b6-7c8d-6e9f-0a1b-2c3d4e5f6a7b', CURRENT_TIMESTAMP, 'system', 'User: somchai', 'Role: MANAGER', NULL, NULL, NULL),
('c4d5e6f7-8a9b-7c0d-1e2f-3a4b5c6d7e8f', '7e2e2b2a-2e2e-4e2e-8e2e-2e2e2e2e2e2e', 'b4f5a6c7-8d9e-7f0a-1b2c-3d4e5f6a7b8c', CURRENT_TIMESTAMP, 'system', 'User: manee', 'Role: STAFF', NULL, NULL, NULL),
('d5e6f7a8-9b0c-8d1e-2f3a-4b5c6d7e8f9a', '8f8e8d8c-8b8a-4a8a-9a8a-8a8a8a8a8a8a', 'c5a6b7d8-9e0f-8a1b-2c3d-4e5f6a7b8c9d', CURRENT_TIMESTAMP, 'system', 'User: somsri', 'Role: CUSTOMER', NULL, NULL, NULL),
('e6f7a8b9-0c1d-9e2f-3a4b-5c6d7e8f9a0b', '1a2b3c4d-5e6f-4a7b-8c9d-0e1f2a3b4c5d', 'd6b7c8e9-0f1a-9b2c-3d4e-5f6a7b8c9d0e', CURRENT_TIMESTAMP, 'system', 'User: chatchai', 'Role: MARKETING', NULL, NULL, NULL),
('f7a8b9c0-1d2e-0f3a-4b5c-6d7e8f9a0b1c', '2b3c4d5e-6f7a-4b8c-9d0e-1f2a3b4c5d6e', 'e7c8d9f0-1a2b-0c3d-4e5f-6a7b8c9d0e1f', CURRENT_TIMESTAMP, 'system', 'User: piyanuch', 'Role: SUPPORT', NULL, NULL, NULL),
('a8b9c0d1-2e3f-1a4b-5c6d-7e8f9a0b1c2d', '3c4d5e6f-7a8b-4c9d-0e1f-2a3b4c5d6e7f', 'f8d9e0a1-2b3c-1d4e-5f6a-7b8c9d0e1f2a', CURRENT_TIMESTAMP, 'system', 'User: inactive_user', 'Role: QA', NULL, NULL, NULL),
('b9c0d1e2-3f4a-2b5c-6d7e-8f9a0b1c2d3e', '9c928021-01c7-4423-b3ab-c504fecf0b65', 'a9e0f1b2-3c4d-2e5f-6a7b-8c9d0e1f2a3b', CURRENT_TIMESTAMP, 'system', 'User: admin', 'Role: LOGISTICS', NULL, NULL, NULL),
('c0d1e2f3-4a5b-3c6d-7e8f-9a0b1c2d3e4f', 'dcb78487-4085-4cb7-85d6-7df4ec52bccd', 'b0f1a2c3-4d5e-3f6a-7b8c-9d0e1f2a3b4c', CURRENT_TIMESTAMP, 'system', 'User: staff', 'Role: FINANCE', NULL, NULL, NULL);

-- =====================
-- CATALOG DOMAIN
-- =====================

-- Categories (UUID v4 สุ่มใหม่)
INSERT INTO catalog.categories (category_id, name, description, parent_id, slug, image_url, sort_order, is_active, created_at, updated_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('e7b8c9d0-1a2b-4c5d-8e9f-0a1b2c3d4e5f', 'เสื้อผ้า', 'เสื้อผ้าแฟชั่นสำหรับทุกเพศทุกวัย', NULL, 'clothing', 'https://example.com/images/categories/clothing.jpg', 1, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('a3f2e1d0-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'รองเท้า', 'รองเท้าคุณภาพดี ใส่สบาย', NULL, 'shoes', 'https://example.com/images/categories/shoes.jpg', 2, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('b9c8d7e6-2f3g-5h6i-9j0k-1l2m3n4o5p6q', 'อิเล็กทรอนิกส์', 'อุปกรณ์อิเล็กทรอนิกส์ล่าสุด', NULL, 'electronics', 'https://example.com/images/categories/electronics.jpg', 3, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('c1d2e3f4-5g6h-7i8j-9k0l-1m2n3o4p5q6r', 'ของใช้ในบ้าน', 'สินค้าคุณภาพสำหรับบ้าน', NULL, 'home-living', 'https://example.com/images/categories/home-living.jpg', 4, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL);

-- Insert sub-categories with parent reference (UUID v4 สุ่มใหม่)
INSERT INTO catalog.categories (category_id, name, description, parent_id, slug, image_url, sort_order, is_active, created_at, updated_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('d7e8f9g0-1h2i-3j4k-5l6m-7n8o9p0q1r2s', 'เสื้อผ้าผู้ชาย', 'เสื้อผ้าสไตล์ผู้ชาย', 'e7b8c9d0-1a2b-4c5d-8e9f-0a1b2c3d4e5f', 'mens-clothing', 'https://example.com/images/categories/mens-clothing.jpg', 1, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('e9f0g1h2-3i4j-5k6l-7m8n-9o0p1q2r3s4t', 'เสื้อผ้าผู้หญิง', 'เสื้อผ้าสไตล์ผู้หญิง', 'e7b8c9d0-1a2b-4c5d-8e9f-0a1b2c3d4e5f', 'womens-clothing', 'https://example.com/images/categories/womens-clothing.jpg', 2, TRUE, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL);

-- Brands (UUID v4 สุ่มใหม่)
INSERT INTO catalog.brands (brand_id, name, description, logo_url, website_url, is_active, created_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('f5g6h7i8-9j0k-1l2m-3n4o-5p6q7r8s9t0u', 'Nike', 'Just Do It - แบรนด์กีฬาระดับโลก', 'https://example.com/images/brands/nike-logo.png', 'https://www.nike.com', TRUE, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('g7h8i9j0-1k2l-3m4n-5o6p-7q8r9s0t1u2v', 'Adidas', 'Impossible is Nothing - นวัตกรรมกีฬา', 'https://example.com/images/brands/adidas-logo.png', 'https://www.adidas.com', TRUE, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('h9i0j1k2-3l4m-5n6o-7p8q-9r0s1t2u3v4w', 'Apple', 'Think Different - เทคโนโลยีล้ำสมัย', 'https://example.com/images/brands/apple-logo.png', 'https://www.apple.com', TRUE, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('i1j2k3l4-5m6n-7o8p-9q0r-1s2t3u4v5w6x', 'Samsung', 'Do What You Can''t - นวัตกรรมไร้ขีดจำกัด', 'https://example.com/images/brands/samsung-logo.png', 'https://www.samsung.com', TRUE, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('j3k4l5m6-7n8o-9p0q-1r2s-3t4u5v6w7x8y', 'IKEA', 'Creating a Better Everyday Life - เฟอร์นิเจอร์คุณภาพ', 'https://example.com/images/brands/ikea-logo.png', 'https://www.ikea.com', TRUE, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL);

-- Products (UUID v4 สุ่มใหม่)
INSERT INTO catalog.products (product_id, sku, name, description, short_description, category_id, brand_id, price, compare_price, cost_price, weight, dimensions, is_active, is_featured, meta_title, meta_description, slug, created_at, updated_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('k5l6m7n8-9o0p-1q2r-3s4t-5u6v7w8x9y0z', 'TSH-001', 'เสื้อยืดคอตตอน 100%', 'เสื้อยืดคุณภาพดี ใส่สบาย ไม่ร้อน เนื้อผ้านุ่ม ระบายอากาศได้ดี เหมาะสำหรับทุกโอกาส', 'เสื้อยืดคอตตอนคุณภาพดี', 'd7e8f9g0-1h2i-3j4k-5l6m-7n8o9p0q1r2s', 'f5g6h7i8-9j0k-1l2m-3n4o-5p6q7r8s9t0u', 299.00, 399.00, 150.00, 0.200, '30x40x2', TRUE, TRUE, 'เสื้อยืดคอตตอน 100% - Nike', 'เสื้อยืดคุณภาพดี ใส่สบาย ไม่ร้อน', 'nike-cotton-tshirt', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Material: 100% Cotton', 'Care: Machine wash', 'Origin: Thailand', NULL, NULL),
('l7m8n9o0-1p2q-3r4s-5t6u-7v8w9x0y1z2a', 'JNS-001', 'กางเกงยีนส์ขาสั้น', 'กางเกงยีนส์แฟชั่นสำหรับทุกโอกาส เนื้อผ้าทนทาน ดีไซน์สวย ใส่ได้หลากหลายสไตล์', 'กางเกงยีนส์แฟชั่น', 'd7e8f9g0-1h2i-3j4k-5l6m-7n8o9p0q1r2s', 'g7h8i9j0-1k2l-3m4n-5o6p-7q8r9s0t1u2v', 790.00, 990.00, 400.00, 0.500, '35x45x3', TRUE, TRUE, 'กางเกงยีนส์ขาสั้น - Adidas', 'กางเกงยีนส์แฟชั่นสำหรับทุกโอกาส', 'adidas-denim-shorts', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Material: Denim', 'Care: Machine wash cold', 'Origin: Vietnam', NULL, NULL),
('m9n0o1p2-3q4r-5s6t-7u8v-9w0x1y2z3a4b', 'SNK-001', 'รองเท้าผ้าใบ', 'รองเท้าผ้าใบดีไซน์สวย ทนทาน ใส่สบาย เหมาะสำหรับการเดินและกีฬา', 'รองเท้าผ้าใบคุณภาพดี', 'a3f2e1d0-4b5c-6d7e-8f9a-0b1c2d3e4f5a', 'f5g6h7i8-9j0k-1l2m-3n4o-5p6q7r8s9t0u', 1200.00, 1500.00, 600.00, 0.800, '25x35x15', TRUE, FALSE, 'รองเท้าผ้าใบ - Nike', 'รองเท้าผ้าใบดีไซน์สวย ทนทาน', 'nike-sneakers', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Material: Mesh + Rubber', 'Care: Wipe with damp cloth', 'Origin: Indonesia', NULL, NULL),
('n1o2p3q4-5r6s-7t8u-9v0w-1x2y3z4a5b6c', 'HPH-001', 'หูฟังไร้สาย Pro', 'หูฟังตัดเสียงรบกวน คุณภาพเสียงระดับสตูดิโอ ใช้งานได้นาน 8 ชั่วโมง', 'หูฟังไร้สายคุณภาพสูง', 'b9c8d7e6-2f3g-5h6i-9j0k-1l2m3n4o5p6q', 'h9i0j1k2-3l4m-5n6o-7p8q-9r0s1t2u3v4w', 4500.00, 5500.00, 2500.00, 0.150, '20x25x8', TRUE, TRUE, 'หูฟังไร้สาย Pro - Apple', 'หูฟังตัดเสียงรบกวน คุณภาพเสียงระดับสตูดิโอ', 'apple-airpods-pro', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Battery: 8 hours', 'Connectivity: Bluetooth 5.0', 'Features: Noise Cancelling', NULL, NULL),
('o3p4q5r6-7s8t-9u0v-1w2x-3y4z5a6b7c8d', 'MUG-001', 'แก้วกาแฟเซรามิค', 'แก้วกาแฟเก็บความร้อน ดีไซน์มินิมอล ปลอดภัยสำหรับไมโครเวฟ', 'แก้วกาแฟเซรามิค', 'c1d2e3f4-5g6h-7i8j-9k0l-1m2n3o4p5q6r', 'j3k4l5m6-7n8o-9p0q-1r2s-3t4u5v6w7x8y', 350.00, 450.00, 150.00, 0.300, '15x20x12', TRUE, FALSE, 'แก้วกาแฟเซรามิค - IKEA', 'แก้วกาแฟเก็บความร้อน ดีไซน์มินิมอล', 'ikea-ceramic-mug', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 'Material: Ceramic', 'Capacity: 350ml', 'Microwave Safe: Yes', NULL, NULL);

-- Product Images (UUID v4 สุ่มใหม่)
INSERT INTO catalog.product_images (image_id, product_id, image_url, alt_text, sort_order, is_primary, created_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('p5q6r7s8-9t0u-1v2w-3x4y-5z6a7b8c9d0e', 'k5l6m7n8-9o0p-1q2r-3s4t-5u6v7w8x9y0z', 'https://example.com/images/products/tsh-001-main.jpg', 'เสื้อยืดคอตตอน 100% - ภาพหลัก', 1, TRUE, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('q7r8s9t0-1u2v-3w4x-5y6z-7a8b9c0d1e2f', 'k5l6m7n8-9o0p-1q2r-3s4t-5u6v7w8x9y0z', 'https://example.com/images/products/tsh-001-detail.jpg', 'เสื้อยืดคอตตอน 100% - รายละเอียด', 2, FALSE, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('r9s0t1u2-3v4w-5x6y-7z8a-9b0c1d2e3f4g', 'l7m8n9o0-1p2q-3r4s-5t6u-7v8w9x0y1z2a', 'https://example.com/images/products/jns-001-main.jpg', 'กางเกงยีนส์ขาสั้น - ภาพหลัก', 1, TRUE, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('s1t2u3v4-5w6x-7y8z-9a0b-1c2d3e4f5g6h', 'm9n0o1p2-3q4r-5s6t-7u8v-9w0x1y2z3a4b', 'https://example.com/images/products/snk-001-main.jpg', 'รองเท้าผ้าใบ - ภาพหลัก', 1, TRUE, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('t3u4v5w6-7x8y-9z0a-1b2c-3d4e5f6g7h8i', 'n1o2p3q4-5r6s-7t8u-9v0w-1x2y3z4a5b6c', 'https://example.com/images/products/hph-001-main.jpg', 'หูฟังไร้สาย Pro - ภาพหลัก', 1, TRUE, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('u5v6w7x8-9y0z-1a2b-3c4d-5e6f7g8h9i0j', 'o3p4q5r6-7s8t-9u0v-1w2x-3y4z5a6b7c8d', 'https://example.com/images/products/mug-001-main.jpg', 'แก้วกาแฟเซรามิค - ภาพหลัก', 1, TRUE, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL);

-- Product Variants (UUID v4 สุ่มใหม่)
INSERT INTO catalog.product_variants (variant_id, product_id, sku, name, price_adjustment, weight_adjustment, is_active, created_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('v7w8x9y0-1z2a-3b4c-5d6e-7f8g9h0i1j2k', 'k5l6m7n8-9o0p-1q2r-3s4t-5u6v7w8x9y0z', 'TSH-001-WHITE-S', 'สีขาว ขนาด S', 0.00, 0.00, TRUE, CURRENT_TIMESTAMP, 'Color: White', 'Size: S', NULL, NULL, NULL),
('w9x0y1z2-3a4b-5c6d-7e8f-9g0h1i2j3k4l', 'k5l6m7n8-9o0p-1q2r-3s4t-5u6v7w8x9y0z', 'TSH-001-BLACK-M', 'สีดำ ขนาด M', 0.00, 0.00, TRUE, CURRENT_TIMESTAMP, 'Color: Black', 'Size: M', NULL, NULL, NULL),
('x1y2z3a4-5b6c-7d8e-9f0g-1h2i3j4k5l6m', 'k5l6m7n8-9o0p-1q2r-3s4t-5u6v7w8x9y0z', 'TSH-001-BLUE-L', 'สีน้ำเงิน ขนาด L', 0.00, 0.00, TRUE, CURRENT_TIMESTAMP, 'Color: Blue', 'Size: L', NULL, NULL, NULL),
('y3z4a5b6-7c8d-9e0f-1g2h-3i4j5k6l7m8n', 'l7m8n9o0-1p2q-3r4s-5t6u-7v8w9x0y1z2a', 'JNS-001-BLUE-30', 'สีน้ำเงิน ขนาด 30', 0.00, 0.00, TRUE, CURRENT_TIMESTAMP, 'Color: Blue', 'Size: 30', NULL, NULL, NULL),
('z5a6b7c8-9d0e-1f2g-3h4i-5j6k7l8m9n0o', 'l7m8n9o0-1p2q-3r4s-5t6u-7v8w9x0y1z2a', 'JNS-001-BLACK-32', 'สีดำ ขนาด 32', 0.00, 0.00, TRUE, CURRENT_TIMESTAMP, 'Color: Black', 'Size: 32', NULL, NULL, NULL),
('a7b8c9d0-1e2f-3g4h-5i6j-7k8l9m0n1o2p', 'n1o2p3q4-5r6s-7t8u-9v0w-1x2y3z4a5b6c', 'HPH-001-WHITE', 'สีขาว', 0.00, 0.00, TRUE, CURRENT_TIMESTAMP, 'Color: White', NULL, NULL, NULL, NULL),
('b9c0d1e2-3f4g-5h6i-7j8k-9l0m1n2o3p4q', 'n1o2p3q4-5r6s-7t8u-9v0w-1x2y3z4a5b6c', 'HPH-001-BLACK', 'สีดำ', 100.00, 0.00, TRUE, CURRENT_TIMESTAMP, 'Color: Black', 'Premium', NULL, NULL, NULL);

-- =====================
-- INVENTORY DOMAIN
-- =====================

-- Warehouses (ระบุ warehouse_id เอง)
INSERT INTO inventory.warehouses (warehouse_id, name, address_line1, address_line2, city, state, postal_code, country, phone, email, is_active, created_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('d1e2f3a4-5b6c-4d7e-8f9a-0b1c2d3e4f5a', 'คลังสินค้าหลัก', '789 ถนนลาดพร้าว', 'ตึก A ชั้น 1', 'กรุงเทพฯ', NULL, '10900', 'TH', '02-123-4567', 'warehouse@smartstore.com', TRUE, CURRENT_TIMESTAMP, 'Capacity: 10000 sqm', 'Temperature: Controlled', NULL, NULL, NULL),
('e2f3a4b5-6c7d-5e8f-9a0b-1c2d3e4f5a6b', 'คลังสินค้าสาขา 1', '456 ถนนสุขุมวิท', 'ตึก B ชั้น 2', 'กรุงเทพฯ', NULL, '10110', 'TH', '02-234-5678', 'warehouse1@smartstore.com', TRUE, CURRENT_TIMESTAMP, 'Capacity: 5000 sqm', 'Temperature: Ambient', NULL, NULL, NULL),
('f3a4b5c6-7d8e-6f9a-0b1c-2d3e4f5a6b7c', 'คลังสินค้าสาขา 2', '123 ถนนรัชดา', 'ตึก C ชั้น 1', 'กรุงเทพฯ', NULL, '10310', 'TH', '02-345-6789', 'warehouse2@smartstore.com', TRUE, CURRENT_TIMESTAMP, 'Capacity: 3000 sqm', 'Temperature: Ambient', NULL, NULL, NULL);

-- Stock Levels (ระบุ stock_id เอง)
INSERT INTO inventory.stock_levels (stock_id, product_id, variant_id, warehouse_id, quantity, reserved_quantity, low_stock_threshold, created_at, updated_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('a1b2c3d4-5e6f-4a7b-8c9d-0e1f2a3b4c5d', 'k5l6m7n8-9o0p-1q2r-3s4t-5u6v7w8x9y0z', 'v7w8x9y0-1z2a-3b4c-5d6e-7f8g9h0i1j2k', 'd1e2f3a4-5b6c-4d7e-8f9a-0b1c2d3e4f5a', 50, 5, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('b2c3d4e5-6f7a-5b8c-9d0e-1f2a3b4c5d6e', 'k5l6m7n8-9o0p-1q2r-3s4t-5u6v7w8x9y0z', 'w9x0y1z2-3a4b-5c6d-7e8f-9g0h1i2j3k4l', 'd1e2f3a4-5b6c-4d7e-8f9a-0b1c2d3e4f5a', 80, 3, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('c3d4e5f6-7a8b-6c9d-0e1f-2a3b4c5d6e7f', 'k5l6m7n8-9o0p-1q2r-3s4t-5u6v7w8x9y0z', 'x1y2z3a4-5b6c-7d8e-9f0g-1h2i3j4k5l6m', 'd1e2f3a4-5b6c-4d7e-8f9a-0b1c2d3e4f5a', 30, 2, 10, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('d4e5f6a7-8b9c-7d0e-1f2a-3b4c5d6e7f8g', 'l7m8n9o0-1p2q-3r4s-5t6u-7v8w9x0y1z2a', 'y3z4a5b6-7c8d-9e0f-1g2h-3i4j5k6l7m8n', 'd1e2f3a4-5b6c-4d7e-8f9a-0b1c2d3e4f5a', 45, 1, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('e5f6a7b8-9c0d-8e1f-2a3b-4c5d6e7f8g9h', 'l7m8n9o0-1p2q-3r4s-5t6u-7v8w9x0y1z2a', 'z5a6b7c8-9d0e-1f2g-3h4i-5j6k7l8m9n0o', 'd1e2f3a4-5b6c-4d7e-8f9a-0b1c2d3e4f5a', 60, 2, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('f6a7b8c9-0d1e-9f2a-3b4c-5d6e7f8g9h0i', 'm9n0o1p2-3q4r-5s6t-7u8v-9w0x1y2z3a4b', NULL, 'd1e2f3a4-5b6c-4d7e-8f9a-0b1c2d3e4f5a', 25, 1, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('a7b8c9d0-1e2f-0a3b-4c5d-6e7f8g9h0i1j', 'n1o2p3q4-5r6s-7t8u-9v0w-1x2y3z4a5b6c', 'a7b8c9d0-1e2f-3g4h-5i6j-7k8l9m0n1o2p', 'd1e2f3a4-5b6c-4d7e-8f9a-0b1c2d3e4f5a', 40, 3, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('b8c9d0e1-2f3a-1b4c-5d6e-7f8g9h0i1j2k', 'n1o2p3q4-5r6s-7t8u-9v0w-1x2y3z4a5b6c', 'b9c0d1e2-3f4g-5h6i-7j8k-9l0m1n2o3p4q', 'd1e2f3a4-5b6c-4d7e-8f9a-0b1c2d3e4f5a', 35, 1, 5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('c9d0e1f2-3a4b-2c5d-6e7f-8g9h0i1j2k3l', 'o3p4q5r6-7s8t-9u0v-1w2x-3y4z5a6b7c8d', NULL, 'd1e2f3a4-5b6c-4d7e-8f9a-0b1c2d3e4f5a', 120, 5, 20, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL);

-- =====================
-- SALES DOMAIN
-- =====================

-- Orders (ระบุ order_id เอง)
INSERT INTO sales.orders (order_id, order_number, customer_id, order_status, subtotal, tax_amount, shipping_amount, discount_amount, total_amount, currency, shipping_address_id, billing_address_id, notes, created_at, updated_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('f1a2b3c4-5d6e-4f7a-8b9c-0d1e2f3a4b5c', 'ORD-2024-00001', 'a25fa278-5eaa-4dbe-a37f-ebdfcd6bfa3b', 'SHIPPED', 1089.00, 87.12, 100.00, 0.00, 1276.12, 'THB', 'd3e4f5a6-b7c8-4d9e-0f1a-2b3c4d5e6f7a', 'd3e4f5a6-b7c8-4d9e-0f1a-2b3c4d5e6f7a', 'จัดส่งภายใน 2-3 วัน', CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '2 days', 'Shipping: Express', 'Courier: Kerry', NULL, NULL, NULL),
('a2b3c4d5-6e7f-5a8b-9c0d-1e2f3a4b5c6d', 'ORD-2024-00002', 'dfd734ce-e83e-4673-93d5-5bba0fc79d5c', 'PROCESSING', 1200.00, 96.00, 100.00, 0.00, 1396.00, 'THB', 'e4f5a6b7-c8d9-4e0f-1a2b-3c4d5e6f7a8b', 'e4f5a6b7-c8d9-4e0f-1a2b-3c4d5e6f7a8b', 'จัดส่งภายใน 3-5 วัน', CURRENT_TIMESTAMP - INTERVAL '3 days', CURRENT_TIMESTAMP - INTERVAL '1 day', 'Shipping: Standard', 'Courier: Flash', NULL, NULL, NULL),
('b3c4d5e6-7f8a-6b9c-0d1e-2f3a4b5c6d7e', 'ORD-2024-00003', 'a25fa278-5eaa-4dbe-a37f-ebdfcd6bfa3b', 'DELIVERED', 4500.00, 360.00, 100.00, 0.00, 4960.00, 'THB', 'd3e4f5a6-b7c8-4d9e-0f1a-2b3c4d5e6f7a', 'd3e4f5a6-b7c8-4d9e-0f1a-2b3c4d5e6f7a', 'จัดส่งภายใน 1-2 วัน', CURRENT_TIMESTAMP - INTERVAL '10 days', CURRENT_TIMESTAMP - INTERVAL '8 days', 'Shipping: Express', 'Courier: Kerry', 'Signature Required', NULL, NULL),
('c4d5e6f7-8a9b-7c0d-1e2f-3a4b5c6d7e8f', 'ORD-2024-00004', 'dfd734ce-e83e-4673-93d5-5bba0fc79d5c', 'PENDING', 350.00, 28.00, 50.00, 0.00, 428.00, 'THB', 'e4f5a6b7-c8d9-4e0f-1a2b-3c4d5e6f7a8b', 'e4f5a6b7-c8d9-4e0f-1a2b-3c4d5e6f7a8b', 'จัดส่งภายใน 5-7 วัน', CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '1 day', 'Shipping: Economy', 'Courier: Thailand Post', NULL, NULL, NULL);

-- Order Items (ระบุ item_id เอง)
INSERT INTO sales.order_items (item_id, order_id, product_id, variant_id, sku, product_name, quantity, unit_price, total_price, created_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('d1e2f3a4-5b6c-4d7e-8f9a-0b1c2d3e4f5a', 'f1a2b3c4-5d6e-4f7a-8b9c-0d1e2f3a4b5c', 'k5l6m7n8-9o0p-1q2r-3s4t-5u6v7w8x9y0z', 'v7w8x9y0-1z2a-3b4c-5d6e-7f8g9h0i1j2k', 'TSH-001-BLACK-M', 'เสื้อยืดคอตตอน 100% - สีดำ ขนาด M', 2, 299.00, 598.00, CURRENT_TIMESTAMP - INTERVAL '5 days', 'Color: Black', 'Size: M', NULL, NULL, NULL),
('e2f3a4b5-6c7d-5e8f-9a0b-1c2d3e4f5a6b', 'f1a2b3c4-5d6e-4f7a-8b9c-0d1e2f3a4b5c', 'l7m8n9o0-1p2q-3r4s-5t6u-7v8w9x0y1z2a', 'y3z4a5b6-7c8d-9e0f-1g2h-3i4j5k6l7m8n', 'JNS-001-BLUE-30', 'กางเกงยีนส์ขาสั้น - สีน้ำเงิน ขนาด 30', 1, 790.00, 790.00, CURRENT_TIMESTAMP - INTERVAL '5 days', 'Color: Blue', 'Size: 30', NULL, NULL, NULL),
('f3a4b5c6-7d8e-6f9a-0b1c-2d3e4f5a6b7c', 'a2b3c4d5-6e7f-5a8b-9c0d-1e2f3a4b5c6d', 'm9n0o1p2-3q4r-5s6t-7u8v-9w0x1y2z3a4b', NULL, 'SNK-001', 'รองเท้าผ้าใบ', 1, 1200.00, 1200.00, CURRENT_TIMESTAMP - INTERVAL '3 days', NULL, NULL, NULL, NULL, NULL),
('a4b5c6d7-8e9f-7a0b-1c2d-3e4f5a6b7c8d', 'b3c4d5e6-7f8a-6b9c-0d1e-2f3a4b5c6d7e', 'n1o2p3q4-5r6s-7t8u-9v0w-1x2y3z4a5b6c', 'a7b8c9d0-1e2f-3g4h-5i6j-7k8l9m0n1o2p', 'HPH-001-WHITE', 'หูฟังไร้สาย Pro - สีขาว', 1, 4500.00, 4500.00, CURRENT_TIMESTAMP - INTERVAL '10 days', 'Color: White', NULL, NULL, NULL, NULL),
('b5c6d7e8-9f0a-8b1c-2d3e-4f5a6b7c8d9e', 'c4d5e6f7-8a9b-7c0d-1e2f-3a4b5c6d7e8f', 'o3p4q5r6-7s8t-9u0v-1w2x-3y4z5a6b7c8d', NULL, 'MUG-001', 'แก้วกาแฟเซรามิค', 1, 350.00, 350.00, CURRENT_TIMESTAMP - INTERVAL '1 day', NULL, NULL, NULL, NULL, NULL);

-- Shopping Cart (ระบุ cart_id เอง)
INSERT INTO sales.shopping_cart (cart_id, customer_id, product_id, variant_id, quantity, created_at, updated_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('b7e2c1a4-3f5d-4c8a-9e1b-2d3c4f5a6b7c', 'a25fa278-5eaa-4dbe-a37f-ebdfcd6bfa3b', 'k5l6m7n8-9o0p-1q2r-3s4t-5u6v7w8x9y0z', 'v7w8x9y0-1z2a-3b4c-5d6e-7f8g9h0i1j2k', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('c8f3d2b5-4a6e-5d9b-0c1d-3e4f5a6b7c8d', 'a25fa278-5eaa-4dbe-a37f-ebdfcd6bfa3b', 'n1o2p3q4-5r6s-7t8u-9v0w-1x2y3z4a5b6c', 'a7b8c9d0-1e2f-3g4h-5i6j-7k8l9m0n1o2p', 1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('d9a4e3c6-5b7f-6e0c-1d2e-4f5a6b7c8d9e', 'dfd734ce-e83e-4673-93d5-5bba0fc79d5c', 'l7m8n9o0-1p2q-3r4s-5t6u-7v8w9x0y1z2a', 'y3z4a5b6-7c8d-9e0f-1g2h-3i4j5k6l7m8n', 2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL),
('e0b5f4d7-6c8a-7f1d-2e3f-5a6b7c8d9e0f', 'dfd734ce-e83e-4673-93d5-5bba0fc79d5c', 'o3p4q5r6-7s8t-9u0v-1w2x-3y4z5a6b7c8d', NULL, 3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, NULL, NULL, NULL, NULL, NULL);

-- =====================
-- PAYMENTS DOMAIN
-- =====================

-- Payments (ระบุ payment_id เอง)
INSERT INTO payments.payments (payment_id, order_id, payment_method, payment_status, amount, currency, transaction_id, gateway_response, processed_at, created_at, updated_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('c1d2e3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 'f1a2b3c4-5d6e-4f7a-8b9c-0d1e2f3a4b5c', 'CREDIT_CARD', 'COMPLETED', 1276.12, 'THB', 'txn_123456789abc', '{"status": "success", "gateway": "stripe", "charge_id": "ch_123456789"}', CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days', CURRENT_TIMESTAMP - INTERVAL '5 days', 'Card: Visa ending 4242', 'Gateway: Stripe', NULL, NULL, NULL),
('d2e3f4a5-6b7c-5d8e-9f0a-1b2c3d4e5f6a', 'a2b3c4d5-6e7f-5a8b-9c0d-1e2f3a4b5c6d', 'BANK_TRANSFER', 'PENDING', 1396.00, 'THB', 'txn_987654321def', '{"status": "pending", "gateway": "omise", "transfer_id": "tr_987654321"}', NULL, CURRENT_TIMESTAMP - INTERVAL '3 days', CURRENT_TIMESTAMP - INTERVAL '3 days', 'Bank: Bangkok Bank', 'Gateway: Omise', 'Transfer ID: TR123456', NULL, NULL),
('e3f4a5b6-7c8d-6e9f-0a1b-2c3d4e5f6a7b', 'b3c4d5e6-7f8a-6b9c-0d1e-2f3a4b5c6d7e', 'CREDIT_CARD', 'COMPLETED', 4960.00, 'THB', 'txn_333444555', '{"status": "success", "gateway": "stripe", "charge_id": "ch_333444555"}', CURRENT_TIMESTAMP - INTERVAL '10 days', CURRENT_TIMESTAMP - INTERVAL '10 days', CURRENT_TIMESTAMP - INTERVAL '10 days', 'Card: Mastercard ending 5555', 'Gateway: Stripe', NULL, NULL, NULL),
('f4a5b6c7-8d9e-7f0a-1b2c-3d4e5f6a7b8c', 'c4d5e6f7-8a9b-7c0d-1e2f-3a4b5c6d7e8f', 'CASH_ON_DELIVERY', 'PENDING', 428.00, 'THB', NULL, '{"status": "pending", "method": "cod"}', NULL, CURRENT_TIMESTAMP - INTERVAL '1 day', CURRENT_TIMESTAMP - INTERVAL '1 day', 'Method: Cash on Delivery', 'Collect on delivery', NULL, NULL, NULL);

-- Payment Refunds (ระบุ refund_id เอง)
INSERT INTO payments.payment_refunds (refund_id, payment_id, amount, reason, refunded_by, created_at, attribute1, attribute2, attribute3, attribute4, attribute5)
VALUES
('a1b2c3d4-5e6f-4a7b-8c9d-0e1f2a3b4c5d', 'c1d2e3f4-5a6b-4c7d-8e9f-0a1b2c3d4e5f', 299.00, 'สินค้าชำรุด', 'system', CURRENT_TIMESTAMP - INTERVAL '3 days', 'Reason: Damaged item', 'Method: Original payment', NULL, NULL, NULL),
('b2c3d4e5-6f7a-5b8c-9d0e-1f2a3b4c5d6e', 'e3f4a5b6-7c8d-6e9f-0a1b-2c3d4e5f6a7b', 4500.00, 'ลูกค้าขอคืนเงิน', 'system', CURRENT_TIMESTAMP - INTERVAL '1 day', 'Reason: Customer request', 'Status: Under review', NULL, NULL, NULL);

-- =====================
-- END OF DATA INSERTION
-- =====================
 