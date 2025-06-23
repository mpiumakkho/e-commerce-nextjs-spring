package com.mp.ecommerce.rbac.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.mp.ecommerce.rbac.entity.PermissionEntity;

@Repository
public interface PermissionRepository extends JpaRepository<PermissionEntity, String> {
    
    Optional<PermissionEntity> findByName(String name);
    
    List<PermissionEntity> findByResource(String resource);
    
    List<PermissionEntity> findByAction(String action);
    
    List<PermissionEntity> findByResourceAndAction(String resource, String action);
    
    List<PermissionEntity> findByIsActive(Boolean isActive);
    
    @Query("SELECT p FROM PermissionEntity p WHERE p.resource = :resource AND p.action IN :actions")
    List<PermissionEntity> findByResourceAndActions(@Param("resource") String resource, @Param("actions") List<String> actions);
    
    boolean existsByName(String name);
} 