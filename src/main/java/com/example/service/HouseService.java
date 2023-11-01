package com.example.service;

import com.example.common.MyPageInfo;
import com.example.entity.airlevel;
import com.example.entity.nage;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


public interface HouseService {
    MyPageInfo list(HttpServletRequest request);

    MyPageInfo list_bj(HttpServletRequest request);

    MyPageInfo list_heb(HttpServletRequest request);

    MyPageInfo list_xz(HttpServletRequest request);

    MyPageInfo list_tlf(HttpServletRequest request);

    List<nage> list1();

    List<nage> list2();

    List<nage> list3();

    List<nage> list4();

    List<nage> list5();
    List<airlevel> list_air();

    List<nage> list_line();
}
