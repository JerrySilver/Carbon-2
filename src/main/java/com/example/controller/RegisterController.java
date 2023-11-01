package com.example.controller;

import com.example.entity.Register;
import com.example.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    private RegisterService registerService;

    @RequestMapping("/doRegister")
    @ResponseBody
    public String doRegister(Register register){return registerService.doRegister(register);}

    @RequestMapping("/login")
    public String login(Register register){return "admin/login";}
}
