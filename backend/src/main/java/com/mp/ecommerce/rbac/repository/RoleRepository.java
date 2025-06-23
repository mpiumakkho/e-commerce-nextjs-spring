package com.mp.ecommerce.rbac.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.mp.ecommerce.rbac.entity.RoleEntity;

@Repository
public interface RoleRepository extends JpaRepository<RoleEntity, String> {
    
    Optional<RoleEntity> findByName(String name);
    
    List<RoleEntity> findByIsActive(Boolean isActive);
    
    @Query("SELECT r FROM RoleEntity r WHERE r.name IN :roleNames")
    List<RoleEntity> findByNames(@Param("roleNames") List<String> roleNames);
    
    boolean existsByName(String name);
} 