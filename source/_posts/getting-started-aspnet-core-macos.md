---
title: macOS 下 ASP.NET Core 初体验
filename: getting-started-aspnet-core-macos
date: 2016-7-1 16:39:56
tags:
---

![](http://jackytse-me.gz.bcebos.com/getting-started-aspnet-core-macos/getting-started-aspnet-core-macos-00001.png)
2016年6月28日微软在 RedHat 峰会上发布了 .NET Core 1.0、ASP.NET Core 1.0 和 Entity Framework Core 1.0。Net Core 是 .Net 基金会推出的新一代 .Net 平台，能支持 Windows、macOS 和 Linux 平台。Windows 平台下使用 Visual Studio 2015 就可以创建和打开 ASP.NET Core 项目了，今天试试在 macOS 下体验 ASP.NET Core

## 安装 .Net Core SDK

.Net Core SDK 要求 macOS 必须是10.11 (El Capitan) 或者更高版本，幸好我一直都是用最新的系统
 
安装 .Net Core SDK 之前要先通过 [Homebrew](http://brew.sh/) 安装 OpenSSL
```bash
$ brew update
$ brew install openssl
$ brew link --force openssl
```
<!-- more -->

下载安装 [.Net Core SDK](https://go.microsoft.com/fwlink/?LinkID=809124) ，目前微软在 macOS 平台下只发布了 .Net Core 的正式版本1.0，.Net Core SDK 能下载到的依旧是 Preview 2 的版本，相信 .Net Core SDK 正式版本很快会发布

> 参考：[.Net Core](https://www.microsoft.com/net/core)

## 第一个 ASP.Net Core 应用

安装好 .Net Core SDK 之后开始创建一个 Hello World 应用吧
```bash
$ mkdir aspnetcoreapp
$ cd aspnetcoreapp
$ dotnet new
```
更新项目目录下的 “project.json” 文件，增加 Kestrel HTTP server 包到 dependencies 中
```json
{
  "version": "1.0.0-*",
  "buildOptions": {
    "debugType": "portable",
    "emitEntryPoint": true
  },
  "dependencies": {
    "Microsoft.NETCore.App": {
      "type": "platform",
      "version": "1.0.0"
    },
    "Microsoft.AspNetCore.Server.Kestrel": "1.0.0"
  },
  "frameworks": {
    "netcoreapp1.0": {
      "dependencies": {
        "Microsoft.NETCore.App": {
          "type": "platform",
          "version": "1.0.0"
        }
      },
      "imports": "dnxcore50"
    }
  }
}
```
执行 dotnet restore 命令，安装依赖包
```bash
$ dotnet restore
```
在项目目录下添加 “Startup.cs” 文件，代码如下：
```csharp
using System;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
namespace aspnetcoreapp
{
    public class Startup
    {
        public void Configure(IApplicationBuilder app)
        {
            app.Run(context =>
            {
                return context.Response.WriteAsync("Hello from ASP.NET Core!");
            });
        }
    }
}
```
更新项目目录下的 “Program.cs” 文件，代码如下：
```csharp
using System;
using Microsoft.AspNetCore.Hosting;
namespace ConsoleApplication
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var host = new WebHostBuilder()
                .UseKestrel()
                .UseStartup<Startup>()
                .Build();
            host.Run();
        }
    }
}
```
在终端执行 “dotnet run” 命令运行我们创建的应用
```bash
$ dotnet run
```
第一个 ASP.NET Core 引用已经运行起来了！
![](http://jackytse-me.gz.bcebos.com/getting-started-aspnet-core-macos/getting-started-aspnet-core-macos-00002.png)

![](http://jackytse-me.gz.bcebos.com/getting-started-aspnet-core-macos/getting-started-aspnet-core-macos-00003.png)

> 参考：[ASP.NET Core 入门](https://docs.asp.net/en/latest/getting-started.html)

## 使用 Xamarin Studio 作为 ASP.NET Core 的集成开发工具

下载和安装最新版本的 [Xamarin Studio](https://www.xamarin.com/)

> 由于 Xamarin Studio 是在线安装的，再加上国内网络环境的原因，我们很难在线安装好它
> 这里我推荐一个 Xamarin Installtion Mainifest，直接用下载软件下载所需组件并安装

##### 安装开发所需 Add-ins

打开 Xamarin Studio，点击菜单 Xamarin Studio 下的 Add-ins，在 Add-in Manger 里点击 Gallery 选项卡，点击 Repository 下拉菜单，选择 Manage Repositories ，勾选上 Xamarin Studio Add-in Repository(Alpha channel)，然后关闭窗口
![](http://jackytse-me.gz.bcebos.com/getting-started-aspnet-core-macos/getting-started-aspnet-core-macos-00004.png)

在 Add-in Manger 里点击 Repository 下拉菜单，选择 Xamarin Studio Add-in Repository(Alpha channel)，在 IDE extensions 节点下找到 DNX 和 VSCodeDebugger 并安装
![](http://jackytse-me.gz.bcebos.com/getting-started-aspnet-core-macos/getting-started-aspnet-core-macos-00005.png)

> DNX 为 Xamarin Studio 增加创建 .Net Core 项目的功能，VSCodeDebugger 为 Xamarin Studio 增加.Net Core 项目的调试功能

##### 使用 Xamarin Studio

安装好 Add-ins 后，重新启动 Xamarin，点击菜单 File -> New -> Solution，点击 Other 的列表项中的 .Net Core，我们看到这里可以创建 .Net Core 控制台应用 和 .Net Core Web 应用了
![](http://jackytse-me.gz.bcebos.com/getting-started-aspnet-core-macos/getting-started-aspnet-core-macos-00006.png)

我直接从 Github 上拉取了一个 asp.net 的经典 Sample - [MusicStore](https://github.com/aspnet/MusicStore)，这个 Sample 是基于 ASP.Net 5（ASP.NET Core 之前的名字）创建的，然后双击 MusicStore 目录下的 MusicStore.sln 文件，直接使用 Xamarin Studio 打开了该解决方案。不过这里报了一个错误，可能由于这个项目是在 Windows 下创建的，有一些不兼容吧。不过后面我发现这没什么影响，因为只有一个叫 MusicStore.Standalone 的项目没有正确加载，MusicStroe 这个主要项目正确加载了
![](http://jackytse-me.gz.bcebos.com/getting-started-aspnet-core-macos/getting-started-aspnet-core-macos-00007.png)

直接点运行，是可以运行成功的，然后打开 Safari，输入 [http://localhost:5000](http://localhost:5000) 可以正常打开 Music Store，Yes！
![](http://jackytse-me.gz.bcebos.com/getting-started-aspnet-core-macos/getting-started-aspnet-core-macos-00008.png)

随便点了几下，功能基本正常，不过由于 macOS 下没有 SQL Server LocalDB，所以 MusicStore 使用的是内存数据库，也就是说重新启动应用后，之前的用户数据会丢失
我在 Register 里下了一个断点，然后注册个用户，断点这里是可以正常停下并获取到刚才输入的信息，调试也基本正常了
![](http://jackytse-me.gz.bcebos.com/getting-started-aspnet-core-macos/getting-started-aspnet-core-macos-00009.png)

由于 Xamarin Studio 原生支持 Git，所以咱们开发的项目可以直接 Push 到远端仓库中，这样一来，使用 Xamarin Studio 进行 ASP.NET Core 应用的开发、调试、部署都没啥打问题了

## 结语

微软从认为 Linux 和开源是“癌症”，到现在拥抱 Linux 和开源，经历了很长一段时间，期望微软在开源领域再创辉煌，也希望越来越多的 Coder 去关注和使用 .Net 技术，因为它真的很棒

