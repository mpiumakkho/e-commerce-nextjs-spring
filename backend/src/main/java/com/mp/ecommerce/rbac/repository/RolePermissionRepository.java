package com.mp.ecommerce.rbac.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.mp.ecommerce.rbac.entity.RolePermissionEntity;

@Repository
public interface RolePermissionRepository extends JpaRepository<RolePermissionEntity, String> {
    
    List<RolePermissionEntity> findByRoleId(String roleId);
    
    List<RolePermissionEntity> findByPermissionId(String permissionId);
    
    @Query("SELECT rp FROM RolePermissionEntity rp WHERE rp.roleId = :roleId AND rp.permissionId = :permissionId")
    List<RolePermissionEntity> findByRoleIdAndPermissionId(@Param("roleId") String roleId, @Param("permissionId") String permissionId);
    
    @Modifying
    @Query("DELETE FROM RolePermissionEntity rp WHERE rp.roleId = :roleId")
    void deleteByRoleId(@Param("roleId") String roleId);
    
    @Modifying
    @Query("DELETE FROM RolePermissionEntity rp WHERE rp.roleId = :roleId AND rp.permissionId = :permissionId")
    void deleteByRoleIdAndPermissionId(@Param("roleId") String roleId, @Param("permissionId") String permissionId);
    
    boolean existsByRoleIdAndPermissionId(String roleId, String permissionId);
} 