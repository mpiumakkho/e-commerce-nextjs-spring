package com.mp.ecommerce.rbac.service;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import com.mp.ecommerce.rbac.entity.RoleEntity;
import com.mp.ecommerce.rbac.entity.UserRoleEntity;
import com.mp.ecommerce.user.entity.UserEntity;

public interface RbacService {

    // role management
    List<RoleEntity> getAllRoles();
    
    Optional<RoleEntity> getRoleById(String roleId);
    
    Optional<RoleEntity> getRoleByName(String roleName);
    
    RoleEntity createRole(RoleEntity role);
    
    RoleEntity updateRole(RoleEntity role);
    
    void deleteRole(String roleId);

    // user role management
    List<UserRoleEntity> getUserRoles(String userId);
    
    Set<String> getUserRoleNames(String userId);
    
    UserRoleEntity assignRoleToUser(String userId, String roleId, String assignedBy);
    
    void removeRoleFromUser(String userId, String roleId);
    
    void removeAllRolesFromUser(String userId);

    // authorization method
    boolean hasRole(String userId, String roleName);
    
    boolean hasAnyRole(String userId, String... roleNames);

    // check both old enum role and new RBAC roles
    boolean hasRoleHybrid(UserEntity user, String roleName);
    
    boolean hasAnyRoleHybrid(UserEntity user, String... roleNames);

    // migration method
    void migrateUserRoleToRbac(String userId, String roleName, String assignedBy);
} 