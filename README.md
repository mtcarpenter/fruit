# fruit
基于Spring Boot 和Spring Cloud开发的水果商城
# 技术栈
此项目是 Spring cloud Oauth2 构建的后台管理系统，计划采用以下技术

注册中心：eureka
服务网关：Spring cloud-Gateway
配置中心：Spring cloud-config        即将更新
服务调用：Spring-cloud-open-Feign
负载均衡：Spring-cloud-loadbalancer     即将更新
熔断降级：Sentinel
消息队列：RabbitMQ
# 项目结构说明
| 模块          | 模块名             | 端口 |
| ------------- | ------------------ | ---- |
| fruit-eureka  | Eureka服务注册中心 | 8761 |
| fruit-common  | 公共模块           |      |
| fruit-product | 商品模块           | 8090 |
| fruit-order   | 订单模块           | 8092 |
| fruit-user    | 用户中心           | 8095 |
| api-gateway   | 动态路由           | 9000 |

