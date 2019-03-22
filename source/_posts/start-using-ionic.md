---
title: 使用 Ionic 编写移动应用
filename: start-using-ionic
date: 2016-7-18 16:40:29
tags:
---

![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00001.jpg)
Ionic 这个框架包含了一套精美的相应式 UI 组件、一套基于 AngularJS 的 Javascript 类库，以及一套强大的 CLI 工具。之前介绍了如何搭建 Ionic 的开发环境，下面就来正式创建一个应用吧。

## 创建 Ionic 项目

创建 “ionic start” 命令，template 是创建项目使用的模板，目前官方提供了三个模板：

* tabs（选项卡菜单，默认）
* blank（空模板）
* slidemenu（侧滑菜单）

<!-- more -->

```bash
$ ionic start myapp [template]
```

我使用 tabs 模板创建了一个名为 “Sample-Start-Using-Ionic” 的项目
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00002.png)

## 编写代码

[IonicChina](http://ionichina.com/) 社区提供了一套 [API](http://ionichina.com/api)，这里我就用这套 API 写一个获取 topics 的 Demo 吧

进入项目目录，使用 Sublime Text 打开项目目录，打开 “www/js/app.js” 文件，添加一个新的路由 “tab.topics”
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00004.png)

打开 “www/js/controllers.js” 文件，添加一个新的控制器 “TopicsCtrl”
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00005.png)

打开 “www/js/services.js” 文件，添加一个新的服务 “Topics”，这个服务用到了 $http 和 $q 两个服务，$http 用来请求数据，$q 是用于处理异步请求
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00006.png)

打开 “www/templates/tabs.html” 文件，添加一个新的选项卡 “Topics”，此选项卡会显示在应用底部的 tabs 上
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00007.png)

在 “www/templates/” 目录下新建一个模板文件 “tab-topics.html”，用于显示 topics 列表
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00008.png)

在终端下执行 “ionic serve” 命令，会自动打开浏览器加载这个项目，运行结果如图
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00009.png)

这说明我的模板是没有问题的，离成功又近了一步，打开 “www/js/controllers.js” 文件，修改下 “TopicsCtrl” 文件，在方法参数那里引用 “Topics” 服务，然后调用 Topics.all() 方法并在 Console 里输出试试
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00010.png)

![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00011.png)

一切都在意料之中，从 topics API 抓取到的数据正常显示在了 Console 里，在 “www/js/controllers.js” 文件里添加一个 $scope.topics 变量，用来传递到对应的模板中
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00012.png)

修改 “www/templates/tab-topics.html” 文件，使用 ng-repeat 属性来遍历 topics，使用两个花括号进行数据绑定

> 注意：这里的 img 标签要使用 ng-src 属性来绑定，不能用两个花括号绑定，否则会在运行时导致一个错误

![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00013.png)

浏览器自动刷新页面后，正确的数据已经显示出来了，到此已经成功了一半
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00014.png)

下面再写一个显示 topic 详细的页面，打开 “www/js/app.js” 文件，添加一个新的路由 “tab.topic-detail”，“:topicId” 用来匹配传递的参数，可以在控制器中使用 $stateParams 服务去捕获
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00015.png)

打开 “www/js/services.js” 文件，修改 all() 方法，将抓取到的数据保存在一个变量里，然后再添加一个 findById(id) 方法，用来获取对应 id 的 topic
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00016.png)

打开 “www/js/controllers.js” 文件，添加一个新的控制器 “TopicDetailCtrl”，内容如下
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00017.png)

修改 “www/templates/tab-topics.html” 文件，修改列表的 href 属性，指向 “tab.topic-detail” 这个路由，并传递当前 topic 的 id 值
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00018.png)

在 “www/templates/” 目录下新建一个模板文件 “topic-detail.html”，用于显示 topic 详细信息，注意 ng-bind-html 的用法，这个属性用于绑定 html 内容到页面中
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00019.png)

浏览器自动刷新之后，点击 topics 列表中第一项，成功打开了 topic 的详细页面
![](http://jackytse-me.gz.bcebos.com/start-using-ionic/start-using-ionic-00020.png)

至此，这个简单的 Demo 就完成了，所有代码已上传到 [我的 Github](https://github.com/jackytse/Sample-Start-Using-Ionic)，如有疑问，欢迎在文章下方留言，我在收到留言后会及时答复您