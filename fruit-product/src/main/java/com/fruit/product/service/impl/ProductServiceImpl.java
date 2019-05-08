package com.fruit.product.service.impl;

import com.fruit.product.common.DecreaseStockInput;
import com.fruit.product.common.ProductOutput;
import com.fruit.product.domain.ProductInfo;
import com.fruit.product.enums.ProductStatusEnum;
import com.fruit.product.enums.ResultEnum;
import com.fruit.product.exception.ProductException;
import com.fruit.product.repository.ProductRepository;
import com.fruit.product.service.ProductService;
import com.fruit.product.utils.JsonUtil;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
/**
 * @Author: lxc
 * @describe
 * @Date: 2019/5/7
 * @Version 1.0
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Autowired(required = true)
    private AmqpTemplate amqpTemplate;

    @Override
    public List<ProductInfo> findUpAll() {
        return productRepository.findByProductStatus(ProductStatusEnum.UP.getCode());
    }

    @Override
    public List<ProductOutput> findList(List<String> productIdList) {
        return productRepository.findByProductIdIn(productIdList).stream()
                .map(e -> {
                    ProductOutput output = new ProductOutput();
                    BeanUtils.copyProperties(e, output);
                    return output;
                })
                .collect(Collectors.toList());
    }

    @Override
    public void decreaseStock(List<DecreaseStockInput> decreaseStockInputList) {
        List<ProductInfo> productInfoList = decreaseStockProcess(decreaseStockInputList);

        //发送mq消息
        List<ProductOutput> productInfoOutputList = productInfoList.stream().map(e -> {
            ProductOutput output = new ProductOutput();
            BeanUtils.copyProperties(e, output);
            return output;
        }).collect(Collectors.toList());
        // @todo rabbitmq消息处理
         amqpTemplate.convertAndSend("productInfo", JsonUtil.toJson(productInfoOutputList));

    }

    @Transactional
    public List<ProductInfo> decreaseStockProcess(List<DecreaseStockInput> decreaseStockInputList) {
        List<ProductInfo> productInfoList = new ArrayList<>();
        for (DecreaseStockInput decreaseStockInput: decreaseStockInputList) {
            Optional<ProductInfo> productInfoOptional = productRepository.findById(decreaseStockInput.getProductId());
            //判断商品是否存在
            if (!productInfoOptional.isPresent()){
                throw new ProductException(ResultEnum.PRODUCT_NOT_EXIST);
            }

            ProductInfo product = productInfoOptional.get();
            //库存是否足够
            Integer result = product.getProductStock() - decreaseStockInput.getProductQuantity();
            if (result < 0) {
                throw new ProductException(ResultEnum.PRODUCT_STOCK_ERROR);
            }

            product.setProductStock(result);
            productRepository.save(product);
            productInfoList.add(product);
        }
        return productInfoList;
    }
}

