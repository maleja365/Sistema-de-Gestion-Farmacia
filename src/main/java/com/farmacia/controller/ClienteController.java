package com.farmacia.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cliente")
public class ClienteController {

    @GetMapping("/inicio")
    public String inicio(Model model, Authentication auth) {
        model.addAttribute("usuario", auth.getName());
        return "dashboard-cliente";
    }
}