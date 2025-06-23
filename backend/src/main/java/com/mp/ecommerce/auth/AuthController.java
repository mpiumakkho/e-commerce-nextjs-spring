package com.mp.ecommerce.auth;

import java.time.LocalDateTime;
import java.util.Set;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mp.ecommerce.common.security.SecurityUser;
import com.mp.ecommerce.common.util.JwtUtils;
import com.mp.ecommerce.common.validation.AuthValidator;
import com.mp.ecommerce.user.enums.UserRole;

@RestController
@RequestMapping("/api/auth")
public class AuthController {
    
    private static final Logger logger = LoggerFactory.getLogger(AuthController.class);
    
    @Autowired
    AuthenticationManager authenticationManager;

    @Autowired
    JwtUtils jwtUtils;

    @PostMapping("/login")
    public ResponseEntity<?> authenticateUser(@RequestBody LoginRequest loginRequest) {
        AuthValidator.validateLoginRequest(loginRequest.getUsername(), loginRequest.getPassword());
        
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.getUsername(), loginRequest.getPassword()));

        SecurityContextHolder.getContext().setAuthentication(authentication);
        String jwt = jwtUtils.generateJwtToken(authentication);

        SecurityUser userDetails = (SecurityUser) authentication.getPrincipal();
        Set<String> roles = userDetails.getAuthorities().stream()
                .map(item -> item.getAuthority().replace("ROLE_", ""))
                .collect(Collectors.toSet());

        return ResponseEntity.ok(new JwtResponse(jwt, null, userDetails.getId(),
                userDetails.getUsername(), userDetails.getEmail(), 
                null, null, null, roles, LocalDateTime.now().plusHours(1)));
    }

    // mock auth endpoint
    @PostMapping("/mock-login")
    public ResponseEntity<?> authenticateDevelopmentUser(@RequestBody LoginRequest loginRequest) {
        logger.debug("Development authentication requested for user: {}", loginRequest.getUsername());
        
        AuthValidator.validateLoginRequest(loginRequest.getUsername(), loginRequest.getPassword());
        
        // check creds
        if ("mock-admin".equals(loginRequest.getUsername()) && "mock-password".equals(loginRequest.getPassword())) {
            logger.debug("Development credentials validated successfully");
            
            // make token
            String developmentToken = "dev-session-" + System.currentTimeMillis();
            
            // create user
            JwtResponse developmentResponse = new JwtResponse(
                developmentToken, null, "dev-001", "mock-admin", 
                "mock-admin@example.com", "Mock", "Admin", 
                UserRole.ADMIN, Set.of("ADMIN"), LocalDateTime.now().plusHours(1));
            
            logger.debug("Development authentication successful");
            return ResponseEntity.ok(developmentResponse);
        }
        
        logger.warn("Invalid development credentials provided");
        return ResponseEntity.badRequest().body("Invalid development credentials. Use username: 'mock-admin', password: 'mock-password'");
    }

    @GetMapping("/profile")
    public ResponseEntity<?> getUserProfile() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication == null || !authentication.isAuthenticated() || !(authentication.getPrincipal() instanceof SecurityUser)) {
            return ResponseEntity.status(401).body("Unauthorized: No user is authenticated");
        }
        SecurityUser userDetails = (SecurityUser) authentication.getPrincipal();
        return ResponseEntity.ok(userDetails);
    }
} 