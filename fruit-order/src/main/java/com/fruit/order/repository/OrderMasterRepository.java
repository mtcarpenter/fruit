package com.fruit.order.repository;

import com.fruit.order.domain.OrderMaster;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Author: lxc
 * @describe
 * @Date: 2019/5/7
 * @Version 1.0
 */
public interface OrderMasterRepository extends JpaRepository<OrderMaster, String> {
}

