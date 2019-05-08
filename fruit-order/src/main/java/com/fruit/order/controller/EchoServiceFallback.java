package com.fruit.order.controller;

import org.springframework.stereotype.Component;

/**
 * @Author: lxc
 * @describe
 * @Date: 2019/5/8
 * @Version 1.0
 */
@Component
public class EchoServiceFallback implements EchoService {
    @Override
    public String echo(String message) {
        return "echo fallback";
    }
}