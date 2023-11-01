package com.example.controller;

import com.example.common.EchartsResponse;
import com.example.entity.nage;
import com.example.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EchartsController{
        @Autowired
        private HouseService houseService;

        @RequestMapping("/echarts1")
        @ResponseBody
        public EchartsResponse echarts1(){
                EchartsResponse echartsResponse =new EchartsResponse();

                for (nage nager:houseService.list1()){
                        echartsResponse.addyear(nager.getYear());
                        echartsResponse.addmax(nager.getMax());
                        echartsResponse.addmin(nager.getMin());

                }

                return echartsResponse;
        }

        @RequestMapping("/echarts2")
        @ResponseBody
        public EchartsResponse echarts2(){
                EchartsResponse echartsResponse =new EchartsResponse();

                for (nage nager:houseService.list2()){
                        echartsResponse.addyear(nager.getYear());
                        echartsResponse.addmax(nager.getMax());
                        echartsResponse.addmin(nager.getMin());

                }
                return echartsResponse;
        }

        @RequestMapping("/echarts3")
        @ResponseBody
        public EchartsResponse echarts3(){
                EchartsResponse echartsResponse =new EchartsResponse();

                for (nage nager:houseService.list3()){
                        echartsResponse.addyear(nager.getYear());
                        echartsResponse.addmax(nager.getMax());
                        echartsResponse.addmin(nager.getMin());

                }
                return echartsResponse;
        }

        @RequestMapping("/echarts4")
        @ResponseBody
        public EchartsResponse echarts4(){
                EchartsResponse echartsResponse =new EchartsResponse();

                for (nage nager:houseService.list4()){
                        echartsResponse.addyear(nager.getYear());
                        echartsResponse.addmax(nager.getMax());
                        echartsResponse.addmin(nager.getMin());

                }
                return echartsResponse;
        }

        @RequestMapping("/echarts5")
        @ResponseBody
        public EchartsResponse echarts5() {
                EchartsResponse echartsResponse = new EchartsResponse();

                for (nage nager : houseService.list5()) {
                        echartsResponse.addyear(nager.getYear());
                        echartsResponse.addmax(nager.getMax());
                        echartsResponse.addmin(nager.getMin());

                }
                return echartsResponse;
        }

        @RequestMapping("/line")
        @ResponseBody
        public EchartsResponse line() {
                EchartsResponse echartsResponse = new EchartsResponse();

                for (nage nager : houseService.list_line()) {
//                        echartsResponse.addyear(nager.getYear());
                        echartsResponse.addmax(nager.getMax());
//                        echartsResponse.addmin(nager.getMin());

                }
                return echartsResponse;
        }
}
