---
title: 发布 Ionic Android 应用
filename: publish-ionic-android
date: 2017-06-12 14:11:57
tags:
---

![](http://jackytse-me.gz.bcebos.com/publish-ionic-android/publish-ionic-android-00001.jpg)
之前介绍了 iOS 应用的打包和发布，这次说说 Android 应用的打包和发布。

Android 应用的打包和发布相比较 iOS 就要简单很多了，也不需要注册什么开发者账号。

<!-- more -->

## 打包 Ionic 应用

#### #1 生成签名文件

执行以下命令生成签名文件，根据提示输入指定的信息。`-alias` 是 `keystore` 的别名，可以自定义；`-keyalg` 是加密算法，一般为 `RSA`，`-validity` 是签名文件的有效期限天数；`-keystore` 是保存的文件名。
```bash
$ keytool -genkey -alias szmstc.keystore -keyalg RSA -validity 1000 -keystore szmstc.keystore
```

![](http://jackytse-me.gz.bcebos.com/publish-ionic-android/publish-ionic-android-00002.png)

> 生成签名所需要的 `keytool` 工具包含在 `jdk` 中

#### #2 配置自动签名

将生成的 `keystore` 文件复制到 `platforms/android` 目录下，并在此目录下新建一个 `release-signing.properties` 文件。执行打包命令的时候，`gradle` 会自动根据此配置文件自动去加载 `keystore` 文件。

![](http://jackytse-me.gz.bcebos.com/publish-ionic-android/publish-ionic-android-00003.png)

#### #3 执行打包命令

添加 `--release` 参数来打包。
```bash
$ ionic cordova build android --release
```

> Ionic CLI 3.0 有一些变化，参考[这里](http://ionicframework.com/docs/cli/cordova/build/)

![](http://jackytse-me.gz.bcebos.com/publish-ionic-android/publish-ionic-android-00004.png)

命令执行成功后，生成的 apk 文件在 platforms/android/build/outputs/apk 目录下，若生成的 apk 文件带有 unsigned 字样，说明自动签名配置有问题，请检查配置。

> `android-x86-release.apk` 是用于在 `x86` 设备或者 `x86` 虚拟机中运行的文件；`android-armv7-release.apk` 是用于在大多数手机中运行的文件

## 发布 Ionic 应用

#1 将签名过的 apk 文件上传到你的站点

#2 制作 app 下载页面，将下载链接指向 apk 文件

#3 如果你愿意，也可以将应用发布到 `应用宝` 等平台，本文不再介绍
