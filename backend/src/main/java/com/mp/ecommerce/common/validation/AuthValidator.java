package com.mp.ecommerce.common.validation;

import com.mp.ecommerce.common.exception.ValidationException;

public class AuthValidator {
    
    public static void validateLoginRequest(String username, String password) {
        if (username == null || username.trim().isEmpty()) {
            throw new ValidationException("Username is required");
        }
        if (username.length() < 3 || username.length() > 50) {
            throw new ValidationException("Username must be between 3 and 50 characters");
        }
        if (password == null || password.trim().isEmpty()) {
            throw new ValidationException("Password is required");
        }
        if (password.length() < 6 || password.length() > 120) {
            throw new ValidationException("Password must be between 6 and 120 characters");
        }
    }
    
    public static void validateRequired(String value, String fieldName) {
        if (value == null || value.trim().isEmpty()) {
            throw new ValidationException(fieldName + " is required");
        }
    }
} 