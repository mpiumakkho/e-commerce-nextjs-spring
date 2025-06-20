package com.mp.ecommerce.user.controller;

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

import com.mp.ecommerce.user.dto.UserDTO;
import com.mp.ecommerce.user.entity.UserEntity;
import com.mp.ecommerce.user.service.UserService;

import jakarta.validation.Valid;

@RestController
@RequestMapping("/api/users")
public class UserController {
    
    @Autowired
    private UserService userService;
    
    @GetMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<List<UserDTO>> getAllUsers() {
        List<UserEntity> users = userService.getAllUsers();
        List<UserDTO> userDTOs = users.stream()
                .map(userService::convertToDTO)
                .collect(Collectors.toList());
        return ResponseEntity.ok(userDTOs);
    }
    
    @GetMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN') or #id == authentication.principal.id")
    public ResponseEntity<UserDTO> getUserById(@PathVariable String id) {
        return userService.getUserById(id)
                .map(user -> ResponseEntity.ok(userService.convertToDTO(user)))
                .orElse(ResponseEntity.notFound().build());
    }
    
    @PostMapping
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<UserDTO> createUser(@Valid @RequestBody UserDTO userDTO) {
        UserEntity createdUser = userService.createUser(userDTO);
        return ResponseEntity.ok(userService.convertToDTO(createdUser));
    }
    
    @PutMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN') or #id == authentication.principal.id")
    public ResponseEntity<UserDTO> updateUser(@PathVariable String id, @Valid @RequestBody UserDTO userDTO) {
        UserEntity updatedUser = userService.updateUser(id, userDTO);
        return ResponseEntity.ok(userService.convertToDTO(updatedUser));
    }
    
    @DeleteMapping("/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    public ResponseEntity<Void> deleteUser(@PathVariable String id) {
        userService.deleteUser(id);
        return ResponseEntity.noContent().build();
    }
} 