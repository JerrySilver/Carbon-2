package com.example.entity;

import lombok.Data;

import java.util.Date;

@Data
public class Admin {
    private int id;
    private String userName;
    private String password;
    private Date lastLogin;
}
