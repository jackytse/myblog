---
title: 升级到 Ionic 3
filename: migrate-to-ionic3
date: 2017-05-03 09:45:54
tags:
---

![](http://jackytse-me.gz.bcebos.com/migrate-to-ionic3/migrate-to-ionic3-00001.jpg)

Ionic 3 正式发布已经近一个月了，很多朋友惊呼 Ionic 2 还没上手 Ionic 3 又发布了，会不会又要花很大精力去学习等。认真研究了下，我发现 Ionic 2 到 Ionic 3 的升级只是一些类库的升级，并不需要像 Ionic 1 到 Ionic 2 那样完全重写代码。下面就花点时间给大家介绍下 Ionic 3 的特性以及如何从 Ionic 2 升级到 Ionic 3。

## Ionic 3 的新特性
> 关于 Ionic 3 的详细说明可以参考[官方博客](http://blog.ionic.io/ionic-3-0-has-arrived/)

#### #0 Angular 4
Angular 4 是在3月底发布的。Angular 4 这次更新大致如下：改进 AOT 编译器，分离 animations 包，缩小生成后的代码量，改进 `*ngIf` 和 `*ngFor` 等。详细介绍请参[这篇文章](http://angularjs.blogspot.jp/2017/03/angular-400-now-available.html)。

<!-- more -->

#### #1 兼容 Typescript 2.1 和 2.2
这个其实就是 Angular 4 带来的新特性。

#### #2 IonicPage 装饰器
IonicPage 装饰器将 URL 注册到特定页面。Ionic 使用了一套叫做 deeplink 的 URL 系统，当使用 NavController push 到新页面时，URL 随之更新。注意这和 URL routing 是不同的。关于 IonicPage 的详细介绍请参考[官方文档](http://ionicframework.com/docs/api/navigation/IonicPage/)。

#### #3 Lazy Loading 懒加载
Lazy Loading 可以在初始化时只加载一些必要的代码，非必要的代码分离出来在需要加载的时候再加载之，理论上能让应用加快一定的启动速度。

## 升级到 Ionic 3 

#### #0 修改 npm 依赖包
从 Ionic 2 开始使用了 npm 去管理包，所以我们在 `package.json` 文件的 `dependencies` 节点中修改依赖项。
* 修改 `ionic-angular` 到当前最新的 `3.1.1` 版本。
* `ionic-angular` 依赖 Angular 4.0.2 版本，将所有 `@angular/*` 开头的包修改为 `4.0.2` 版本，增加 `@angular/animations` 包。
* 删除 `ionic-native` 包，添加所需的 `@ionic-native/*` 包，最新版本为 `3.6.1`
* 将 `rxjs` 修改到依赖的 `5.1.1` 版本。
* 将 `zone.js` 修改到依赖的 `0.8.5` 版本。

修改完成后，执行 `npm install` 命令，若 npm 仍提示有依赖问题，参考错误提示逐一解决就好。

#### #1 修改代码以支持 Ionic Native 3.x
参考 [Ionic Native 文档](http://ionicframework.com/docs/native/) 修改 `StatusBar` 和 `SplashScreen` 的引用方式。

#### #2 修改代码以支持 Lazy Loading (非必需)
* 在每个 Page 对应的目录下新建一个 `[pagename].module.ts` 文件，代码大致如下：
```typescript
import { NgModule } from '@angular/core';
import { IonicPageModule } from 'ionic-angular';
import { Tabs } from './tabs';

@NgModule({
  declarations: [
    Tabs,
  ],
  imports: [
    IonicPageModule.forChild(Tabs),
  ],
  exports: [
    Tabs
  ]
})
export class AboutModule {}
```
![](http://jackytse-me.gz.bcebos.com/migrate-to-ionic3/migrate-to-ionic3-00002.png)

* 删除项目中所有 Page 的引入，并将对 Page 类的引用修改成对应 Page 的字符串名称。

![](http://jackytse-me.gz.bcebos.com/migrate-to-ionic3/migrate-to-ionic3-00003.png)

## 错误解决
修改完成后，执行 `ionic serve` 运行，若有报错，则通过错误信息解决之。
我遇到这个错误：`“No provider for ApplicationInitStatus!”`

解决办法是在 `app.module.ts` 文件中添加如下引用：

```typescript 
import { BrowserModule } from '@angular/platform-browser';

...
@NgModule({
  imports: [
    HttpModule, 
    BrowserModule, 
    IonicModule.forRoot(MyApp)
  ]
})
```

## 结束的话

到 Ionic 3 的升级并不麻烦，却能让你的应用性能有很大的提升，所以这个升级还是值得的。如果你对升级 Ionic 3 有什么疑问欢迎给我留言，你也可以参考我写的[示例项目](https://github.com/SZMSTC/Sample-PengweiSoft/commit/4d5247330d3695ec57af388d025a9d982846588f)去尝试解决问题。

