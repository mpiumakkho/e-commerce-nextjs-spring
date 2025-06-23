package com.mp.ecommerce.rbac.role.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mp.ecommerce.rbac.entity.RoleEntity;
import com.mp.ecommerce.rbac.repository.RoleRepository;

@Service
@Transactional
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
    public RoleEntity createRole(RoleEntity role) {
        return roleRepository.save(role);
    }
    
    @Override
    public RoleEntity updateRole(String id, RoleEntity role) {
        role.setRoleId(id);
        return roleRepository.save(role);
    }
    
    @Override
    public void deleteRole(String id) {
        roleRepository.deleteById(id);
    }
    
    @Override
    public boolean existsByName(String name) {
        return roleRepository.existsByName(name);
    }
} 