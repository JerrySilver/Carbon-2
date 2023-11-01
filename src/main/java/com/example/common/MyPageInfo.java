package com.example.common;

import lombok.Data;

import java.util.List;


@Data
public class MyPageInfo {
    private int pageNum;  //当前页码
    private int pageSize;  //每页的大小
    private int pageTotal; //总页码数
    private long total;   //总记录数
    private List list;  //记录集合

    private String search1;
    private String search2;
    private String search3;
    private String search4;
    private String search5;

    public MyPageInfo(int pageNum, int pageSize, int pageTotal, long total, List list){
        this.pageNum=pageNum;
        this.pageSize=pageSize;
        this.pageTotal=pageTotal;
        this.total=total;
        this.list=list;
    }
}
