---
title: 从零开始，基于 Hexo + GitHub Pages 搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）
date: 2026-05-28 14:27:02
tags:
---
## 准备工作
### 一、工具安装
在开始之前，需要先安装以下工具：

| 工具 | 说明 | 验证命令 |
| --- | --- | --- |
| **Node.js** | 建议安装 LTS 版本（如 v20.x） | `node -v` |
| **Git** | 版本控制工具 | `git --version` |


安装完成后，配置 Git 用户信息：

bash

```shell
git config --global user.name "你的GitHub用户名"
git config --global user.email "你的GitHub邮箱"
```

### 二、创建 GitHub 仓库
[Creating a GitHub Pages site - GitHub Docs](https://docs.github.com/en/pages/getting-started-with-github-pages/creating-a-github-pages-site)

1. 登录 GitHub，点击右上角「+」→「New repository」

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1778830374037-e9dd3f33-14da-4b43-a7d2-86a285791d78.png)

2. **仓库名称必须为**：`你的用户名.github.io`（如用户名为 `zhangsan`，则仓库名为 `zhangsan.github.io`）

首先在建立一个仓库，仓库名是username.github.io，其中username是你的github账号名，这个也是你的最终的博客域名，如果你想改个别的域名，要不然改github的账号名（不过理论上之前仓库的地址都会变），要不然再申请一个账号。另外记得仓库的权限要设置成公开，不然无法访问。

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779439391664-3bdf5fa2-5576-46bb-be7b-484703eca4b7.png)

3. 设置为 **Public**（公开）
4. 勾选「Add a README file」
5. 点击「Create repository」



### 三、拉取创建刚刚创建的空仓库(目的是绑定远程仓库)
我这里是使用的IDEA,也可以用命令或者其他工具

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779439433999-ecf8fec0-17a0-4a23-be65-d9f3ac2995e5.png)

## 安装并部署Hexo
### 一、安装 Hexo 并初始化博客
1. 安装 Hexo 脚手架

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779439553611-70570582-ea16-4a9c-8024-aa8264a6c24e.png)

2. 初始化Hexo个人博客

> 初始化博客（yuanz-blog 可换成你喜欢的文件夹名）
>

```shell
hexo init yuanz-blog
```

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779439649555-e24407bf-8593-4260-947d-e3927da530be.png)

3. 安装依赖

```shell
# 3. 进入博客目录
cd yuanz-blog
# 4. 安装依赖
npm install --registry=https://registry.npmmirror.com
```

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779440686683-bf6dbe13-0ebd-4b0e-bf20-6fc471df5b96.png)



4. 修改基础配置

修改_config.yml，这里放一下基础设置（来源官网）

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779441487719-f12798d3-fb8f-4142-91ea-7d0e208a6c3f.png)

> + title	网站标题
> + subtitle	网站副标题
> + description	网站描述
> + keywords	网站的关键词。 支持多个关键词。
> + author	您的名字
> + language	网站使用的语言。 使用 2 个字母的 ISO-639-1 代码，或 它的变体。 默认为 en。
> + timezone	网站时区, Hexo 默认使用您电脑的时区。 请参考 时区列表, 中国可以用 Asia/Shanghai。
>

```yaml
title: Yuanz
subtitle: '个人博客'
description: 'Yuanz的个人博客'
keywords:
author: Yuanz
language: cn
timezone: 'Asia/Shanghai'
```

5. 本地预览（访问 [http://localhost:4000](http://localhost:4000)）

```shell
hexo server
```

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779441417294-9f945d56-ff46-4eb1-9142-ac2a0ddcbd5a.png)

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779086943008-80df914c-ace2-4783-af94-2ee19d49441f.png)



### 二、部署
1. 安装hexo部署工具

```shell
npm install hexo-deployer-git --save
```

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779441534766-f611f522-124f-467f-a1ee-7afc923cd31a.png)

2. 修改配置文件_config.yml 配置 deploy

```yaml
deploy:
  - type: git
    repo: https://github.com/yuanzhang788/yuanzhang788.github.io.git
    branch: master
    name: Yuanz
    email: 2xxxxxxxx64@qq.com
```

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779441588048-a8d1c219-78c4-4e4f-8450-8098d1ed4bd4.png)



#### 2.1 将代码推送到 GitHub
1. git追踪所有文件

```shell
git add .
```

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779441674298-61ee31dd-2fe7-4952-b130-0ad11938f6ec.png)

2. 提交本次记录

```shell
git commit -m "初始化 个人博客"
```

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779441701629-c2104476-285b-4312-9bd7-786f09e2ad8c.png)

3. 推送到远程仓库main 分支

```shell
git push -u origin main
```

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779441761521-f53a1f4f-ca66-47ca-bc8e-23fe3770846d.png)

> 推送完成后可以看到推送信息
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779441783634-4dfc8be6-7839-4c89-b9ee-982bac434c5b.png)



---

### 三、写第一篇文章
1. 使用hexo创建一片博客

```shell
hexo new "第一篇 Github Pages博客"
```

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779441973496-e0751c8f-93c9-4c03-a20b-a95333d1d260.png)

> 可以看到创建后的文章位置在source/_posts目录下
>
> 并且初始化了一些标签
>
> 写上正文这是Yuanz的第一篇 Github Pages博客
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779442067847-0f986762-7b9f-47ec-aaf4-5758e179d1f4.png)



## 部署与发布
1. 在对应仓库的 setting -> pages 设置使用哪个分支的哪个目录作为站点的构建后的文件

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779442594680-aa3df0af-3538-4d94-8860-af9d29fdd28f.png)

### 一、本地处理流程
1. **清理缓存**：

```shell
hexo clean
```

2. **生成静态文件**：

```shell
hexo generate
```

或使用简写命令：

```shell
hexo g
```

3. **本地预览**：

```shell
hexo server
```

访问`http://localhost:4000`查看效果

### 二、远程部署流程
```shell
hexo clean && hexo g && hexo deploy
```

或分步执行：

```shell
hexo clean
hexo g
hexo d
```

```shell
PS C:\Users\24372\IdeaProjects\yuanzhang788.github.io\yuanz-blog> hexo clean
INFO  Validating config
INFO  Deleted database.
PS C:\Users\24372\IdeaProjects\yuanzhang788.github.io\yuanz-blog> hexo g
INFO  Validating config
INFO  Start processing
INFO  Files loaded in 121 ms
INFO  Generated: index.html
INFO  Generated: archives/index.html
INFO  Generated: css/style.css
INFO  Generated: fancybox/jquery.fancybox.min.css
INFO  Generated: js/script.js
INFO  Generated: fancybox/jquery.fancybox.min.js
INFO  Generated: archives/2026/05/index.html
INFO  Generated: js/jquery-3.6.4.min.js
INFO  Generated: archives/2026/index.html
INFO  Generated: css/images/banner.jpg
INFO  Generated: 2026/05/22/第一篇-Github-Pages博客/index.html
INFO  Generated: 2026/05/22/hello-world/index.html
INFO  12 files generated in 846 ms
PS C:\Users\24372\IdeaProjects\yuanzhang788.github.io\yuanz-blog> hexo d
INFO  Validating config
INFO  Deploying: git
INFO  Setting up Git deployment...
Initialized empty Git repository in C:/Users/24372/IdeaProjects/yuanzhang788.github.io/yuanz-blog/.deploy_git/.git/
[master (root-commit) 4cba152] First commit
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 placeholder
INFO  Clearing .deploy_git folder...
INFO  Copying files from public folder...
INFO  Copying files from extend dirs...
warning: in the working copy of '2026/05/22/hello-world/index.html', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2026/05/22/绗竴绡?Github-Pages鍗氬/index.html', LF will be replaced by CRLF the next time Git touches it

warning: in the working copy of 'archives/2026/05/index.html', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'archives/2026/index.html', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'archives/index.html', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'css/style.css', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'fancybox/jquery.fancybox.min.js', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'index.html', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'js/jquery-3.6.4.min.js', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'js/script.js', LF will be replaced by CRLF the next time Git touches it
[master 02a054c] Site updated: 2026-05-22 17:29:56
 13 files changed, 2846 insertions(+)
 create mode 100644 2026/05/22/hello-world/index.html
 create mode 100644 "2026/05/22/\347\254\254\344\270\200\347\257\207-Github-Pages\345\215\232\345\256\242/index.html"
 create mode 100644 archives/2026/05/index.html
 create mode 100644 archives/2026/index.html
 create mode 100644 archives/index.html
 create mode 100644 css/images/banner.jpg
 create mode 100644 css/style.css
 create mode 100644 fancybox/jquery.fancybox.min.css
 create mode 100644 fancybox/jquery.fancybox.min.js
 create mode 100644 index.html
 create mode 100644 js/jquery-3.6.4.min.js
 create mode 100644 js/script.js
 delete mode 100644 placeholder
Enumerating objects: 29, done.
Counting objects: 100% (29/29), done.
Delta compression using up to 16 threads
Compressing objects: 100% (21/21), done.
Writing objects: 100% (29/29), 278.88 KiB | 8.45 MiB/s, done.
Total 29 (delta 5), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (5/5), done.
remote: 
remote: Create a pull request for 'master' on GitHub by visiting:
remote:      https://github.com/yuanzhang788/yuanzhang788.github.io/pull/new/master
remote: 
To https://github.com/yuanzhang788/yuanzhang788.github.io.git
 * [new branch]      HEAD -> master
branch 'master' set up to track 'https://github.com/yuanzhang788/yuanzhang788.github.io.git/master'.
INFO  Deploy done: git
PS C:\Users\24372\IdeaProjects\yuanzhang788.github.io\yuanz-blog> 
```

> 此处可以看到执行hexo d后会往远程仓库的master root目录下推送代码,这里就是开始配置的分支和目录,如果没有就要检查,是否配置
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779442661336-ef584468-9e62-412e-86c3-bbe663c8a1cd.png)

> 如果配置了就是下图这个样子代表成功了,如果没有配置,配置了就可以了
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779442636541-9452f1bc-56bf-47b3-bc1d-5e8716725bf5.png)

> 可以使用域名访问了
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779442679358-29df6060-9c1b-44f5-98ae-f4be1dc7dcfe.png)





## 主题安装部署
1. 官方插件仓库

[Themes](https://hexo.io/themes/)

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779442913700-1795c4e6-996f-467f-b841-0bdf0e944aa7.png)

2. 我选用的Butterfly,下面是Butterfly官方文档

[Butterfly 文檔(一) 快速開始](https://butterfly.js.org/posts/21cfbf15/)

3. 安装插件Butterfly

```shell
#进入个人博客目录
cd yuanz-blog
# clone Butterfly到目录下
git clone -b dev https://github.com/jerryc127/hexo-theme-butterfly.git themes/butterfly
```

> clone 完成后可以看到themes主题目录下多了一个Butterfly主题
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779443038635-9251c267-f6c3-4022-8199-49cf0e6444f2.png)

4. 切换主题

> 修改_config.yml中的theme为我们自己想改的主题我这里是butterfly
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779443073409-85945ed2-5873-4845-9f50-1067be1a6b3b.png)

5. 安装 pug 以及 stylus 的渲染器(每个主题不一样,Butterfly需要安装,如果不是Butterfly请参考各自主题的官方文档)

```shell
npm install hexo-renderer-pug hexo-renderer-stylus --save
```

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779443135628-f47c775a-c451-4b4f-9dc2-115e4e904bc0.png)



6. 重新clear generate deploy

> 从这里就可以看到Butterfly的banner了,代表安装成功了
>

```shell
PS C:\Users\24372\IdeaProjects\yuanzhang788.github.io\yuanz-blog> hexo clean                                                                             
INFO  Validating config
INFO  
  ===================================================================
      #####  #    # ##### ##### ###### #####  ###### #      #   #
      #    # #    #   #     #   #      #    # #      #       # #
      #####  #    #   #     #   #####  #    # #####  #        #
      #    # #    #   #     #   #      #####  #      #        #
      #    # #    #   #     #   #      #   #  #      #        #
      #####   ####    #     #   ###### #    # #      ######   #
                            5.5.5-b1
  ===================================================================
INFO  Deleted database.
INFO  Deleted public folder.
PS C:\Users\24372\IdeaProjects\yuanzhang788.github.io\yuanz-blog> hexo g                                                                                 
INFO  Validating config
INFO  
  ===================================================================
      #####  #    # ##### ##### ###### #####  ###### #      #   #
      #    # #    #   #     #   #      #    # #      #       # #
      #####  #    #   #     #   #####  #    # #####  #        #
      #    # #    #   #     #   #      #####  #      #        #
      #    # #    #   #     #   #      #   #  #      #        #
      #####   ####    #     #   ###### #    # #      ######   #
                            5.5.5-b1
  ===================================================================
INFO  Start processing
INFO  Files loaded in 3.27 s
INFO  Generated: archives/index.html
INFO  Generated: img/error-page.png
INFO  Generated: index.html
INFO  Generated: css/var.css
INFO  Generated: css/index.css
INFO  Generated: img/friend_404.gif
INFO  Generated: img/favicon.ico
INFO  Generated: img/404.jpg
INFO  Generated: archives/2026/05/index.html
INFO  Generated: js/utils.js
INFO  Generated: js/search/local-search.js
INFO  Generated: js/main.js
INFO  Generated: js/tw_cn.js
INFO  Generated: js/search/algolia.js
INFO  Generated: archives/2026/index.html
INFO  Generated: img/butterfly-icon.png
INFO  Generated: 2026/05/22/hello-world/index.html
INFO  Generated: 2026/05/22/第一篇-Github-Pages博客/index.html
INFO  18 files generated in 950 ms
PS C:\Users\24372\IdeaProjects\yuanzhang788.github.io\yuanz-blog> hexo d                                                                                 
INFO  Validating config
INFO  
  ===================================================================
      #####  #    # ##### ##### ###### #####  ###### #      #   #
      #    # #    #   #     #   #      #    # #      #       # #
      #####  #    #   #     #   #####  #    # #####  #        #
      #    # #    #   #     #   #      #####  #      #        #
      #    # #    #   #     #   #      #   #  #      #        #
      #####   ####    #     #   ###### #    # #      ######   #
                            5.5.5-b1
  ===================================================================
INFO  Deploying: git
INFO  Clearing .deploy_git folder...
INFO  Copying files from public folder...
INFO  Copying files from extend dirs...
warning: in the working copy of '2026/05/22/hello-world/index.html', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of '2026/05/22/绗竴绡?Github-Pages鍗氬/index.html', LF will be replaced by CRLF the next time Git touches it

warning: in the working copy of 'archives/2026/05/index.html', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'archives/2026/index.html', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'archives/index.html', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'index.html', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'css/index.css', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'js/main.js', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'js/search/algolia.js', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'js/search/local-search.js', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'js/tw_cn.js', LF will be replaced by CRLF the next time Git touches it
warning: in the working copy of 'js/utils.js', LF will be replaced by CRLF the next time Git touches it
[master 2940dfc] Site updated: 2026-05-22 17:46:47
 24 files changed, 11316 insertions(+), 2731 deletions(-)
 delete mode 100644 css/images/banner.jpg
 create mode 100644 css/index.css
 delete mode 100644 css/style.css
 create mode 100644 css/var.css
 delete mode 100644 fancybox/jquery.fancybox.min.css
 delete mode 100644 fancybox/jquery.fancybox.min.js
 create mode 100644 img/404.jpg
 create mode 100644 img/butterfly-icon.png
 create mode 100644 img/error-page.png
 create mode 100644 img/favicon.ico
 create mode 100644 img/friend_404.gif
 delete mode 100644 js/jquery-3.6.4.min.js
 create mode 100644 js/main.js
 delete mode 100644 js/script.js
 create mode 100644 js/search/algolia.js
 create mode 100644 js/search/local-search.js
 create mode 100644 js/tw_cn.js
 create mode 100644 js/utils.js
Enumerating objects: 49, done.
Counting objects: 100% (49/49), done.
Delta compression using up to 16 threads
Compressing objects: 100% (26/26), done.
Writing objects: 100% (32/32), 433.70 KiB | 9.23 MiB/s, done.
Total 32 (delta 5), reused 0 (delta 0), pack-reused 0 (from 0)
remote: Resolving deltas: 100% (5/5), done.
To https://github.com/yuanzhang788/yuanzhang788.github.io.git
   60974dd..2940dfc  HEAD -> master
branch 'master' set up to track 'https://github.com/yuanzhang788/yuanzhang788.github.io.git/master'.
INFO  Deploy done: git
PS C:\Users\24372\IdeaProjects\yuanzhang788.github.io\yuanz-blog> 
```

> 访问主页发现主题变更了,但是和官方的不一样,这是因为这款主题还需要额外的配置,也需要参考官方文档进行配置,本文只解释部署和切换主题,如果需要配置样式请参考官方文档
>

<!-- 这是一张图片，ocr 内容为： -->
![](/assets/从零开始，基于-Hexo-GitHub-Pages-搭建一个属于自己的个人博客，并完成主题切换与部署。（超详细教程）/1779443377614-148aa5d4-6ede-480a-a7fa-f31624e88723.png)



