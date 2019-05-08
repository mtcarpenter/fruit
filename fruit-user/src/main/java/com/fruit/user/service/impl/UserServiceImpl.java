package com.fruit.user.service.impl;

import com.fruit.user.domain.UserInfo;
import com.fruit.user.repostory.UserInfoRepostory;
import com.fruit.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: lxc
 * @describe
 * @Date: 2019/5/7
 * @Version 1.0
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserInfoRepostory repostory;
    /**
     * 通过openid来查询用户信息
     *
     * @param openid
     * @return
     */
    @Override
    public UserInfo findByOpenid(String openid) {
        return repostory.findByOpenid(openid);
    }
}