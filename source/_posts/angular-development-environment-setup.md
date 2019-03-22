---
title: Angular 开发环境搭建
filename: angular-development-environment-setup
date: 2017-06-22 10:29:57
tags:
---

![](http://jackytse-me.gz.bcebos.com/angular-development-environment-setup/angular-development-environment-setup-00001.jpg)

Angular 是一款开源 JavaScript 框架，由Google 维护，用来协助单一页面应用程序运行的。它的目标是增强基于浏览器的应用，使开发和测试变得更加容易。目前最新的 Angular 版本是 `v4.2.3`

## 开始搭建 Angular 开发环境

搭建 Angular 开发环境需要的步骤：

* Node.js
* 配置 npm
* Angular CLI

<!-- more -->

##### 安装 Node.js

下载安装 [Node.js](https://nodejs.org/) ，下载最新的 LTS 版本即可，目前最新的版本是 `v6.11.0 LTS`

#### 配置 npm 

安装好 `Node.js` 之后需要配置一下 npm 国内源
```bash
$ npm config set registry="https://registry.npm.taobao.org/"
```

或者 使用 `nrm` 去管理 `npm` 源
```bash
$ npm i nrm -g
$ nrm use taobao
```

由于 `node-sass` 包的下载链接被墙了，所以要配置一下 `node-sass` 的国内源
```bash
$ npm config set sass_binary_site="https://npm.taobao.org/mirrors/node-sass/"
```

#### 安装 Angular CLI
Angular CLI 用于创建、编译、发布 Angular 项目

```bash
$  npm i @angular/cli -g
```

## 创建测试项目
打开终端，创建一个基于 `scss` 样式的 Angular 项目

```bash
$  ng new my-app --style=scss
```

项目创建成功后会提示 `Project 'my-app' successfully created.`，然后进入项目目录并运行试试吧

```bash
$  cd my-app && ng serve -o
```

> 更多 Angular CLI 的命令请参考 [Angular CLI 官网](https://cli.angular.io/)

## 结语
如果你对在搭建 Angular 环境中遇到什么问题欢迎给我留言

