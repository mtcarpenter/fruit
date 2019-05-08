package com.fruit.product.enums;

import lombok.Getter;

/**
 * @Author: lxc
 * @describe 商品上下架状态
 * @Date: 2019/5/7
 * @Version 1.0
 */
@Getter
public enum ProductStatusEnum {
    UP(0, "在架"),
    DOWN(1, "下架"),
    ;
    private Integer code;

    private String message;

    ProductStatusEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
