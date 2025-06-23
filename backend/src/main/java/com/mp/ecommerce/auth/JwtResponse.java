package com.mp.ecommerce.auth;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Set;

import com.mp.ecommerce.user.enums.UserRole;
import com.mp.ecommerce.user.enums.UserStatus;

public class JwtResponse {
    
    private String token;
    private String refreshToken;
    private String type = "Bearer";
    private String userId;
    private String username;
    private String email;
    private String firstName;
    private String lastName;
    private String phone;
    private UserRole legacyRole;
    private UserStatus status;
    private Set<String> rbacRoles;
    private List<String> permissions;
    private LocalDateTime tokenExpiry;
    private LocalDateTime refreshTokenExpiry;
    private Boolean isActive;
    
    public JwtResponse() {}
    
    public JwtResponse(String token, String refreshToken, String userId, String username, 
                      String email, String firstName, String lastName, String phone,
                      UserRole legacyRole, UserStatus status, Set<String> rbacRoles, 
                      List<String> permissions, LocalDateTime tokenExpiry, 
                      LocalDateTime refreshTokenExpiry, Boolean isActive) {
        this.token = token;
        this.refreshToken = refreshToken;
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phone = phone;
        this.legacyRole = legacyRole;
        this.status = status;
        this.rbacRoles = rbacRoles;
        this.permissions = permissions;
        this.tokenExpiry = tokenExpiry;
        this.refreshTokenExpiry = refreshTokenExpiry;
        this.isActive = isActive;
    }
    
    // basic login
    public JwtResponse(String token, String refreshToken, String userId, String username, 
                      String email, String firstName, String lastName, UserRole legacyRole, 
                      Set<String> rbacRoles, LocalDateTime tokenExpiry) {
        this.token = token;
        this.refreshToken = refreshToken;
        this.userId = userId;
        this.username = username;
        this.email = email;
        this.firstName = firstName;
        this.lastName = lastName;
        this.legacyRole = legacyRole;
        this.rbacRoles = rbacRoles;
        this.tokenExpiry = tokenExpiry;
        this.isActive = true;
    }
    
    public String getToken() { return token; }
    public void setToken(String token) { this.token = token; }
    public String getRefreshToken() { return refreshToken; }
    public void setRefreshToken(String refreshToken) { this.refreshToken = refreshToken; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public UserRole getLegacyRole() { return legacyRole; }
    public void setLegacyRole(UserRole legacyRole) { this.legacyRole = legacyRole; }
    public UserStatus getStatus() { return status; }
    public void setStatus(UserStatus status) { this.status = status; }
    public Set<String> getRbacRoles() { return rbacRoles; }
    public void setRbacRoles(Set<String> rbacRoles) { this.rbacRoles = rbacRoles; }
    public List<String> getPermissions() { return permissions; }
    public void setPermissions(List<String> permissions) { this.permissions = permissions; }
    public LocalDateTime getTokenExpiry() { return tokenExpiry; }
    public void setTokenExpiry(LocalDateTime tokenExpiry) { this.tokenExpiry = tokenExpiry; }
    public LocalDateTime getRefreshTokenExpiry() { return refreshTokenExpiry; }
    public void setRefreshTokenExpiry(LocalDateTime refreshTokenExpiry) { this.refreshTokenExpiry = refreshTokenExpiry; }
    public Boolean getIsActive() { return isActive; }
    public void setIsActive(Boolean isActive) { this.isActive = isActive; }
    
    // business method
    public String getFullName() {
        if (firstName != null && lastName != null) {
            return firstName + " " + lastName;
        } else if (firstName != null) {
            return firstName;
        } else if (lastName != null) {
            return lastName;
        }
        return username;
    }
    
    public boolean hasRole(String roleName) {
        if (legacyRole != null && roleName.equals(legacyRole.name())) {
            return true;
        }
        return rbacRoles != null && rbacRoles.contains(roleName);
    }
    
    public boolean hasAnyRole(String... roleNames) {
        for (String roleName : roleNames) {
            if (hasRole(roleName)) {
                return true;
            }
        }
        return false;
    }
    
    public boolean hasPermission(String permissionName) {
        return permissions != null && permissions.contains(permissionName);
    }
    
    public boolean hasAnyPermission(String... permissionNames) {
        for (String permissionName : permissionNames) {
            if (hasPermission(permissionName)) {
                return true;
            }
        }
        return false;
    }
    
    @Override
    public String toString() {
        return "JwtResponse{" +
                "userId='" + userId + '\'' +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", legacyRole=" + legacyRole +
                ", rbacRoles=" + rbacRoles +
                ", permissions=" + permissions +
                ", tokenExpiry=" + tokenExpiry +
                ", isActive=" + isActive +
                '}';
    }
} 