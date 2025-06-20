package com.mp.ecommerce.auth;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/test")
public class TestController {
    
    private static final Logger logger = LoggerFactory.getLogger(TestController.class);
    
    @GetMapping("/all")
    public String getPublicContent() {
        logger.debug("Public content endpoint accessed");
        return "Public Content - Accessible by everyone. Timestamp: " + System.currentTimeMillis();
    }

    @GetMapping("/user")
    @PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
    public String getUserContent() {
        logger.debug("User content endpoint accessed");
        return "User Content - Accessible by authenticated users with USER or ADMIN role. Timestamp: " + System.currentTimeMillis();
    }

    @GetMapping("/admin")
    @PreAuthorize("hasRole('ADMIN')")
    public String getAdminContent() {
        logger.debug("Admin content endpoint accessed");
        return "Admin Content - Accessible only by users with ADMIN role. Timestamp: " + System.currentTimeMillis();
    }
} 