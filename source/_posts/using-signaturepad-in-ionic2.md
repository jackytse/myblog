---
title: Ionic 2 集成签名板
filename: using-signaturepad-in-ionic2
date: 2017-04-24 20:01:33
tags:
---


![](http://jackytse-me.gz.bcebos.com/using-signaturepad-in-ionic2/using-signaturepad-in-ionic2-00001.png)

之前做的一个项目中有一个需求，要让用户在手机上签名并保留笔迹。我的第一反应是，这个用 js 应该能够实现，于是 Google 之，还真让我找到了[signature_pad](https://github.com/szimek/signature_pad)；更加让人高兴的是，Github 上有位老兄把它封装成了 Angular Module [angular2-signaturepad](https://github.com/wulfsolter/angular2-signaturepad)，看来是不用重复造轮子了。

<!-- more -->

## 使用 angular2-signaturepad

链接：[angular2-signaturepad](https://www.npmjs.com/package/angular2-signaturepad)

#### 安装
在 Ionic 项目下执行如下命令：

```bash
npm install angular2-signaturepad --save
```

#### 关键代码

```ts
// import into app module
 
import { SignaturePadModule } from 'angular2-signaturepad';
 
...
 
@NgModule({
  declarations: [ ],
  imports: [ SignaturePadModule ],
  providers: [ ],
  bootstrap: [ AppComponent ]
})
 
// then import for use in a component
 
import { Component, ViewChild } from 'angular2/core';
import { SignaturePad } from 'angular2-signaturepad/signature-pad';
 
@Component({
  template: '<signature-pad [options]="signaturePadOptions" (onBeginEvent)="drawStart()" (onEndEvent)="drawComplete()"></signature-pad>'
})
 
export class SignaturePadPage{
 
  @ViewChild(SignaturePad) signaturePad: SignaturePad;
 
  private signaturePadOptions: Object = { // passed through to szimek/signature_pad constructor
    'minWidth': 5,
    'canvasWidth': 500,
    'canvasHeight': 300
  };
 
  constructor() {
    // no-op
  }
 
  ngAfterViewInit() {
    // this.signaturePad is now available
    this.signaturePad.set('minWidth', 5); // set szimek/signature_pad options at runtime
    this.signaturePad.clear(); // invoke functions from szimek/signature_pad API
  }
 
  drawComplete() {
    // will be notified of szimek/signature_pad's onEnd event
    console.log(this.signaturePad.toDataURL());
  }
 
  drawStart() {
    // will be notified of szimek/signature_pad's onBegin event
    console.log('begin drawing');
  }
}
```

## 示例代码

我写了一份示例代码，请参考[这里](https://github.com/SZMSTC/Sample-PengweiSoft/tree/master/src/pages/sample-signaturepad)