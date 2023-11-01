package com.example.service.impl;

import com.example.common.MyPageInfo;
import com.example.common.mapper.HouseMapper;
import com.example.entity.nage;
import com.example.entity.airlevel;
import com.example.service.HouseService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Service
public class HouseServiceImpl implements HouseService {
    @Autowired
    private HouseMapper houseMapper;
    @Override
    public MyPageInfo list(HttpServletRequest request) {
        String pageNumStr = request.getParameter("pageNum");
        String pageSizeStr = request.getParameter("pageSize");
        int pageNum=1;
        int pageSize=10;  //每页的大小
        try {
            pageNum=Integer.valueOf(pageNumStr); //当前页面
        }catch (Exception e){}
        try {
            pageSize=Integer.valueOf(pageSizeStr); //当前页面
        }catch (Exception e){}

        //分页插件
        Page<Object> page = PageHelper.startPage(pageNum, pageSize);
        houseMapper.list();
        PageInfo<Object> pageInfo = page.toPageInfo();
        MyPageInfo myPageInfo = new MyPageInfo(pageNum,pageSize,
                pageInfo.getNavigateLastPage(),pageInfo.getTotal(),
                pageInfo.getList());


        return myPageInfo;
    }

    @Override
    public MyPageInfo list_bj(HttpServletRequest request) {
        String pageNumStr = request.getParameter("pageNum");
        String pageSizeStr = request.getParameter("pageSize");
        int pageNum=1;
        int pageSize=10;  //每页的大小
        try {
            pageNum=Integer.valueOf(pageNumStr); //当前页面
        }catch (Exception e){}
        try {
            pageSize=Integer.valueOf(pageSizeStr); //当前页面
        }catch (Exception e){}

        //分页插件
        Page<Object> page = PageHelper.startPage(pageNum, pageSize);
        houseMapper.list_bj();
        PageInfo<Object> pageInfo = page.toPageInfo();
        MyPageInfo myPageInfo = new MyPageInfo(pageNum,pageSize,
                pageInfo.getNavigateLastPage(),pageInfo.getTotal(),
                pageInfo.getList());

        return myPageInfo;
    }

    @Override
    public MyPageInfo list_heb(HttpServletRequest request) {
        String pageNumStr = request.getParameter("pageNum");
        String pageSizeStr = request.getParameter("pageSize");
        int pageNum=1;
        int pageSize=10;  //每页的大小
        try {
            pageNum=Integer.valueOf(pageNumStr); //当前页面
        }catch (Exception e){}
        try {
            pageSize=Integer.valueOf(pageSizeStr); //当前页面
        }catch (Exception e){}

        //分页插件
        Page<Object> page = PageHelper.startPage(pageNum, pageSize);
        houseMapper.list_heb();
        PageInfo<Object> pageInfo = page.toPageInfo();
        MyPageInfo myPageInfo = new MyPageInfo(pageNum,pageSize,
                pageInfo.getNavigateLastPage(),pageInfo.getTotal(),
                pageInfo.getList());

        return myPageInfo;
    }

    @Override
    public MyPageInfo list_xz(HttpServletRequest request) {
        String pageNumStr = request.getParameter("pageNum");
        String pageSizeStr = request.getParameter("pageSize");
        int pageNum=1;
        int pageSize=10;  //每页的大小
        try {
            pageNum=Integer.valueOf(pageNumStr); //当前页面
        }catch (Exception e){}
        try {
            pageSize=Integer.valueOf(pageSizeStr); //当前页面
        }catch (Exception e){}

        //分页插件
        Page<Object> page = PageHelper.startPage(pageNum, pageSize);
        houseMapper.list_xz();
        PageInfo<Object> pageInfo = page.toPageInfo();
        MyPageInfo myPageInfo = new MyPageInfo(pageNum,pageSize,
                pageInfo.getNavigateLastPage(),pageInfo.getTotal(),
                pageInfo.getList());

        return myPageInfo;
    }

    @Override
    public MyPageInfo list_tlf(HttpServletRequest request) {
        String pageNumStr = request.getParameter("pageNum");
        String pageSizeStr = request.getParameter("pageSize");
        int pageNum=1;
        int pageSize=10;  //每页的大小
        try {
            pageNum=Integer.valueOf(pageNumStr); //当前页面
        }catch (Exception e){}
        try {
            pageSize=Integer.valueOf(pageSizeStr); //当前页面
        }catch (Exception e){}

        //分页插件
        Page<Object> page = PageHelper.startPage(pageNum, pageSize);
        houseMapper.list_tlf();
        PageInfo<Object> pageInfo = page.toPageInfo();
        MyPageInfo myPageInfo = new MyPageInfo(pageNum,pageSize,
                pageInfo.getNavigateLastPage(),pageInfo.getTotal(),
                pageInfo.getList());

        return myPageInfo;
    }

    @Override
    public List<nage> list1(){
        return houseMapper.list1();
    }
    @Override
    public List<nage> list2(){
        return houseMapper.list2();
    }
    @Override
    public List<nage> list3(){ return houseMapper.list3();}
    @Override
    public List<nage> list4(){ return houseMapper.list4();}
    @Override
    public List<nage> list5(){ return houseMapper.list5();}
    @Override
    public List<airlevel> list_air(){return houseMapper.list_air();}
    @Override
    public List<nage> list_line(){return houseMapper.list_line();}
}
