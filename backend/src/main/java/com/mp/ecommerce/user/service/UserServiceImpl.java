package com.mp.ecommerce.user.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.mp.ecommerce.common.exception.CustomException;
import com.mp.ecommerce.user.dto.UserDTO;
import com.mp.ecommerce.user.entity.UserEntity;
import com.mp.ecommerce.user.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private PasswordEncoder passwordEncoder;
    
    @Override
    public List<UserEntity> getAllUsers() {
        return userRepository.findAll();
    }
    
    @Override
    public Optional<UserEntity> getUserById(String id) {
        return userRepository.findById(id);
    }
    
    @Override
    public Optional<UserEntity> getUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    
    @Override
    public Optional<UserEntity> getUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    
    @Override
    public UserEntity createUser(UserDTO userDTO) {
        if (existsByUsername(userDTO.getUsername())) {
            throw new CustomException("Username already exists", "USERNAME_EXISTS");
        }
        
        if (existsByEmail(userDTO.getEmail())) {
            throw new CustomException("Email already exists", "EMAIL_EXISTS");
        }
        
        UserEntity user = convertToEntity(userDTO);
        user.setId(UUID.randomUUID().toString());
        user.setCreatedAt(LocalDateTime.now());
        user.setUpdatedAt(LocalDateTime.now());
        
        return userRepository.save(user);
    }
    
    @Override
    public UserEntity updateUser(String id, UserDTO userDTO) {
        UserEntity existingUser = userRepository.findById(id)
                .orElseThrow(() -> new CustomException("User not found", "USER_NOT_FOUND"));
        
        // check username unique
        if (!existingUser.getUsername().equals(userDTO.getUsername()) && 
            existsByUsername(userDTO.getUsername())) {
            throw new CustomException("Username already exists", "USERNAME_EXISTS");
        }
        
        // check email unique
        if (!existingUser.getEmail().equals(userDTO.getEmail()) && 
            existsByEmail(userDTO.getEmail())) {
            throw new CustomException("Email already exists", "EMAIL_EXISTS");
        }
        
        existingUser.setUsername(userDTO.getUsername());
        existingUser.setEmail(userDTO.getEmail());
        existingUser.setFirstName(userDTO.getFirstName());
        existingUser.setLastName(userDTO.getLastName());
        existingUser.setPhoneNumber(userDTO.getPhoneNumber());
        existingUser.setAddress(userDTO.getAddress());
        existingUser.setRole(userDTO.getRole());
        existingUser.setActive(userDTO.isActive());
        existingUser.setUpdatedAt(LocalDateTime.now());
        
        return userRepository.save(existingUser);
    }
    
    @Override
    public void deleteUser(String id) {
        if (!userRepository.existsById(id)) {
            throw new CustomException("User not found", "USER_NOT_FOUND");
        }
        userRepository.deleteById(id);
    }
    
    @Override
    public boolean existsByUsername(String username) {
        return userRepository.existsByUsername(username);
    }
    
    @Override
    public boolean existsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }
    
    @Override
    public UserDTO convertToDTO(UserEntity user) {
        UserDTO dto = new UserDTO();
        dto.setId(user.getId());
        dto.setUsername(user.getUsername());
        dto.setEmail(user.getEmail());
        dto.setFirstName(user.getFirstName());
        dto.setLastName(user.getLastName());
        dto.setPhoneNumber(user.getPhoneNumber());
        dto.setAddress(user.getAddress());
        dto.setRole(user.getRole());
        dto.setActive(user.isActive());
        dto.setCreatedAt(user.getCreatedAt());
        dto.setUpdatedAt(user.getUpdatedAt());
        return dto;
    }
    
    @Override
    public UserEntity convertToEntity(UserDTO userDTO) {
        UserEntity user = new UserEntity();
        user.setUsername(userDTO.getUsername());
        user.setEmail(userDTO.getEmail());
        user.setFirstName(userDTO.getFirstName());
        user.setLastName(userDTO.getLastName());
        user.setPhoneNumber(userDTO.getPhoneNumber());
        user.setAddress(userDTO.getAddress());
        user.setRole(userDTO.getRole());
        user.setActive(userDTO.isActive());
        return user;
    }
} 