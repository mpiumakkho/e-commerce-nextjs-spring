package com.mp.ecommerce.rbac.role.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mp.ecommerce.common.exception.CustomException;
import com.mp.ecommerce.rbac.entity.RoleEntity;
import com.mp.ecommerce.rbac.repository.RoleRepository;
import com.mp.ecommerce.rbac.role.dto.RoleDTO;

@Service
public class RoleServiceImpl implements RoleService {
    
    @Autowired
    private RoleRepository roleRepository;
    
    @Override
    public List<RoleEntity> getAllRoles() {
        return roleRepository.findAll();
    }
    
    @Override
    public Optional<RoleEntity> getRoleById(String id) {
        return roleRepository.findById(id);
    }
    
    @Override
    public Optional<RoleEntity> getRoleByName(String name) {
        return roleRepository.findByName(name);
    }
    
    @Override
    public RoleEntity createRole(RoleDTO roleDTO) {
        if (existsByName(roleDTO.getName())) {
            throw new CustomException("Role name already exists", "ROLE_NAME_EXISTS");
        }
        
        RoleEntity role = convertToEntity(roleDTO);
        role.setId(UUID.randomUUID().toString());
        role.setCreatedAt(LocalDateTime.now());
        role.setUpdatedAt(LocalDateTime.now());
        
        return roleRepository.save(role);
    }
    
    @Override
    public RoleEntity updateRole(String id, RoleDTO roleDTO) {
        RoleEntity existingRole = roleRepository.findById(id)
                .orElseThrow(() -> new CustomException("Role not found", "ROLE_NOT_FOUND"));
        
        // check name uniqueness
        if (!existingRole.getName().equals(roleDTO.getName()) && 
            existsByName(roleDTO.getName())) {
            throw new CustomException("Role name already exists", "ROLE_NAME_EXISTS");
        }
        
        existingRole.setName(roleDTO.getName());
        existingRole.setDescription(roleDTO.getDescription());
        existingRole.setActive(roleDTO.isActive());
        existingRole.setUpdatedAt(LocalDateTime.now());
        
        return roleRepository.save(existingRole);
    }
    
    @Override
    public void deleteRole(String id) {
        if (!roleRepository.existsById(id)) {
            throw new CustomException("Role not found", "ROLE_NOT_FOUND");
        }
        roleRepository.deleteById(id);
    }
    
    @Override
    public boolean existsByName(String name) {
        return roleRepository.existsByName(name);
    }
    
    @Override
    public RoleDTO convertToDTO(RoleEntity role) {
        RoleDTO dto = new RoleDTO();
        dto.setId(role.getId());
        dto.setName(role.getName());
        dto.setDescription(role.getDescription());
        dto.setActive(role.isActive());
        dto.setCreatedAt(role.getCreatedAt());
        dto.setUpdatedAt(role.getUpdatedAt());
        return dto;
    }
    
    @Override
    public RoleEntity convertToEntity(RoleDTO roleDTO) {
        RoleEntity role = new RoleEntity();
        role.setName(roleDTO.getName());
        role.setDescription(roleDTO.getDescription());
        role.setActive(roleDTO.isActive());
        return role;
    }
} 