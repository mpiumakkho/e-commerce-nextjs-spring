package com.mp.ecommerce.rbac.entity;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;

@Entity
@Table(name = "roles", schema = "rbac")
public class RoleEntity {
    @Id
    private String roleId;
    private String name;
    private String description;
    private boolean isActive = true;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    private String createdBy;
    private String updatedBy;
    private String attribute1;
    private String attribute2;
    private String attribute3;
    private String attribute4;
    private String attribute5;
    
    @OneToMany(mappedBy = "role", fetch = FetchType.LAZY)
    private Set<RolePermissionEntity> rolePermissions = new HashSet<>();
    
    @OneToMany(mappedBy = "role", fetch = FetchType.LAZY)
    private Set<UserRoleEntity> userRoles = new HashSet<>();
    
    public RoleEntity() {}
    
    public RoleEntity(String roleId, String name, String description) {
        this.roleId = roleId;
        this.name = name;
        this.description = description;
        this.isActive = true;
        this.createdAt = LocalDateTime.now();
    }
    
    public String getRoleId() { return roleId; }
    public void setRoleId(String roleId) { this.roleId = roleId; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public boolean isActive() { return isActive; }
    public void setActive(boolean isActive) { this.isActive = isActive; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    public LocalDateTime getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(LocalDateTime updatedAt) { this.updatedAt = updatedAt; }
    public String getCreatedBy() { return createdBy; }
    public void setCreatedBy(String createdBy) { this.createdBy = createdBy; }
    public String getUpdatedBy() { return updatedBy; }
    public void setUpdatedBy(String updatedBy) { this.updatedBy = updatedBy; }
    public String getAttribute1() { return attribute1; }
    public void setAttribute1(String attribute1) { this.attribute1 = attribute1; }
    public String getAttribute2() { return attribute2; }
    public void setAttribute2(String attribute2) { this.attribute2 = attribute2; }
    public String getAttribute3() { return attribute3; }
    public void setAttribute3(String attribute3) { this.attribute3 = attribute3; }
    public String getAttribute4() { return attribute4; }
    public void setAttribute4(String attribute4) { this.attribute4 = attribute4; }
    public String getAttribute5() { return attribute5; }
    public void setAttribute5(String attribute5) { this.attribute5 = attribute5; }
    public Set<RolePermissionEntity> getRolePermissions() { return rolePermissions; }
    public void setRolePermissions(Set<RolePermissionEntity> rolePermissions) { this.rolePermissions = rolePermissions; }
    public Set<UserRoleEntity> getUserRoles() { return userRoles; }
    public void setUserRoles(Set<UserRoleEntity> userRoles) { this.userRoles = userRoles; }
    
    @PrePersist
    protected void onCreate() {
        if (createdAt == null) {
            createdAt = LocalDateTime.now();
        }
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
} 