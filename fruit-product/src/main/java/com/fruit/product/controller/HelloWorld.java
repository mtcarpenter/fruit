package com.fruit.product.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author: lxc
 * @describe
 * @Date: 2019/5/6
 * @Version 1.0
 */
@RestController
@RequestMapping("/product")
public class HelloWorld {

    @RequestMapping("/hello")
    public String hello(HttpServletRequest request){
        return "hello world";
    }

    @RequestMapping("/welcome")
    public String welcome(String name){
        return "hello world welcome："+name;
    }
}
