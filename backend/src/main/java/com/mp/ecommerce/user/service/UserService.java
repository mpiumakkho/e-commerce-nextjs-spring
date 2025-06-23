package com.mp.ecommerce.user.service;

import java.util.List;
import java.util.Optional;

import com.mp.ecommerce.user.entity.UserEntity;

public interface UserService {
    List<UserEntity> getAllUsers();
    Optional<UserEntity> getUserById(String id);
    Optional<UserEntity> getUserByUsername(String username);
    Optional<UserEntity> getUserByEmail(String email);
    UserEntity createUser(UserEntity user);
    UserEntity updateUser(String id, UserEntity user);
    void deleteUser(String id);
    boolean existsByUsername(String username);
    boolean existsByEmail(String email);
} 