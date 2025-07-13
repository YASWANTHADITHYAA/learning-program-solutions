package com.cognizant.springlearn.controller;

import com.cognizant.springlearn.service.JwtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import jakarta.servlet.http.HttpServletRequest;
import java.util.Base64;
import java.util.StringTokenizer;

@RestController
public class AuthenticationController {

    @Autowired
    private JwtService jwtService;

    @GetMapping("/authenticate")
    public ResponseEntity<?> authenticate(HttpServletRequest request) {
        System.out.println(">>> /authenticate called");

        String authHeader = request.getHeader("Authorization");
        System.out.println(">>> Authorization header: " + authHeader);

        if (authHeader != null && authHeader.startsWith("Basic ")) {
            String base64Credentials = authHeader.substring("Basic ".length()).trim();
            byte[] credDecoded = Base64.getDecoder().decode(base64Credentials);
            String credentials = new String(credDecoded);

            StringTokenizer tokenizer = new StringTokenizer(credentials, ":");
            String username = tokenizer.nextToken();
            String password = tokenizer.nextToken();

            System.out.println(">>> Decoded username: " + username);
            System.out.println(">>> Decoded password: " + password);

            if (username.equals("user") && password.equals("pwd")) {
                String token = jwtService.generateToken(username);
                System.out.println(">>> Generated token: " + token);
                return ResponseEntity.ok("{\"token\":\"" + token + "\"}");
            } else {
                System.out.println(">>> Invalid credentials provided");
            }
        } else {
            System.out.println(">>> Authorization header missing or malformed");
        }

        return ResponseEntity.status(401).body("Invalid credentials");
    }
}
