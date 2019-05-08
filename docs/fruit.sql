/*
Navicat MySQL Data Transfer

Source Server         : localshot
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : fruit

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-05-08 14:17:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `detail_id` varchar(30) NOT NULL,
  `order_id` varchar(32) NOT NULL COMMENT '订单id',
  `product_id` varchar(32) NOT NULL,
  `product_name` varchar(64) NOT NULL COMMENT '商品名称',
  `product_price` decimal(8,2) NOT NULL COMMENT '当前价格,单位分',
  `product_quantity` int(11) NOT NULL COMMENT '数量',
  `product_icon` varchar(512) DEFAULT NULL COMMENT '小图',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`detail_id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单详情表';

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('1557228513805348855', '1557228511079421594', '1', '鼎红富士苹果 20个 单果约180~220g ', '78.00', '2', 'https://fruit-new.oss-cn-beijing.aliyuncs.com/product/5b2c9d8fNb8435739.jpg', '2019-05-07 19:28:34', '2019-05-07 19:28:34');
INSERT INTO `order_detail` VALUES ('1557280037125276208', '1557280034602254778', '1', '鼎红富士苹果 20个 单果约180~220g ', '78.00', '2', 'https://fruit-new.oss-cn-beijing.aliyuncs.com/product/5b2c9d8fNb8435739.jpg', '2019-05-08 09:47:17', '2019-05-08 09:47:17');
INSERT INTO `order_detail` VALUES ('1557292150927960571', '1557292148632788117', '1', '鼎红富士苹果 20个 单果约180~220g ', '78.00', '2', 'https://fruit-new.oss-cn-beijing.aliyuncs.com/product/5b2c9d8fNb8435739.jpg', '2019-05-08 13:09:11', '2019-05-08 13:09:11');

-- ----------------------------
-- Table structure for order_master
-- ----------------------------
DROP TABLE IF EXISTS `order_master`;
CREATE TABLE `order_master` (
  `order_id` varchar(50) NOT NULL COMMENT '订单id',
  `buyer_name` varchar(32) NOT NULL COMMENT '买家名字',
  `buyer_phone` varchar(32) NOT NULL COMMENT '买家电话',
  `buyer_address` varchar(128) NOT NULL COMMENT '买家地址',
  `buyer_openid` varchar(64) NOT NULL COMMENT '买家微信openid',
  `order_amount` decimal(8,2) NOT NULL COMMENT '订单总金额',
  `order_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单状态，默认0新下单',
  `pay_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付状态，默认0未支付',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`),
  KEY `idx_buyer_openid` (`buyer_openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

-- ----------------------------
-- Records of order_master
-- ----------------------------
INSERT INTO `order_master` VALUES ('1557228511079421594', ' 张三', ' 138888889', ' 测试', ' aaa', '156.00', '0', '0', '2019-05-07 19:28:34', '2019-05-07 19:35:47');
INSERT INTO `order_master` VALUES ('1557280034602254778', ' 张三', ' \"138888889\"', ' 测试', 'aaa', '156.00', '0', '0', '2019-05-08 09:47:17', '2019-05-08 14:17:00');
INSERT INTO `order_master` VALUES ('1557292148632788117', ' 张三', ' \"138888889\"', ' 测试', ' aaa', '156.00', '0', '0', '2019-05-08 13:09:11', '2019-05-08 14:17:02');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类目名字',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `category_icon_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类目图',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uqe_category_type` (`category_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('1', '新鲜水果', '1', 'https://fruit-new.oss-cn-beijing.aliyuncs.com/icon/%E6%B0%B4%E6%9E%9C.png', '2019-05-07 12:15:54', '2019-05-07 12:15:54');
INSERT INTO `product_category` VALUES ('2', '休闲零食', '2', 'https://fruit-new.oss-cn-beijing.aliyuncs.com/icon/%E9%9B%B6%E9%A3%9F.png', '2019-05-07 12:16:21', '2019-05-07 12:16:21');

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(80) NOT NULL COMMENT '商品名称',
  `product_price` decimal(6,2) NOT NULL COMMENT '价格,单位：分',
  `product_stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `product_description` varchar(64) DEFAULT NULL COMMENT '描述',
  `product_icon` varchar(255) DEFAULT NULL COMMENT '主图',
  `product_status` tinyint(3) NOT NULL DEFAULT '0',
  `category_type` int(11) DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES ('1', '鼎红富士苹果 20个 单果约180~220g ', '78.00', '994', '鼎端 陕西洛川苹果红富士 20个 单果约180~220g 新鲜水果', 'https://fruit-new.oss-cn-beijing.aliyuncs.com/product/5b2c9d8fNb8435739.jpg', '0', '1', '2019-05-07 12:21:11', '2019-05-07 12:21:11');
INSERT INTO `product_info` VALUES ('2', '进口椰青 2个装 单果800g以上', '32.70', '0', ' 展卉 泰国进口椰青 2个装 单果800g以上 赠送开椰器和吸管 新鲜水果', 'https://fruit-new.oss-cn-beijing.aliyuncs.com/product/5a30909aN79d85ef1.jpg', '0', '1', '2019-05-07 12:22:53', '2019-05-07 12:23:08');
INSERT INTO `product_info` VALUES ('3', '芒果干116g/袋', '9.80', '0', '芒果干蜜饯果干芒果片休闲零食办公室小吃果脯水果干116g/袋', 'https://fruit-new.oss-cn-beijing.aliyuncs.com/product/9014dd1fe0b0c28c.jpg', '0', '2', '2019-05-07 12:27:32', '2019-05-07 12:27:32');
INSERT INTO `product_info` VALUES ('4', '新疆葡萄干500克*2袋装', '29.90', '0', '新疆葡萄干500克*2袋装 特产无籽级无核葡萄干 蜜饯果干 吐鲁番大颗粒绿葡萄干 500g*2包', 'https://fruit-new.oss-cn-beijing.aliyuncs.com/product/05526bbb50d896b7.jpg', '0', '2', '2019-05-07 12:28:52', '2019-05-07 12:28:52');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT '',
  `password` varchar(32) DEFAULT '',
  `openid` varchar(64) DEFAULT '' COMMENT '微信openid',
  `role` tinyint(1) NOT NULL COMMENT '1买家2卖家',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'user', '123', 'aaa', '1', '2019-05-07 13:17:06', '2019-05-07 13:17:06');
INSERT INTO `user_info` VALUES ('2', 'admin', '123', 'bbb', '2', '2019-05-07 13:17:15', '2019-05-07 13:17:15');
