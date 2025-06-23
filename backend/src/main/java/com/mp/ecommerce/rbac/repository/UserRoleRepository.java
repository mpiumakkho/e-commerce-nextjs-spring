package com.mp.ecommerce.rbac.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.mp.ecommerce.rbac.entity.UserRoleEntity;

@Repository
public interface UserRoleRepository extends JpaRepository<UserRoleEntity, String> {
    
    List<UserRoleEntity> findByUserId(String userId);
    
    List<UserRoleEntity> findByRoleId(String roleId);
    
    @Query("SELECT ur FROM UserRoleEntity ur WHERE ur.userId = :userId AND ur.roleId = :roleId")
    List<UserRoleEntity> findByUserIdAndRoleId(@Param("userId") String userId, @Param("roleId") String roleId);
    
    @Modifying
    @Query("DELETE FROM UserRoleEntity ur WHERE ur.userId = :userId")
    void deleteByUserId(@Param("userId") String userId);
    
    @Modifying
    @Query("DELETE FROM UserRoleEntity ur WHERE ur.userId = :userId AND ur.roleId = :roleId")
    void deleteByUserIdAndRoleId(@Param("userId") String userId, @Param("roleId") String roleId);
    
    boolean existsByUserIdAndRoleId(String userId, String roleId);
} 