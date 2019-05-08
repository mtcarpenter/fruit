package com.fruit.user.repostory;

import com.fruit.user.domain.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @Author: lxc
 * @describe
 * @Date: 2019/5/7
 * @Version 1.0
 */
public interface UserInfoRepostory extends JpaRepository<UserInfo, String> {

    /**
     * 查询用户
     * @param openid
     * @return
     */
    UserInfo findByOpenid(String openid);
}

