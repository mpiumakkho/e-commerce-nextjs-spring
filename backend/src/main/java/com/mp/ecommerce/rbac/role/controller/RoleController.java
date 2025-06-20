package com.mp.ecommerce.rbac.role.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mp.ecommerce.rbac.entity.RoleEntity;
import com.mp.ecommerce.rbac.role.dto.RoleDTO;
import com.mp.ecommerce.rbac.role.service.RoleService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/roles")
public class RoleController {
    
    @Autowired
    private RoleService roleService;
    
    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<RoleDTO>> getAllRoles() {
        List<RoleEntity> roles = roleService.getAllRoles();
        List<RoleDTO> roleDTOs = roles.stream()
                .map(roleService::convertToDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(roleDTOs);
    }
    
    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<RoleDTO> getRoleById(@PathVariable String id) {
        return roleService.getRoleById(id)
                .map(role -> ResponseEntity.ok(roleService.convertToDTO(role)))
                .orElse(ResponseEntity.notFound().build());
    }
    
    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<RoleDTO> createRole(@Valid @RequestBody RoleDTO roleDTO) {
        RoleEntity createdRole = roleService.createRole(roleDTO);
        return ResponseEntity.ok(roleService.convertToDTO(createdRole));
    }
    
    @PutMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<RoleDTO> updateRole(@PathVariable String id, @Valid @RequestBody RoleDTO roleDTO) {
        RoleEntity updatedRole = roleService.updateRole(id, roleDTO);
        return ResponseEntity.ok(roleService.convertToDTO(updatedRole));
    }
    
    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Void> deleteRole(@PathVariable String id) {
        roleService.deleteRole(id);
        return ResponseEntity.noContent().build();
    }
} 