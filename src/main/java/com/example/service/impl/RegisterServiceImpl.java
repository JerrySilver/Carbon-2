package com.example.service.impl;

import com.example.common.mapper.RegisterMapper;
import com.example.entity.Register;
import com.example.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class RegisterServiceImpl implements RegisterService {
    @Autowired
    private RegisterMapper registerMapper;

    @Override
    public String doRegister(Register register) {
        List<Register> existingUsers = registerMapper.findByUserName(register.getUser_name());
        if(!existingUsers.isEmpty()){
            return "User existed";
        }else {
            int affectedRows = registerMapper.saveUser(register.getUser_name(), register.getPassword(), register.getFirstname(), register.getLastname());
            if (affectedRows > 0) {
//                System.out.println("yes");
                return "ok";
            }else {
                System.out.println("no");
                return "Error in registration";
            }
        }
    }
}

