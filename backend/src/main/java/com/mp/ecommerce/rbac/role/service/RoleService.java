package com.mp.ecommerce.rbac.role.service;

import java.util.List;
import java.util.Optional;

import com.mp.ecommerce.rbac.entity.RoleEntity;
import com.mp.ecommerce.rbac.role.dto.RoleDTO;

public interface RoleService {
    
    List<RoleEntity> getAllRoles();
    
    Optional<RoleEntity> getRoleById(String id);
    
    Optional<RoleEntity> getRoleByName(String name);
    
    RoleEntity createRole(RoleDTO roleDTO);
    
    RoleEntity updateRole(String id, RoleDTO roleDTO);
    
    void deleteRole(String id);
    
    boolean existsByName(String name);
    
    RoleDTO convertToDTO(RoleEntity role);
    
    RoleEntity convertToEntity(RoleDTO roleDTO);
} 