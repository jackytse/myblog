---
title: 发布 Ionic iOS 企业级应用
filename: publish-ionic-ios-enterprise-deployment
date: 2016-8-30 16:40:43
tags:
---

![](http://jackytse-me.gz.bcebos.com/publish-ionic-ios-enterprise-deployment/publish-ionic-ios-enterprise-deployment-00001.jpg)
Ionic 项目开发完成之后呢，自然就是打包发布了，今天说说 iOS 的打包和发布。
iOS 的发布方式分为三种：iOS App Store、In-House、Ad-Hoc。下面我列举了一些主要的区别：

| 发布类型 | 开发者计划 | 是否需要苹果审核 | 发布方式 | 支持安装设备数量 |
| ------ | --------- | ------------- | ------- | ------------- |
| iOS App Store | 个人、公司、教育 | 需要 | 发布到 iOS 应用商店 | 无限制 |
| In-House | 企业开发者计划 | 不需要 | 发布到网站上给用户下载 | 无限制 |
| Ad-Hoc | 所有 | 不需要 | 拷贝给用户安装 | 100 |

> 由于我现在只有企业开发者计划帐号，所以就说说 In-House 的发布吧
> 本文仅适用于企业开发者帐号，个人开发者帐号请略过，本文不适用

<!-- more -->

## 为项目添加 Provisioning Profile

1. 登录[苹果开发者网站](https://developer.apple.com/account/ios/certificate)，找到 Certificates, Identifiers & Profiles 这个页面

2. 在页面左侧列表的上边有一个下拉框，选择 “iOS，tvOS，watchOS” 选项

3. 点击左侧列表中的 “App IDs” 项打开 iOS App IDs 页面，点击右边的 “+” 按钮添加一个 App ID
App ID Description 的 Name 字段填写 App 的名字，我一般都填的英文名
![](http://jackytse-me.gz.bcebos.com/publish-ionic-ios-enterprise-deployment/publish-ionic-ios-enterprise-deployment-00002.png)
App ID Suffix 选择 “Explicit App ID” 单选按钮，Bundle ID 字段填写一个全球唯一的标识，公司项目就填 “com.公司英文缩写.项目英文缩写”
![](http://jackytse-me.gz.bcebos.com/publish-ionic-ios-enterprise-deployment/publish-ionic-ios-enterprise-deployment-00003.png)
App Services 那里选择要启用的服务，然后点击下方的 Continue 按钮来到 Confirm your App ID 页面，确认下无误后直接点击下方 Register 按钮完成添加操作

4. 点击左侧列表中 Provisioning Profiles 节点下的 Distribution 项打开 iOS Provisioning Profiles(Distribution) 页面，点击右边的 “+” 按钮添加一个 Provisioning Profile
在 Select Type 页面选择 Distribution 节点下的 “In House” 单选框，点击下方 Continute
![](http://jackytse-me.gz.bcebos.com/publish-ionic-ios-enterprise-deployment/publish-ionic-ios-enterprise-deployment-00004.png)
在 Select App ID 页面选择之前添加的 App ID，点击下方 Continute
![](http://jackytse-me.gz.bcebos.com/publish-ionic-ios-enterprise-deployment/publish-ionic-ios-enterprise-deployment-00005.png)
在 Select Certificates 页面选择企业开发者证书，点击下方 Continute
![](http://jackytse-me.gz.bcebos.com/publish-ionic-ios-enterprise-deployment/publish-ionic-ios-enterprise-deployment-00006.png)
在 Generate 页面填写 Profile Name，可以跟 App ID 的 Name 一致，点击下方 Continute
![](http://jackytse-me.gz.bcebos.com/publish-ionic-ios-enterprise-deployment/publish-ionic-ios-enterprise-deployment-00007.png)
Provisioning Profile 生成成功后点击 Download 按钮下载下来然后双击安装即可

## 打包 Ionic 应用

iOS 应用的打包很简单：

1. 使用 XCode 打开 Ionic 项目目录下的 “./platforms/ios/ProjectName.xcodeproj” 文件
2. 打开 XCode 菜单中的 Preferences 项，在 Accounts 选项卡中添加企业开发者帐号的 Apple ID
3. 点击 Project Navigator 中的项目文件，在中间 General 选项卡中 Identity 节点下选择 Team 下拉框中选择你的企业帐号
4. 在 XCode 左上角运行配置那里选中 “Generic iOS Device” 项
5. 在 XCode 菜单中选择 Product -> Archive 即可

## 导出 Ionic 应用

1. 在 XCode 菜单中选择 Window -> Organizer，在上方选项卡中选择 Archives
2. 在 iOS Apps 列表中选中要发布的应用，在窗口中间选中打好的包，点击窗口右边的 Export 按钮
![](http://jackytse-me.gz.bcebos.com/publish-ionic-ios-enterprise-deployment/publish-ionic-ios-enterprise-deployment-00008.png)

3. 在 Select a method for export 窗口中选择 Save for Enterprise Deployment，点击 Next
![](http://jackytse-me.gz.bcebos.com/publish-ionic-ios-enterprise-deployment/publish-ionic-ios-enterprise-deployment-00009.png)

4. 在 Select a Deployment Team 窗口中选择你的开发团队，点击 Choose
![](http://jackytse-me.gz.bcebos.com/publish-ionic-ios-enterprise-deployment/publish-ionic-ios-enterprise-deployment-00010.png)

5. 在 Deveice Support 窗口选择 Export one app for all compatible devices，如果你发布的应用只针对某个设备，请选择 Export for specific device，并在下拉框中选择设备名称，然后点击 Next

6. 在 Summary 窗口中直接点击 Next

7. 在 Distrbution manifest infomation 窗口中随便填，能通过验证就行，后面再改

8. 选择要导出的位置，点击 Export 导出

## 发布 Ionic 应用

1. 将导出的 ipa 文件上传到支持 SSL 的站点并记录下 URL

2. 修改导出的 plist 文件，找到 software-package 节点，把 ipa 文件的 URL 替换上去，URL 必须是以 https 开头。后面两个图片节点可以注释掉或者删掉
```xml
<array>
  <dict>
    <key>kind</key>
    <string>software-package</string>
    <key>url</key>
    <string>https://test.duapp.com/files/app.ipa</string>
  </dict>
  <!-- <dict>
    <key>kind</key>
    <string>display-image</string>
    <key>url</key>
    <string>https://localhost/app.png</string>
  </dict>
  <dict>
    <key>kind</key>
    <string>full-size-image</string>
    <key>url</key>
    <string>https://localhost/app.jpg</string>
  </dict> -->
</array>
```
3. 把 plist 文件也上传到支持 SSL 的站点并记录下 URL

4. 制作 app 下载页面，将下载链接指向 plist 文件的 URL 即可。下载链接的示例如下：
```html
<a href="itms-services://?action=download-manifest&url=https://test.duapp.com/files/manifest.plist">下载App</a>
```
5. 将 app 下载页面发布到公司网站，在手机中打开站点测试能否成功下载
> 由于苹果要求 iOS 企业应用发布的站点必须要有 SSL 证书，由于公司的网站不具备条件，所已我将 ipa 文件和 plist 文件上传到了百度云的 BOS 上面

## 结语

如有疑问，请在文章下方留言，我在收到留言后会及时答复您

