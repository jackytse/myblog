---
title: Ionic 开发环境搭建（Windows）
filename: ionic-development-environment-setup-windows
date: 2016-06-23 16:33:21
tags:
---


## Ionic 概述

Ionic 官网：http://www.ionicframework.com/
Ionic 是一个强大的 HTML5 SDK，它使用 HTML、CSS、Javascript 等 web 技术帮助你快速构建原生风格的移动应用
Ionic 目前能支持 iOS 和 Android 

## 与 Cordova 的关系

Ionic 是基于 Cordova 的，在 Cordova 上能用的一切同样可以在 Ionic 上使用
Ionic 在 Cordova 基础上增加了 Ionic UI、AngularJS、一个强大的 CLI 工具和一些云端服务等

<!-- more -->

## 安装 Ionic

Ionic 的开发环境离不开下列组件：

* Node.js
* Cordova & Ionic CLI
* Java SDK
* Android SDK

##### 安装 Node.js

前往 [Node.js 官网](http://nodejs.org/)下载 Node.js 安装包直接安装，建议下载 LTS 版本，笔者安装的是 v4.4.5 LTS
安装的过程中默认勾选的“Add to PATH”选项不要取消
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00001.png)

安装完成后打开终端，输入“node -v”命令，能正常显示版本号说明安装成功
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00002.png)

##### 安装 cnpm (可选)

npm 是 Node.js 的包管理器，由于我大天朝网络环境的原因，在使用 npm 的时候经常无法安装包或者下载很慢
于是我们需要一个 npm 的中国镜像，cnpm 是淘宝的 npm 镜像，10分钟同步一次
以管理员身份打开终端，输入“npm i cnpm -g”命令，等待安装完成
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00003.png)

安装完成后，输入“cnpm -v”命令，能正常显示版本号说明安装成功
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00004.png)

##### 安装 Cordova & Ionic CLI

以管理员身份打开终端，输入“npm i cordova ionic -g”命令，等待安装完成

> 如果安装了 cnpm，可以使用“cnpm i cordova ionic -g”命令

![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00005.png)

安装完成后，输入“cordova -v”命令和“ionic -v”命令，能正常显示版本号说明安装成功
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00006.png)

##### 安装 Java SDK (jdk)

前往 [Oracle 官网](http://www.oracle.com/technetwork/java/javase/downloads/index.html)下载最新的 jdk 安装，我下载的是 jdk 8u91 windows x86 的版本

> 由于很多依赖 Java 的项目都不支持64位的 jdk，所以建议大家下载安装 x86 版本
> 安装过程中可以只安装 jdk，不安装 jre 和源代码

![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00007.png)

##### 为 jdk 设置系统环境变量

打开系统属性，在“高级”选项卡中找到环境变量，单击打开“环境变量”设置窗口
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00008.png)

在“系统变量”列表中新建一个系统变量“JAVA_HOME”，值为刚才安装的 jdk 的路径
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00009.png)

在“系统变量”列表中找到“Path”变量，双击打开“编辑系统变量”窗口
将 jdk 的 bin 路径添加至“变量值”末尾并保存
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00010.png)

安装完成后打开终端，输入“java -version”命令，能正常显示版本号说明安装成功
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00011.png)

##### 安装 Android SDK

前往 [Android 官网](https://developer.android.com/studio/index.html)下载最新的 Android SDK 安装，目前最新的版本是 r24.4.1，我下载的是 zip 版本
下载完后解压到“C:\Program Files(x86)\Android\”目录下
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00012.png)

##### 为 Android SDK 设置系统环境变量

在“系统变量”列表中新建一个系统变量“ADT_HOME”，值为刚才安装的 Android SDK 的路径
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00013.png)

在“系统变量”列表中找到“Path”变量，双击打开“编辑系统变量”窗口
将 Android SDK 的 tools 和 platform-tools 路径添加至“变量值”末尾并保存
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00014.png)

![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00015.png)

设置完成后打开终端，输入“android”命令，能打开 Android SDK Manager 窗口说明安装成功
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00016.png)

##### 使用 Android SDK Manager 安装所需组件

Android SDK 各版本的 SDK Platform 和 Tools 并没有内置在 Android SDK 中，所有我们要通过 Android SDK Manager 来安装
打开 Android SDK Manager 后，选择要安装的组件
由于我一般是用真实 Android 设备来开发，所以我只选择了 Android SDK Tools、Android SDK Platform-tools、Android SDK Build-tools、Android Support Repository、Google USB Driver，以及Android API 19-24 的 SDK Platform

> 如果要使用 Android 内置的虚拟机来运行 App 的话，还需要下载对应版本的 System Image，这里我们不再赘述

点击 Install 按钮，等待安装完成
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00017.png)

到此，Ionic 开发环境已安装完毕！

## 测试环境

安装完开发环境后，我们通过一个 Demo 来测试一下环境
打开终端，创建一个项目
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00018.png)

等待创建完成，添加 android platform
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00019.png)

添加完成后，将 Android 手机通过 USB 线连接至电脑，然后在手机上运行项目
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00020.png)

运行成功！
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00021.png)

手机上的运行截图
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-windows/ionic-development-environment-setup-windows-00022.png)

测试结果表明环境安装成功！

## 可能存在的问题

找不到 Android 设备
笔者用的是一台三星S4的测试机，在测试中遇到过找不到 Android 设备的问题，然后打开电脑上的豌豆荚，重新连接手机至电脑并授权电脑进行 USB 调试，最终问题得到解决
## 结语

本文写给 Ionic 入门开发者，有开发经验者可以略过
如在安装过程中遇到问题，请在文章下方留言，我在收到留言后会及时答复您