package com.app;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "🚀 Spring Boot CI/CD Pipeline is Working Successfully!";
    }

    @GetMapping("/health")
    public String health() {
        return "OK";
    }
}
