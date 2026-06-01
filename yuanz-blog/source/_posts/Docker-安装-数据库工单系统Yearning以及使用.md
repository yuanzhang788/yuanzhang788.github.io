---
title: Docker 安装 数据库工单系统Yearning以及使用
date: 2026-06-01 18:21:52
tags:
---

## 文档以及部署
### 什么是Yearning?
一个强大且本地部署的平台，专为数据库管理员（DBA）和开发人员设计，提供无缝的SQL检测和查询审计。专注于隐私和效率，为MYSQL审计提供直观且安全的环境。

### 功能
+ **AI 助手**：我们的AI助手提供实时SQL优化建议，提升SQL性能。同时支持文本到SQL的转换，允许用户输入自然语言并接收优化后的SQL语句。
+ **SQL 审计**：创建具有审批工作流和自动语法检查的SQL审计工单。验证SQL语句的正确性、安全性和合规性。为DDL/DML操作自动生成回滚语句，并提供全面的历史记录以便追溯。
+ **查询审计**：审计用户查询，限制数据源和数据库，并匿名化敏感字段。查询记录被保存以供将来参考。
+ **检查规则**：我们的自动语法检查器支持多种检查规则，适用于大多数自动检查场景。
+ **隐私保护**：Yearning是一个本地部署的开源解决方案，确保您的数据库和SQL语句的安全。它包括加密机制以保护敏感数据，即使在未经授权的访问情况下也能确保数据安全。
+ **RBAC（基于角色的访问控制）**：创建和管理具有特定权限的角色，根据用户角色限制对查询工单、审计功能和其他敏感操作的访问。

### 官方文档以及地址
[Yearning Guide](https://next.yearning.io/)

[GitHub - cookieY/Yearning: 🐳 A most popular sql audit platform for mysql](https://github.com/cookieY/Yearning)

### 环境准备
1. 单独使用docker时请先创建数据库并设置字符集为**utf8mb4**

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778119966453-968d73f6-aeb3-487d-938f-4ce784ea7291.png)

### docker初始化
1. 初始化

> SECRET_KEY必须位16位不然后续有坑
>

```shell
docker run --rm -it \
-p 8000:8000 \
--add-host=host.docker.internal:host-gateway \
-e SECRET_KEY=K8xP2mQ7vN4rT9aL \
-e MYSQL_USER=root \
-e MYSQL_PASSWORD=123456 \
-e MYSQL_ADDR=host.docker.internal \
-e MYSQL_DB=yearning \
-e Y_LANG=zh_CN \
yeelabs/yearning /opt/Yearning install
```

> 初始化后会拿到admin的账号和密码
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778120284832-b2f58de6-7a01-4c40-8724-c0a34a40fc8e.png)

> 初始化完成后可以在库里看到yearning相关的的表
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778120316854-674a4b4e-b0fa-4bbd-b275-e7d28c97c786.png)

### docker部署
> 此处填写刚刚初始化的数据即可
>

```shell
docker run -d \
--name yearning \
-p 8000:8000 \
--add-host=host.docker.internal:host-gateway \
-e SECRET_KEY=K8xP2mQ7vN4rT9aL \
-e MYSQL_USER=root \
-e MYSQL_PASSWORD=123456 \
-e MYSQL_ADDR=host.docker.internal \
-e MYSQL_DB=yearning \
-e Y_LANG=zh_CN \
yeelabs/yearning
```

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778120407256-9f5a14dd-5751-4b03-b9bb-a0e625b93056.png)

> 启动完成访问[http://localhost:8000/](http://localhost:8000/)  ,输入刚刚初始化的账号和密码
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778120422158-60e073c0-65c6-4d40-bc80-9eb9ae7cb6f7.png)

> 进入后台
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778120433889-efb958df-2e6f-4fbd-b453-3c5baf986c37.png)

## 基础使用介绍
### 基础菜单
<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778120483492-280524cd-c209-40ce-8fa2-f1ea390198e3.png)

### 创建流程
1. 创建新的流程

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778120662400-a1d06b8f-c576-4820-adda-cda16439aced.png)

2. 创建流程步骤

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778120711389-67817b72-6c52-49f7-9160-072560939ad1.png)

> 此处我创建了两个步骤
>
> + 步骤1为审核 步骤二为执行
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778120726206-79da8ee2-3b00-44e8-9785-0f31dc2c812a.png)

### 创建数据源
> + 环境支持Aliyun和AWS
> + DB类型支持mysql和pg
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778120537807-64f37019-203a-49e1-a22e-5c11340700cd.png)

> 测试连接成功后点击创建
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778121358481-cc2e0cad-d0bb-46cb-b67f-6ea7e15da332.png)

### 创建测试用户并设置权限组
1. 创建测试用户

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778121553458-4b61de58-f5d5-4055-bb10-7c252b855f4a.png)

2. 新增测试权限组,将刚刚添加的数据源赋权

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778121722061-e46f32a6-7136-4f50-a5dd-2915f2caac97.png)

3. 为测试用户设置测试权限组

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778121790183-eb91c7f7-11f8-475c-baa5-080f4c069640.png)



## DML/DDL工单
### 提交DML/DDL工单
1. 登录测试账号提交工单,此处选择的是DML就是体检的DML工单,需要提交DDL工单就切换到DDL,查询不会提交工单,只会记录查询sql后续会介绍到

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778125457146-615d1440-683f-4ddc-a094-4f01cb0c5199.png)

2. 提交工单,选择操作数据库,数据库表以及说明

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778121876380-ba16537f-9c5d-49f5-9fed-59bb12c815d3.png)

3. 提交工单,填写执行sql,填写完成后点击SQL检测,可以检测错误信息和受影响行数等信息

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778122120783-8168dc34-6bcb-4214-8f31-e586d63db39b.png)

4. 检测没问题了,就可以提交了

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778122162862-2bef02e2-d147-4201-bc3a-67c88f93f40b.png)



### 审核DML/DDL工单
1. 切换到admin账号,进行工单审核

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778122192650-d69a02b9-5763-4a28-9a47-5cb9d5b577cf.png)

2. 开始审核工单(节点1)

> 开始点进去是不能直接同意的,需要SQL检测后才能同意
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778122232618-82acabc4-e13b-4c00-bb30-3f2409176d31.png)

3. 审核工单节点2

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778122288893-3ed00639-310f-4a26-8603-d0eb55d76425.png)

4. 工单审核通过sql自动执行

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778122311644-f670c4c7-3b8e-48d9-950a-d906f216b527.png)

5. 工单已完成

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778122330192-7bcb9ede-a6e7-405a-9b6e-390f827a7b56.png)

6. 数据库验证,sql执行成功

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778122440929-c1ddaf2e-a62b-4882-8f58-5713aa20d298.png)

### 工单回滚
> 管理员可以对审核通过的工单进行回滚操作
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778122412708-38599f2c-124b-469c-a0e6-fb57d0f2bf86.png)

> 回滚和提交的工单审批节点一致
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778122658200-8e1e2b97-c103-47ef-a6fb-8d59b5739f66.png)

> 审核完成执行sql
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778122726692-406b1a04-8f9e-48ef-90d9-395d99a5b0ba.png)

> 验证回滚执行完成
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778122717700-f6b2e130-9494-406a-9faf-ca832a5a3f75.png)



## 查询工单
> 查询工单无法审批,只能记录对应人员的查询权限,可以通过不同的数据库账号来划分查询权限,不同的账号查询不同的数据库或者不同数据库表
>

1. 选择对应数据源

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778123133713-feda0837-1083-45be-9cc7-a2a1605cd18f.png)

2. 选择对应数据库,执行对应查询语句

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778123244670-85c994c9-6a65-4231-aa34-85f177ecbcf1.png)

3. 管理员可以再对应页面查看的对应人员在执行查询操作

> 点击结束,结束该人员的查询
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778123428189-a93eab86-15b2-4fa8-97f3-6daa449a21c4.png)

4. 管理员可以点击详情查询对应人员的查询语句

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/Docker-安装-数据库工单系统Yearning以及使用/1778123436630-91940f56-766e-41ee-a9f3-03a6b0224aca.png)



