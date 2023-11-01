package com.example.common;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class EchartsResponse {

    private String code="ok";
    private List year;
    private  List maxList;
    private  List minList;
//    private List airList;

    public void addmax(String key){
        if(this.maxList==null){
            this.maxList = new ArrayList();
        }
        this.maxList.add(key);

    }
    public void addmin(String value){
        if(this.minList==null){
            this.minList = new ArrayList();
        }
        this.minList.add(value);
    }
    public void addyear(String keyk){
        if(this.year==null){
            this.year = new ArrayList();
        }
        this.year.add(keyk);

    }

//    public void getair(String keyyy){
//        if(this.airList==null){
//            this.airList = new ArrayList();
//        }
//        this.airList.add(keyyy);
//
//    }
}
