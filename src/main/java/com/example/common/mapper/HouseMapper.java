package com.example.common.mapper;

import com.example.entity.airlevel;
import com.example.entity.nage;
import com.example.entity.weather;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;


@Mapper
@Component
public interface HouseMapper {

    @Select("select * from `cd_weather`")
    List<weather> list();

    @Select("select * from bj_weather")
    List<weather> list_bj();

    @Select("select * from heb_weather")
    List<weather> list_heb();

    @Select("select * from xz_weather")
    List<weather> list_xz();

    @Select("select * from tlf_weather")
    List<weather> list_tlf();

    @Select("select * from nage")
    List<nage> list1();

    @Select("select * from bj")
    List<nage> list2();

    @Select("select * from heb")
    List<nage> list3();

    @Select("select * from xz")
    List<nage> list4();

    @Select("select * from tlf")
    List<nage> list5();

    @Select("select count from bj_weather_airtj")
    List<airlevel> list_air();

    @Select("select * from cd_weathermn")
    List<nage> list_line();
}
