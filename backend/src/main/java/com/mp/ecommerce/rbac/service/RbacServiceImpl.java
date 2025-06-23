package com.mp.ecommerce.rbac.service;

import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mp.ecommerce.rbac.entity.RoleEntity;
import com.mp.ecommerce.rbac.entity.UserRoleEntity;
import com.mp.ecommerce.rbac.repository.RoleRepository;
import com.mp.ecommerce.rbac.repository.UserRoleRepository;
import com.mp.ecommerce.user.entity.UserEntity;

@Service
@Transactional
public class RbacServiceImpl implements RbacService {

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private UserRoleRepository userRoleRepository;

    // role management
    @Override
    public List<RoleEntity> getAllRoles() {
        return roleRepository.findAll();
    }

    @Override
    public Optional<RoleEntity> getRoleById(String roleId) {
        return roleRepository.findById(roleId);
    }

    @Override
    public Optional<RoleEntity> getRoleByName(String roleName) {
        return roleRepository.findByName(roleName);
    }

    @Override
    public RoleEntity createRole(RoleEntity role) {
        return roleRepository.save(role);
    }

    @Override
    public RoleEntity updateRole(RoleEntity role) {
        return roleRepository.save(role);
    }

    @Override
    public void deleteRole(String roleId) {
        roleRepository.deleteById(roleId);
    }

    // user role management
    @Override
    public List<UserRoleEntity> getUserRoles(String userId) {
        return userRoleRepository.findByUserId(userId);
    }

    @Override
    public Set<String> getUserRoleNames(String userId) {
        return userRoleRepository.findByUserId(userId)
            .stream()
            .map(ur -> ur.getRole().getName())
            .collect(Collectors.toSet());
    }

    @Override
    public UserRoleEntity assignRoleToUser(String userId, String roleId, String assignedBy) {
        UserRoleEntity userRole = new UserRoleEntity();
        userRole.setUserId(userId);
        userRole.setRoleId(roleId);
        userRole.setAssignedBy(assignedBy);
        return userRoleRepository.save(userRole);
    }

    @Override
    public void removeRoleFromUser(String userId, String roleId) {
        userRoleRepository.deleteByUserIdAndRoleId(userId, roleId);
    }

    @Override
    public void removeAllRolesFromUser(String userId) {
        userRoleRepository.deleteByUserId(userId);
    }

    // authorization method
    @Override
    public boolean hasRole(String userId, String roleName) {
        return getUserRoleNames(userId).contains(roleName);
    }

    @Override
    public boolean hasAnyRole(String userId, String... roleNames) {
        Set<String> userRoles = getUserRoleNames(userId);
        for (String roleName : roleNames) {
            if (userRoles.contains(roleName)) {
                return true;
            }
        }
        return false;
    }

    // check both old enum role and new RBAC role (hybrid)
    @Override
    public boolean hasRoleHybrid(UserEntity user, String roleName) {
        // check old enum role first
        if (user.getRole() != null && roleName.equals(user.getRole().name())) {
            return true;
        }
        
        // check new RBAC roles
        return hasRole(user.getUserId(), roleName);
    }

    @Override
    public boolean hasAnyRoleHybrid(UserEntity user, String... roleNames) {
        // check old enum role first
        if (user.getRole() != null) {
            for (String roleName : roleNames) {
                if (roleName.equals(user.getRole().name())) {
                    return true;
                }
            }
        }
        
        // check new RBAC role
        return hasAnyRole(user.getUserId(), roleNames);
    }

    // migration method
    @Override
    public void migrateUserRoleToRbac(String userId, String roleName, String assignedBy) {
        Optional<RoleEntity> role = getRoleByName(roleName);
        if (role.isPresent()) {
            // check if user already has this role
            List<UserRoleEntity> existingRoles = userRoleRepository.findByUserId(userId);
            boolean hasRole = existingRoles.stream()
                .anyMatch(ur -> ur.getRole() != null && roleName.equals(ur.getRole().getName()));
            
            if (!hasRole) {
                assignRoleToUser(userId, role.get().getRoleId(), assignedBy);
            }
        }
    }
} 