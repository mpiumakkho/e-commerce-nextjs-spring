package com.mp.ecommerce.rbac.role.service;

import java.util.List;
import java.util.Optional;

import com.mp.ecommerce.rbac.entity.RoleEntity;

public interface RoleService {
    
    List<RoleEntity> getAllRoles();
    
    Optional<RoleEntity> getRoleById(String id);
    
    Optional<RoleEntity> getRoleByName(String name);
    
    RoleEntity createRole(RoleEntity role);
    
    RoleEntity updateRole(String id, RoleEntity role);
    
    void deleteRole(String id);
    
    boolean existsByName(String name);
} 