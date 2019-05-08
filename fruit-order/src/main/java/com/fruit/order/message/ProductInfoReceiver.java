package com.fruit.order.message;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fruit.common.product.base.ProductOutput;
import com.fruit.order.utils.JsonUtil;
import lombok.extern.slf4j.Slf4j;

import org.springframework.amqp.rabbit.annotation.Queue;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: lxc
 * @describe
 * @Date: 2019/5/7
 * @Version 1.0
 */
@Component
@Slf4j
public class ProductInfoReceiver {

    private static final String PRODUCT_STOCK_TEMPLATE = "product_stock_%s";

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @RabbitListener(queuesToDeclare = @Queue("productInfo"))
    public void process(String message) {
        //message => ProductOutput
        List<ProductOutput> productOutputList = (List<ProductOutput>) JsonUtil.fromJson(message,
                new TypeReference<List<ProductOutput>>() {});

        //存储到redis中
        for (ProductOutput productInfoOutput : productOutputList) {
            stringRedisTemplate.opsForValue().set(String.format(PRODUCT_STOCK_TEMPLATE, productInfoOutput.getProductId()),
                    String.valueOf(productInfoOutput.getProductStock()));
        }
    }
}

