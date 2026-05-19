package com.farmacia;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class FarmaciaApplication {

    public static void main(String[] args) {
        // Imprime el hash correcto en consola
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        System.out.println("HASH: " + encoder.encode("admin123"));
        
        SpringApplication.run(FarmaciaApplication.class, args);
    }
}