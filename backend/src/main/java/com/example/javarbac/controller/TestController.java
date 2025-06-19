package com.example.javarbac.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/public")
public class TestController {

    private static final Logger LOG = LoggerFactory.getLogger(TestController.class);

    @GetMapping("/hello")
    public String hello(HttpServletRequest request) {
        String clientIp = request.getRemoteAddr();
        String userAgent = request.getHeader("User-Agent");
        String origin = request.getHeader("Origin");

        LOG.info("=== API Call Received ===");
        LOG.info("Endpoint: /api/public/hello");
        LOG.info("Client IP: {}", clientIp);
        LOG.info("User-Agent: {}", userAgent);
        LOG.info("Origin: {}", origin);
        LOG.info("Method: {}", request.getMethod());
        LOG.info("URL: {}", request.getRequestURL());
        LOG.info("=========================");
        
        return "Hello from Spring Boot with PostgreSQL!";
    }
} 