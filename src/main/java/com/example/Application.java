package com.example;

import jdk.internal.org.jline.utils.Log;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication
public class Application {

    public static void main(String[] args) {
        try{
            SpringApplication.run(Application.class, args);
            System.out.println("Server startup done.");
        }catch (Exception e){
            Log.error("服务xxx-support启动报错",e);
        }


    }

}
