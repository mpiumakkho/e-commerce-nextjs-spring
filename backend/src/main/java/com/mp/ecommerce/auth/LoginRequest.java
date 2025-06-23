package com.mp.ecommerce.auth;

public class LoginRequest {
    
    private String username;
    private String password;
    private Boolean rememberMe = false;
    
    public LoginRequest() {}
    
    public LoginRequest(String username, String password) {
        this.username = username;
        this.password = password;
    }
    
    public LoginRequest(String username, String password, Boolean rememberMe) {
        this.username = username;
        this.password = password;
        this.rememberMe = rememberMe;
    }
    
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public Boolean getRememberMe() { return rememberMe; }
    public void setRememberMe(Boolean rememberMe) { this.rememberMe = rememberMe; }
    
    @Override
    public String toString() {
        return "LoginRequest{" +
                "username='" + username + '\'' +
                ", rememberMe=" + rememberMe +
                '}';
    }
} 