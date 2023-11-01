package com.example.controller;

import com.example.common.MyPageInfo;
import com.example.entity.Admin;
import com.example.service.AdminService;
import com.example.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/admin/fang")
public class AdminFangInfoController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private HouseService houseService;

    @RequestMapping("/list")
    public ModelAndView  list(Admin admin, ModelAndView mv, HttpServletRequest request){
        MyPageInfo myPageInfo =houseService.list(request);
        mv.addObject("pageInfo",myPageInfo);
        mv.setViewName("fang/list");
        return mv;
    }

    @RequestMapping("/list_bj")
    public ModelAndView  list_bj(Admin admin, ModelAndView mv, HttpServletRequest request){
        MyPageInfo myPageInfo =houseService.list_bj(request);
        mv.addObject("pageInfo",myPageInfo);
        mv.setViewName("fang/list_bj");
        return mv;
    }

    @RequestMapping("/list_heb")
    public ModelAndView  list_heb(Admin admin, ModelAndView mv, HttpServletRequest request){
        MyPageInfo myPageInfo =houseService.list_heb(request);
        mv.addObject("pageInfo",myPageInfo);
        mv.setViewName("fang/list_heb");
        return mv;
    }

    @RequestMapping("/list_xz")
    public ModelAndView  list_xz(Admin admin, ModelAndView mv, HttpServletRequest request){
        MyPageInfo myPageInfo =houseService.list_xz(request);
        mv.addObject("pageInfo",myPageInfo);
        mv.setViewName("fang/list_xz");
        return mv;
    }

    @RequestMapping("/list_tlf")
    public ModelAndView  list_tlf(Admin admin, ModelAndView mv, HttpServletRequest request){
        MyPageInfo myPageInfo =houseService.list_tlf(request);
        mv.addObject("pageInfo",myPageInfo);
        mv.setViewName("fang/list_tlf");
        return mv;
    }


}
