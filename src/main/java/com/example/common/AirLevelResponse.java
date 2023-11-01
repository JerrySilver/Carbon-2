package com.example.common;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class AirLevelResponse {
    private String code="ok";

    private List airList;

    public void getair(String keyyy){
        if(this.airList==null){
            this.airList = new ArrayList();
        }
        this.airList.add(keyyy);

    }
}
