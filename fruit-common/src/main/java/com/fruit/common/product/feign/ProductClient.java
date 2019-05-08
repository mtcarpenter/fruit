package com.fruit.common.product.feign;


import com.fruit.common.product.base.DecreaseStockInput;
import com.fruit.common.product.base.ProductOutput;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

/**
 * @Author: lxc
 * @describe
 * @Date: 2019/5/7
 * @Version 1.0
 */
@FeignClient(name = "product", fallback = ProductClientFallback.class)
public interface ProductClient {


    @PostMapping("/product/listForOrder")
    List<ProductOutput> listForOrder(@RequestBody List<String> productIdList);

    @PostMapping("/product/decreaseStock")
    void decreaseStock(@RequestBody List<DecreaseStockInput> decreaseStockInputList);

//    @Component
//    static class ProductClientFallback implements ProductClient {
//
//        @Override
//        public List<ProductOutput> listForOrder(List<String> productIdList) {
//            return null;
//        }
//
//        @Override
//        public void decreaseStock(List<DecreaseStockInput> decreaseStockInputList) {
//
//        }
//    }
}
