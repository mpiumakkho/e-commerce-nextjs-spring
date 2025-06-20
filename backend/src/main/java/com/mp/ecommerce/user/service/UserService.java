package com.mp.ecommerce.user.service;

import java.util.List;
import java.util.Optional;

import com.mp.ecommerce.user.dto.UserDTO;
import com.mp.ecommerce.user.entity.UserEntity;

public interface UserService {
    
    List<UserEntity> getAllUsers();
    
    Optional<UserEntity> getUserById(String id);
    
    Optional<UserEntity> getUserByUsername(String username);
    
    Optional<UserEntity> getUserByEmail(String email);
    
    UserEntity createUser(UserDTO userDTO);
    
    UserEntity updateUser(String id, UserDTO userDTO);
    
    void deleteUser(String id);
    
    boolean existsByUsername(String username);
    
    boolean existsByEmail(String email);
    
    UserDTO convertToDTO(UserEntity user);
    
    UserEntity convertToEntity(UserDTO userDTO);
} 