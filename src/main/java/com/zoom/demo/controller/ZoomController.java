package com.zoom.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ZoomController {
	@GetMapping("/zoom")
	
    public String getZoom(Model model) {

        return "zoom";
    }
}