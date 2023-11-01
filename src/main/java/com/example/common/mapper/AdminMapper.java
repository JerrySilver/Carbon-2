package com.example.common.mapper;

import com.example.entity.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

@Mapper
@Component
public interface AdminMapper {


    @Select("select * from `admin` where user_name=#{name}")
    Admin findByUserName(String name);


}
