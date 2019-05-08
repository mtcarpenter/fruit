package com.fruit.common.product.feign;

import com.fruit.common.product.base.DecreaseStockInput;
import com.fruit.common.product.base.ProductOutput;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Author: lxc
 * @describe
 * @Date: 2019/5/7
 * @Version 1.0
 */
@Component
public class ProductClientFallback implements ProductClient {

    @Override
    public List<ProductOutput> listForOrder(List<String> productIdList) {
        return null;
    }

    @Override
    public void decreaseStock(List<DecreaseStockInput> decreaseStockInputList) {

    }

}
