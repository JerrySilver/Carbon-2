package com.example.controller;

import com.example.entity.Admin;
import com.example.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/doLogin")
    @ResponseBody
    public String doLogin(Admin admin){
        return adminService.doLogin(admin);
    }
    @RequestMapping("/info")
    public String info(Admin admin){
        return "admin/info";
    }

}
