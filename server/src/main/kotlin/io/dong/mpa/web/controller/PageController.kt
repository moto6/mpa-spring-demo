package io.dong.mpa.web.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping

@Controller
class PageController {
//    @GetMapping
//    public String landing() {
//        return "index";
//    }

    @GetMapping("/login")
    fun login(): String {
        return "login"
    }
}