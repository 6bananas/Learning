# 简介

AJAX ，Asynchronous JavaScript and XML ，异步的 JavaScript 和 XML 。

AJAX 不是新的编程语言，而是一种使用现有标准的新方法，一种用于创建动态网页的技术。

AJAX 仅仅组合了：

- 浏览器内建的 XMLHttpRequest 对象（从 web 服务器请求数据）
- JavaScript 和 HTML DOM（显示或使用数据）

通过在后台与服务器进行少量数据交换，AJAX 可以使网页实现异步更新。这意味着可以在不重新加载整个网页的情况下，对网页的某部分进行更新。

传统的网页（不使用 AJAX）如果需要更新内容，必需重载整个网页面。

如果仔细观察一个 Form 的提交，你就会发现，一旦用户点击 Submit 按钮，表单开始提交，浏览器就会刷新页面，然后在新页面里告诉你操作是成功了还是失败了。如果不幸由于网络太慢或者其他原因，就会得到一个 404 页面。

这就是 Web 的运作原理：一次 HTTP 请求对应一个页面。

如果要让用户留在当前页面中，同时发出新的 HTTP 请求，就必须用 JavaScript 发送这个新请求，接收到数据后，再用 JavaScript 更新页面，这样一来，用户就感觉自己仍然停留在当前页面，但是数据却可以不断地更新。

AJAX 工作原理：

1. 事件触发（如点击按钮或页面加载）。
2. AJAX 请求：通过 JavaScript 创建一个 XMLHttpRequest 对象，向服务器发送请求。
3. 服务器处理请求：服务器接收请求，处理并返回响应数据（JSON、XML、HTML 等）。
4. AJAX 响应处理：浏览器接收响应，使用 JavaScript 在页面上更新内容，而无需重新加载整个页面。

AJAX 是开发者的梦想，因为您能够：

- 不刷新页面更新网页
- 在页面加载后从服务器请求数据
- 在页面加载后从服务器接收数据
- 在后台向服务器发送数据

# XMLHttpRequest

## XMLHttpRequest对象

### 概述

XMLHttpRequest 对象是 AJAX 的基石。

一个标准的 AJAX 请求步骤：

1. 创建 XMLHttpRequest 对象
2. 定义回调函数
3. 打开 XMLHttpRequest 对象
4. 向服务器发送请求

代码：

```javascript
function loadDoc() {
    // 创建对象
    var xhttp = new XMLHttpRequest();
    // 回调函数
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("demo").innerHTML = this.responseText;
        }
    };
    // 设置请求
    xhttp.open("GET", "/demo/js/ajax_info.txt", true);
    // 发送请求
    xhttp.send();
}
```

### 创建

XMLHttpRequest 对象用于同幕后服务器交换数据。

```javascript
var xhttp = new XMLHttpRequest();
```

### 方法

| 方法                                          | 描述                                                         |
| :-------------------------------------------- | :----------------------------------------------------------- |
| new XMLHttpRequest()                          | 创建新的 XMLHttpRequest 对象。                               |
| abort()                                       | 取消当前请求。                                               |
| getAllResponseHeaders()                       | 返回头部信息。                                               |
| getResponseHeader()                           | 返回特定的头部信息。                                         |
| open(*method*, *url*, *async*, *user*, *psw*) | 规定请求。*method*：请求类型 GET 或 POST，*url*：文件位置，*async*：true（异步）或 false（同步），*user*：可选的用户名，*psw*：可选的密码。 |
| send()                                        | 向服务器发送请求，用于 GET 请求。                            |
| send(string)                                  | 向服务器发送请求，用于 POST 请求。                           |
| setRequestHeader()                            | 将标签/值对添加到要发送的标头。                              |

### 属性

| 属性               | 描述                                                         |
| :----------------- | :----------------------------------------------------------- |
| onload             | 定义请求收到答复时要调用的函数。                             |
| onreadystatechange | 定义当 readyState 属性发生变化时调用的函数。                 |
| readyState         | 保存 XMLHttpRequest 的状态。                                                                                   0：请求未初始化                                                                                                                1：服务器连接已建立                                                                                                            2：请求已收到                                                                                                                           3：正在处理请求                                                                                                             4：请求已完成且响应已就绪 |
| responseText       | 以字符串形式返回响应数据。                                   |
| responseXML        | 以 XML 数据返回响应数据。                                    |
| status             | 返回请求的状态号。                                                                                                                     200: "OK"                                                                                                                                          403: "Forbidden"                                                                                                                        404: "Not Found" |
| statusText         | 返回状态文本（比如 "OK" 或 "Not Found"）                     |

每当 readyState 发生变化时就会调用 onreadystatechange 指定的函数。

当 readyState 为 4，status 为 200 时，响应就绪。

## 请求

### 方法

| 方法                           | 描述                                                         |
| :----------------------------- | :----------------------------------------------------------- |
| open(*method*, *url*, *async*) | 规定请求的类型。*method*：请求的类型，GET 还是 POST；*url*：服务器（文件）位置；*async*：true（异步）或 false（同步） |
| send()                         | 向服务器发送请求（用于 GET/POST）                            |
| send(*string*)                 | 向服务器发送请求（用于 POST）                                |

### 例子

```javascript
//GET
xhttp.open("GET", "demo_get.asp", true);
xhttp.send();

xhttp.open("GET", "demo_get2.asp?fname=Bill&lname=Gates", true);
xhttp.send();

//POST
xhttp.open("POST", "demo_post.asp", true);
xhttp.send();

xhttp.open("POST", "ajax_test.asp", true);
xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xhttp.send("fname=Bill&lname=Gates");
/*
setRequestHeader(header, value)：向请求添加 HTTP 头部
header：规定头部名称
value：规定头部值
*/
```

### 同步/异步

通过异步发送请求，JavaScript 不必等待服务器响应，而是可以：

- 在等待服务器响应时执行其他脚本
- 当响应就绪时处理响应

同步请求的代码将等待服务器完成。

不推荐同步的请求，因为 JavaScript 将停止执行直到服务器响应就绪。如果服务器繁忙或缓慢，应用程序将挂起或停止。

## 响应

### 响应属性

| 属性         | 描述                        |
| :----------- | :-------------------------- |
| responseText | 获取字符串形式的响应数据    |
| responseXML  | 获取 XML 数据形式的响应数据 |

`responseText` 属性以 JavaScript 字符串的形式返回服务器响应：

```javascript
document.getElementById("demo").innerHTML = xhttp.responseText;
```

`responseXML` 属性以 XML DOM 的形式返回服务器响应，您可以对其进行解析：

```javascript
var xhttp, xmlDoc, txt, x, i;
// 创建一个新的 XMLHttpRequest 对象
xhttp = new XMLHttpRequest();
// 设置回调函数，处理响应
xhttp.onreadystatechange = function() {
    // 当请求完成且状态为成功时（readyState == 4 且 status == 200）
    if (this.readyState == 4 && this.status == 200) {
        // 获取返回的 XML 文档
        xmlDoc = this.responseXML;
        // 初始化空字符串，用于存放提取的信息
        txt = "";
        // 获取所有 ARTIST 元素
        x = xmlDoc.getElementsByTagName("ARTIST");
        // 遍历所有的 ARTIST 元素，提取其文本内容，即艺术家的名字
        for (i = 0; i < x.length; i++) {
            // 将每个 ARTIST 的名字（子节点的第一个值）添加到 txt 中，并添加换行
            txt = txt + x[i].childNodes[0].nodeValue + "<br>";
        }
        // 将提取的内容显示到 id 为 "demo" 的 HTML 元素中
        document.getElementById("demo").innerHTML = txt;
    }
};
// 初始化一个 GET 请求，目标文件是 "/demo/music_list.xml"，异步请求（true）
xhttp.open("GET", "/demo/music_list.xml", true);
// 发送请求
xhttp.send();
```

### 响应方法

| 方法                           | 描述                         |
| :----------------------------- | :--------------------------- |
| getResponseHeader("head-name") | 从服务器返回特定的头部的信息 |
| getAllResponseHeaders()        | 从服务器返回所有头部信息     |

```javascript
document.getElementById("demo").innerHTML = this.getAllResponseHeaders();

document.getElementById("demo").innerHTML = this.getResponseHeader("Last-Modified");
```

## 多个回调函数

如果网站中有多个 AJAX 任务，则应创建一个执行 XMLHttpRequest 对象的函数，并为每个 AJAX 任务创建一个回调函数。

函数调用应包含 URL 以及响应准备就绪时要调用的函数。

实例：

```js
loadDoc("url-1", myFunction1);

loadDoc("url-2", myFunction2);

function loadDoc(url, cFunction) {
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {cFunction(this);}
  xhttp.open("GET", url);
  xhttp.send();
}

function myFunction1(xhttp) {
  // 这里是动作
}
function myFunction2(xhttp) {
  // 这里是动作
}
```
