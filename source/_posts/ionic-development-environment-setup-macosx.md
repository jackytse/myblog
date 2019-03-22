---
title: Ionic 开发环境搭建（macOS）
filename: ionic-development-environment-setup-macosx
date: 2016-7-9 16:40:14
tags:
---

![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-macosx/ionic-dev-env-setup-macosx-00001.jpg)
在上一篇文章中介绍了 [Windows 下 Ionic 开发环境的搭建](https://www.jackytse.me/2016/ionic-development-environment-setup-windows/)，这篇文章主要介绍 macOS 下 Ionic 环境搭建

## 开始安装 Ionic

Ionic 的开发环境需要安装的组件：

* Node.js
* Cordova & Ionic CLI
* Java SDK
* Android SDK

<!-- more -->

##### 安装 Node.js

前往 [Node.js 官网](http://nodejs.org/)下载 Node.js 安装包直接安装，我下载的是 v4.4.5 LTS，通过官网下载到的是 pkg 包，鼠标双击安装即可

> 由于之前我用 Homebrew 遇到过这样那样的问题，所以果断改用官网提供的 pkg 包来安装了，喜欢折腾的朋友可以使用 Homebrew 或者其它方式去安装

安装完成后打开终端输入 “node -v” 命令测试下是否安装成功
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-macosx/ionic-dev-env-setup-macosx-00002.png)

##### 更新 npm（可选）

在终端输入 “npm i npm -g” 命令更新npm
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-macosx/ionic-dev-env-setup-macosx-00003.png)

##### 安装 Cordova & Ionic CLI

在终端输入 “npm i cordova ionic -g” 命令，等待安装完成；安装完成后，输入 “cordova -v” 命令和 “ionic -v” 命令，能正常显示版本号说明安装成功
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-macosx/ionic-dev-env-setup-macosx-00004.png)

##### 安装 Java SDK (jdk)

前往 [Oracle 官网](http://www.oracle.com/technetwork/java/javase/downloads/index.html)下载最新的 jdk 安装，我下载的是 “jdk-8u91-macosx-x86.dmg”

为 jdk 设置系统环境变量

安装好 jdk 之后，在终端输入 “vim ~/.bash_profile” 打开 vim 来编辑 “.bash_profile” 文件，增加一行 “export JAVA_HOME=$(/usr/libexec/java_home)”，建议和其它 export 项放在一起便于维护
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-macosx/ionic-dev-env-setup-macosx-00005.png)

> 不熟悉 vim 操作的朋友可以参考这个 [vim 教程](http://www.cnblogs.com/onlyfu/p/5046910.html)

##### 安装 Android SDK

前往 [Android 官网（需要翻墙）](https://developer.android.com/studio/index.html) 下载最新的 Android SDK 安装，目前最新的版本是 r24.4.1；你也可以复制 [这个链接](https://dl.google.com/android/android-sdk_r24.4.1-macosx.zip)，然后使用迅雷下载，然后解压到 “/Developer” 目录下
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-macosx/ionic-dev-env-setup-macosx-00006.png)

##### 为 Android SDK 设置系统环境变量

在终端输入 “vim ~/.bash_profile” 打开 vim 来编辑 .bash_profile 文件，增加一行 “export ANDROID_HOME=/Developer/android-sdk-macosx”，和一行 “export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools/”
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-macosx/ionic-dev-env-setup-macosx-00007.png)

设置完成后打开终端，输入 “android” 命令，能打开 Android SDK Manager 窗口说明安装成功
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-macosx/ionic-dev-env-setup-macosx-00008.png)

##### 使用 Android SDK Manager 安装所需组件

Android SDK 各版本的 SDK Platform 和 Tools 并没有内置在 Android SDK 中，所有我们要通过 Android SDK Manager 来安装。打开 Android SDK Manager 后，选择要安装的组件
由于我一般是用真实 Android 设备来开发，所以我只选择了 Android SDK Tools、Android SDK Platform-tools、Android SDK Build-tools、Android Support Repository，以及Android API 19-24 的 SDK Platform

> 如果要使用 Android 内置的虚拟机来运行 App 的话，还需要下载对应版本的 System Image，这里我们不再赘述

点击 Install 按钮，等待安装完成
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-macosx/ionic-dev-env-setup-macosx-00009.png)

到此，Ionic 开发环境已安装完毕！

## 测试环境

安装完开发环境后，我们通过一个 Demo 来测试一下环境
打开终端，创建一个项目
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-macosx/ionic-dev-env-setup-macosx-00010.png)

项目创建完成后，Ionic 会自动添加一个 ios platform，所以无需重复添加
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-macosx/ionic-dev-env-setup-macosx-00011.png)

运行一下试试
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-macosx/ionic-dev-env-setup-macosx-00012.png)

运行成功！
![](http://jackytse-me.gz.bcebos.com/ionic-development-environment-setup-macosx/ionic-dev-env-setup-macosx-00013.png)

可能存在的问题

* 使用 npm 全局安装时提示权限错误
解决这个问题的办法可以参考 [这篇文章](http://www.jianshu.com/p/050f74cc7d45)

## 结语

本文写给 Ionic 入门开发者，有开发经验者可以略过
如在安装过程中遇到问题，请在文章下方留言，我在收到留言后会及时答复您