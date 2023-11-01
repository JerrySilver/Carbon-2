package com.example.service.impl;

import com.example.common.mapper.AdminMapper;
import com.example.entity.Admin;
import com.example.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public String doLogin(Admin admin) {
//        根据用户名查询记录
        Admin dbAdmin=adminMapper.findByUserName(admin.getUserName());
        if (dbAdmin!=null){
            if(dbAdmin.getPassword().equals(admin.getPassword())){
                return "ok";
            }else
                return "password-error";
        }
        return "username-error";
    }
}
