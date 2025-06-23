package com.mp.ecommerce.rbac.controller;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mp.ecommerce.rbac.entity.RoleEntity;
import com.mp.ecommerce.rbac.entity.UserRoleEntity;
import com.mp.ecommerce.rbac.service.RbacService;

@RestController
@RequestMapping("/api/rbac")
@CrossOrigin(origins = "*", maxAge = 3600)
public class RbacController {

    @Autowired
    private RbacService rbacService;

    // role management
    @GetMapping("/roles")
    @PreAuthorize("hasRole('ADMIN') or hasRole('SUPER_ADMIN')")
    public ResponseEntity<List<RoleEntity>> getAllRoles() {
        return ResponseEntity.ok(rbacService.getAllRoles());
    }

    @GetMapping("/roles/{roleId}")
    @PreAuthorize("hasRole('ADMIN') or hasRole('SUPER_ADMIN')")
    public ResponseEntity<RoleEntity> getRoleById(@PathVariable String roleId) {
        return rbacService.getRoleById(roleId)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping("/roles")
    @PreAuthorize("hasRole('SUPER_ADMIN')")
    public ResponseEntity<RoleEntity> createRole(@RequestBody RoleEntity role) {
        return ResponseEntity.ok(rbacService.createRole(role));
    }

    @PutMapping("/roles/{roleId}")
    @PreAuthorize("hasRole('SUPER_ADMIN')")
    public ResponseEntity<RoleEntity> updateRole(@PathVariable String roleId, @RequestBody RoleEntity role) {
        role.setRoleId(roleId);
        return ResponseEntity.ok(rbacService.updateRole(role));
    }

    @DeleteMapping("/roles/{roleId}")
    @PreAuthorize("hasRole('SUPER_ADMIN')")
    public ResponseEntity<Void> deleteRole(@PathVariable String roleId) {
        rbacService.deleteRole(roleId);
        return ResponseEntity.ok().build();
    }

    // user role management
    @GetMapping("/users/{userId}/roles")
    @PreAuthorize("hasRole('ADMIN') or hasRole('SUPER_ADMIN') or #userId == authentication.principal.id")
    public ResponseEntity<List<UserRoleEntity>> getUserRoles(@PathVariable String userId) {
        return ResponseEntity.ok(rbacService.getUserRoles(userId));
    }

    @GetMapping("/users/{userId}/role-names")
    @PreAuthorize("hasRole('ADMIN') or hasRole('SUPER_ADMIN') or #userId == authentication.principal.id")
    public ResponseEntity<Set<String>> getUserRoleNames(@PathVariable String userId) {
        return ResponseEntity.ok(rbacService.getUserRoleNames(userId));
    }

    @PostMapping("/users/{userId}/roles/{roleId}")
    @PreAuthorize("hasRole('ADMIN') or hasRole('SUPER_ADMIN')")
    public ResponseEntity<UserRoleEntity> assignRoleToUser(
            @PathVariable String userId,
            @PathVariable String roleId,
            @RequestParam(defaultValue = "system") String assignedBy) {
        return ResponseEntity.ok(rbacService.assignRoleToUser(userId, roleId, assignedBy));
    }

    @DeleteMapping("/users/{userId}/roles/{roleId}")
    @PreAuthorize("hasRole('ADMIN') or hasRole('SUPER_ADMIN')")
    public ResponseEntity<Void> removeRoleFromUser(@PathVariable String userId, @PathVariable String roleId) {
        rbacService.removeRoleFromUser(userId, roleId);
        return ResponseEntity.ok().build();
    }

    @DeleteMapping("/users/{userId}/roles")
    @PreAuthorize("hasRole('ADMIN') or hasRole('SUPER_ADMIN')")
    public ResponseEntity<Void> removeAllRolesFromUser(@PathVariable String userId) {
        rbacService.removeAllRolesFromUser(userId);
        return ResponseEntity.ok().build();
    }

    // authorization check endpoints
    @GetMapping("/users/{userId}/has-role/{roleName}")
    @PreAuthorize("hasRole('ADMIN') or hasRole('SUPER_ADMIN') or #userId == authentication.principal.id")
    public ResponseEntity<Boolean> hasRole(@PathVariable String userId, @PathVariable String roleName) {
        return ResponseEntity.ok(rbacService.hasRole(userId, roleName));
    }

    // migration endpoints
    @PostMapping("/migrate/user/{userId}/role/{roleName}")
    @PreAuthorize("hasRole('SUPER_ADMIN')")
    public ResponseEntity<Void> migrateUserRoleToRbac(
            @PathVariable String userId,
            @PathVariable String roleName,
            @RequestParam(defaultValue = "system") String assignedBy) {
        rbacService.migrateUserRoleToRbac(userId, roleName, assignedBy);
        return ResponseEntity.ok().build();
    }
} 