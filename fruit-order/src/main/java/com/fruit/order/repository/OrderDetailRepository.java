package com.fruit.order.repository;
import com.fruit.order.domain.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
/**
 * @Author: lxc
 * @describe
 * @Date: 2019/5/7
 * @Version 1.0
 */
public interface OrderDetailRepository extends JpaRepository<OrderDetail, String> {

    /**
     * 查询订单详情
     * @param orderId
     * @return
     */
    List<OrderDetail> findByOrderId(String orderId);
}

