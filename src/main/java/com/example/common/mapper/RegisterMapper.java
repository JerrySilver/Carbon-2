package com.example.common.mapper;


import com.example.entity.Register;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface RegisterMapper {

    @Insert("insert into admin(user_name,password,firstname,lastname) values(#{user_name},#{password},#{firstname},#{lastname})")
    int saveUser(@Param("user_name") String user_name, @Param("password") String password, @Param("firstname") String firstname, @Param("lastname") String lastname);

    @Select("select * from admin where user_name = #{user_name}")
    List<Register> findByUserName(@Param("user_name") String user_name);
}


