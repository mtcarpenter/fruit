package com.fruit.product.service;

import com.fruit.product.domain.ProductCategory;
import java.util.List;
/**
 * @Author: lxc
 * @describe
 * @Date: 2019/5/7
 * @Version 1.0
 */
public interface CategoryService {

    /**
     * 类别查询
     * @param categoryTypeList
     * @return
     */
    List<ProductCategory> findByCategoryTypeIn(List<Integer> categoryTypeList);
}
