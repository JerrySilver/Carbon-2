package com.example.controller;

import com.example.common.AirLevelResponse;
import com.example.entity.airlevel;
import com.example.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AirLevelController {

    @Autowired
    private HouseService houseService;

    @RequestMapping("/air")
    @ResponseBody
    public AirLevelResponse air1(){
        AirLevelResponse airLevelResponse =new AirLevelResponse();

        for (airlevel airr:houseService.list_air()){
            airLevelResponse.getair(airr.getLeave());
        }
        return airLevelResponse;
    }
}
