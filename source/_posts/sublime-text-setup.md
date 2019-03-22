---
title: Sublime Text 基本配置
filename: sublime-text-setup
date: 2016-05-18 15:38:25
tags: 
---
 
## Sublime Text 概述

Sublime Text 是一款非常优秀的编辑工具，而且可以跨平台使用
现在 Sublime Text 是我主要使用的编辑工具
下面介绍一些基本配置： 

## 安装 Sublime Text 3

官网：http://www.sublimetext.com
前往下载最新版本的 Sublime Text 安装

<!-- more -->

### 设置系统环境变量

安装好之后要设置系统环境变量，以便我们能从终端里直接打开 Sublime Text

#### MAC OS X 下设置环境变量

打开终端，使用 vim 打开 ~/.bash_profile 文件
在末尾添加 alias subl=’open -a /Applications/Sublime\ Text.app’，然后保存
```bash
$ vim ~/.bash_profile
```
#### Windows 下设置环境变量

打开系统属性，在“高级”选项卡中找到环境变量，单击打开“环境变量”设置窗口
在“系统变量”列表中找到“Path”变量，双击打开“编辑系统变量”窗口
将 Sublime Text 的安装路径添加至“变量值”末尾并保存
![](http://jackytse-me.gz.bcebos.com/sublime-text-setup/sublime-text-setup-00001.png)

打开终端，使用如下命令打开 Sublime Text 并在 Sublime Text 中打开当前目录
```bash
$ subl .
```
## 安装常用插件

Sublime Text 提供了非常强大的插件功能来扩展我们的编辑器

##### 安装 Package Control

同时按下 Ctrl+· 打开 Sublime Console
在 Console 中输入以下代码并按回车键，然后等待安装完成
```
import urllib.request,os,hashlib; h = '2915d1851351e5ee549c20394736b442' + '8bc59f460fa1548d1514676163dafc88'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```
> 参考：https://packagecontrol.io/installation

##### 使用 Package Control 安装插件

同时按下 Command+Shift+P(OSX) 或者 Ctrl+Shift+P(Windows) 呼出Package Control 命令窗口
输入“pci”并按下 Enter 键
![](http://jackytse-me.gz.bcebos.com/sublime-text-setup/sublime-text-setup-00002.png)

在弹出的插件搜索窗口中输入插件名字，然后会自动在下面的列表中显示找到的相关插件
选择要安装的插件，按下 Enter 键，然后你要做的就是等待安装完成

##### 推荐安装插件

| 插件名 | 说明 |
| -- | -- |
| Emmet | 它使用仿CSS选择器的语法来生成代码，大大提高了 HTML/CSS 代码编写的速度 |
| jsFormat | 它能快速格式化 js 代码 |
| TypeScript | 微软官方的 TypeScript 代码插件,提供了代码提示、编译等功能 |
## 结语

Sublime Text 是一款功能非常强大的编辑器，相信使用过之后你一定会和我一样爱上它的