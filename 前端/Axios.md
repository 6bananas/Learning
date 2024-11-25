# 简介

Axios 是一个基于 *Promise* 的 HTTP 客户端，用于在浏览器和 *Node.js* 中发送 HTTP 请求。它封装了 XMLHttpRequest（在浏览器环境下）和 Node.js 的 http 模块，提供了简洁的 API 和扩展功能，用于与服务器进行通信。

Axios 不是一个框架，而是一个 HTTP 请求库。它的主要功能是简化发送 HTTP 请求的过程，并提供一些高级功能，如拦截器、超时设置、请求取消等。

Axios 是一个库，它的主要职责是处理 HTTP 请求，与框架不同，它不会限制你如何构建应用程序。你可以在任意框架（如 React、Vue.js、Angular）或者没有框架的情况下使用它。

适用场景：

1. 单独使用：在没有框架的前端项目中用来处理 HTTP 请求；
2. 与框架结合：作为辅助工具与框架（如 React、Vue）结合使用，管理数据请求；
3. Node.js 环境：用在后端代码中，处理 API 请求或与其他服务通信。

Axios 的特点：

1. 支持 Promise：基于 *ES6* 的 Promise ，使得代码更加简洁，易于链式调用；
2. 支持多种请求方式： 如 GET 、POST 、PUT 、DELETE 等；
3. 自动转换 JSON：请求数据和响应数据会自动序列化/反序列化 JSON ；
4. 支持拦截器：提供请求和响应拦截器，方便统一处理错误、身份认证等逻辑；
5. 取消请求：支持请求的取消；
6. 支持请求超时：可以设置超时时间，自动终止超时的请求；
7. 运行环境广泛：可以在浏览器和 Node.js 环境下使用。

与 AJAX 的区别：

| **对比项**       | **Axios**                          | **AJAX（原生 XMLHttpRequest）**      |
| ---------------- | ---------------------------------- | ------------------------------------ |
| **封装程度**     | 高度封装，API 更简洁易用           | 需要手动编写较多代码，处理逻辑较繁琐 |
| **支持 Promise** | 原生支持                           | 不支持，需要手动封装 Promise         |
| **拦截器**       | 提供请求和响应的拦截器             | 不支持                               |
| **JSON 处理**    | 自动序列化/反序列化 JSON           | 需要手动处理 JSON                    |
| **兼容性**       | 兼容性好，支持现代浏览器和 Node.js | 仅适用于浏览器                       |
| **功能扩展**     | 支持取消请求、超时设置、全局配置等 | 需要手动实现                         |

可以理解为 Axios 是比 AJAX 更高级的封装，Plus 版的 AJAX 。

安装：

```bash
npm install axios
```

> **Node.js**
>
> Node.js 是一个基于 Chrome V8 引擎构建的 JavaScript 运行时环境，用于在服务端运行 JavaScript 。
>
> 特点：
>
> - 非阻塞 I/O：基于事件驱动和异步 I/O ，非常适合高并发的场景。
> - 跨平台：支持 Windows、macOS 和 Linux 。
> - 模块化：内置模块（如 fs 、http 、path）以及包管理工具 npm ，方便扩展功能。
> - 单线程：使用单线程模型，通过事件循环机制处理并发。
>
> 应用场景：
>
> - Web 服务器开发。
> - 构建实时应用程序（如聊天系统）。
> - 命令行工具开发。
> - 构建 RESTful API 。

> **ES6**
>
> ES6 是 ECMAScript 的第六个版本，于 2015 年发布，也叫 ECMAScript 2015 ，是 JavaScript 的重要更新版本。它引入了许多新特性，让代码更简洁、高效。
>
> ECMAScript 是一种由 ECMA International 制定的脚本语言规范，定义了脚本语言的核心特性。JavaScript 是 ECMAScript 的一种实现，其他实现还包括 JScript（微软）和 ActionScript（Adobe Flash）。
>
> ECMAScript 的起源：
>
> - 1995 年，JavaScript 由 Brendan Eich 在 Netscape 公司开发。
> - 1997 年，为了统一标准化，Netscape 将 JavaScript 提交给 ECMA 国际组织。
> - 1997 年，ECMA 发布了第一个 ECMAScript 标准（ECMA-262）。
>
> ECMAScript 是一套规范，定义了脚本语言的语法、类型、对象模型等，而 JavaScript 则在此基础上扩展了浏览器相关功能（如 DOM 操作和 BOM 操作）。
>
> ECMAScript 与 JavaScript 的关系：
>
> - ECMAScript 是一种标准，而 JavaScript 是它的一种具体实现。
> - JavaScript 除了实现 ECMAScript 标准，还包含浏览器特定的功能，如操作 DOM 的能力。
> - ECMAScript 是建筑设计图纸（规范），JavaScript 是根据设计图纸建造的房子（实现）。
>
> 现在，每年都会推出一个 ECMAScript 新版本，确保 JavaScript 的发展能够适应现代需求。

> **Promise**
>
> Promise 是 ES6 引入的一种用于处理异步操作的对象，简化了回调函数的层级嵌套（“回调地狱”问题）。

# 发送请求

## API

axios(config) 方法接收一个对象，这个对象包含了一些对请求的配置， axios 会根据这些配置来发送对应的 HTTP 请求。

最基本的配置项应该包括：

- method - 请求的方法（可选值 get 、post 等）
- url - 请求的地址（必须项）
- data - 请求发送的数据（post 等请求需要）

默认的请求方法是 get ，所以如果是 get 请求可以不设置 method 。

```javaScript
// 发送 POST 请求
axios({
  method: 'post',
  url: '/user/12345',
  data: {
    firstName: 'Fred',
    lastName: 'Flintstone'
  }
});
```

请求响应的处理在 then 和 catch 回调中，请求正常会进入 then ，请求异常则会进 catch：

```javaScript
// 发送 POST 请求
axios({
  method: 'post',
  url: '/user/12345',
  data: {
    firstName: 'Fred',
    lastName: 'Flintstone'
  }
}).then(res => {
    consloe.log(res)
}).catch(err => {
    console.log(err)
})
// 发送 GET 请求（默认的方法）
axios('/user/12345');
```

## 请求别名

axios 还为每一个 HTTP 的方法提供与之对应的方法来发送对应的请求：

```javaScript
// 发送get请求
axios.get('/user?ID=12345').then(function (response) {
  console.log(response);
}).catch(function (error) {
  console.log(error);
});
// 发送post请求
axios.post('/user', {
  firstName: 'Fred',
  lastName: 'Flintstone'
}).then(function (response) {
  console.log(response);
}).catch(function (error) {
  console.log(error);
});
```

其他的方法使用类似，略。

注意，在使用别名方法时，url 、method 、data 这些属性都不必在配置中指定。

## 请求配置

```javascript
{
   // `url` 是用于请求的服务器 URL
  url: '/user',
  // `method` 是创建请求时使用的方法
  method: 'get', // default
  // `baseURL` 将自动加在 `url` 前面，除非 `url` 是一个绝对 URL。
  // 它可以通过设置一个 `baseURL` 便于为 axios 实例的方法传递相对 URL
  baseURL: 'https://some-domain.com/api/',
  // `transformRequest` 允许在向服务器发送前，修改请求数据
  // 只能用在 'PUT', 'POST' 和 'PATCH' 这几个请求方法
  // 后面数组中的函数必须返回一个字符串，或 ArrayBuffer，或 Stream
  transformRequest: [function (data, headers) {
    // 对 data 进行任意转换处理
    return data;
  }],
  // `transformResponse` 在传递给 then/catch 前，允许修改响应数据
  transformResponse: [function (data) {
    // 对 data 进行任意转换处理
    return data;
  }],
  // `headers` 是即将被发送的自定义请求头
  headers: {'X-Requested-With': 'XMLHttpRequest'},
  // `params` 是即将与请求一起发送的 URL 参数
  // 必须是一个无格式对象(plain object)或 URLSearchParams 对象
  params: {
    ID: 12345
  },
  // `paramsSerializer` 是一个负责 `params` 序列化的函数
  paramsSerializer: function(params) {
    return Qs.stringify(params, {arrayFormat: 'brackets'})
  },
  // `data` 是作为请求主体被发送的数据
  // 只适用于这些请求方法 'PUT', 'POST' 和 'PATCH'
  // 在没有设置 `transformRequest` 时，必须是以下类型之一：
  // - string, plain object, ArrayBuffer, ArrayBufferView, URLSearchParams
  // - 浏览器专属：FormData, File, Blob
  // - Node 专属： Stream
  data: {
    firstName: 'Fred'
  },
  // `timeout` 指定请求超时的毫秒数(0 表示无超时时间)
  // 如果请求花费了超过 `timeout` 的时间，请求将被中断
  timeout: 1000,
  // `withCredentials` 表示跨域请求时是否需要使用凭证
  withCredentials: false, // default
  // `adapter` 允许自定义处理请求，以使测试更轻松
  // 返回一个 promise 并应用一个有效的响应
  adapter: function (config) {
    /* ... */
  },
  // `auth` 表示应该使用 HTTP 基础验证，并提供凭据
  // 这将设置一个 `Authorization` 头，覆写掉现有的任意使用 `headers` 设置的自定义 `Authorization`头
  auth: {
    username: 'janedoe',
    password: 's00pers3cret'
  },
  // `responseType` 表示服务器响应的数据类型，可以是 'arraybuffer', 'blob', 'document', 'json', 'text', 'stream'
  responseType: 'json', // default
  // `responseEncoding` 指示用于解码响应的编码
  // 注意：忽略“流”或客户端请求的“responseType”
  responseEncoding: 'utf8', // default
  // `xsrfCookieName` 是用作 xsrf token 的值的 cookie 的名称
  xsrfCookieName: 'XSRF-TOKEN', // default
  // `xsrfHeaderName` 是携带 xsrf token 值的 http header 的名称
  xsrfHeaderName: 'X-XSRF-TOKEN', // default
   // `onUploadProgress` 允许为上传处理进度事件
  onUploadProgress: function (progressEvent) {
    // 使用本机进度事件做任何你想做的事
  },
  // `onDownloadProgress` 允许为下载处理进度事件
  onDownloadProgress: function (progressEvent) {
    // 对原生进度事件的处理
  },
   // `maxContentLength` 定义允许的响应内容的最大尺寸
  maxContentLength: 2000,
  // `validateStatus` 定义对于给定的 HTTP 响应状态码是 resolve 或 reject  promise 。如果 `validateStatus` 返回 `true` (或者设置为 `null` 或 `undefined`)，promise 将被 resolve; 否则，promise 将被 rejecte
  validateStatus: function (status) {
    return status >= 200 && status < 300; // default
  },
  // `maxRedirects` 定义在 node.js 中 follow 的最大重定向数目
  // 如果设置为0，将不会 follow 任何重定向
  maxRedirects: 5, // default
  // `socketPath` 定义了一个在 node.js 中使用的 UNIX Socket。
  // 例如 '/var/run/docker.sock' 将请求发送到 docker 守护进程。
  // 只能指定 `socketPath` 或 `proxy`。
  // 如果两者都指定，则使用 `socketPath`。
  socketPath: null, // default
  // `httpAgent` 和 `httpsAgent` 分别在 node.js 中用于定义在执行 http 和 https 时使用的自定义代理。允许像这样配置选项：
  // `keepAlive` 默认没有启用
  httpAgent: new http.Agent({ keepAlive: true }),
  httpsAgent: new https.Agent({ keepAlive: true }),
  // 'proxy' 定义代理服务器的主机名称和端口
  // `auth` 表示 HTTP 基础验证应当用于连接代理，并提供凭据
  // 这将会设置一个 `Proxy-Authorization` 头，覆写掉已有的通过使用 `header` 设置的自定义 `Proxy-Authorization` 头。
  proxy: {
    host: '127.0.0.1',
    port: 9000,
    auth: {
      username: 'mikeymike',
      password: 'rapunz3l'
    }
  },
  // `cancelToken` 指定用于取消请求的 cancel token
  cancelToken: new CancelToken(function (cancel) {
  })
}
```

# 响应结构

通过 axios 发出的请求的响应结果中， axios 会加入一些字段，如下：

```javaScript
{
  // `data` 由服务器提供的响应
  data: {},
  // `status` 来自服务器响应的 HTTP 状态码
  status: 200,
  // `statusText` 来自服务器响应的 HTTP 状态信息
  statusText: 'OK',
  // `headers` 服务器响应的头
  headers: {},
   // `config` 是为请求提供的配置信息
  config: {},
  // `request` 是生成此响应的请求
  // 它是 node.js 中的最后一个 ClientRequest 实例（在重定向中）和浏览器的 XMLHttpRequest 实例
  request: {}
}
```

其中的 data 是后端返回的数据，一般我们也只需要关注 response 中的 data 字段就行。

# 创建实例

可以使用自定义配置新建一个 axios 实例 axios.create([config])

```javaScript
const instance = axios.create({
  baseURL: 'https://some-domain.com/api/',
  timeout: 1000,
  headers: {'X-Custom-Header': 'foobar'}
});
```

以下是自定义实例所拥有的方法：

- request(config)
- get(url[, config])
- delete(url[, config])
- head(url[, config])
- options(url[, config])
- post(url[, data[, config]])
- put(url[, data[, config]])
- patch(url[, data[, config]])

axios 会把这些方法中的 config 和创建实例时指定的 config 合并到一起使用。

# 配置默认值

## 全局的默认值

使用 axios.defaults 设置：

```javaScript
axios.defaults.baseURL = 'https://api.example.com';
axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
```

## 自定义实例的默认值

使用 instance.defaults 设置：

```javaScript
// Set config defaults when creating the instance
const instance = axios.create({
  baseURL: 'https://api.example.com'
});
// Alter defaults after instance has been created
instance.defaults.headers.common['Authorization'] = AUTH_TOKEN;
```

## 配置的优先顺序

在创建实例 axios.create() 时传入的配置会被 instance.defaults 中设置的同一个配置的值覆盖，在具体的请求方法中的配置会覆盖前两者：

```javaScript
// 使用由库提供的配置的默认值来创建实例
// 此时超时配置的默认值是 `0`
var instance = axios.create();
// 覆写库的超时默认值
// 现在，在超时前，所有请求都会等待 2.5 秒
instance.defaults.timeout = 2500;
// 为已知需要花费很长时间的请求覆写超时设置
instance.get('/longRequest', {
  timeout: 5000
});
```

# 拦截器

axios.interceptors.request - 请求拦截器

axios.interceptors.response - 响应拦截器

```javaScript
// 添加请求拦截器
axios.interceptors.request.use(function (config) {
  // 在发送请求之前做些什么
  config.header["Token"] = "xxxx"
  return config;
}, function (error) {
  // 对请求错误做些什么
  return Promise.reject(error);
});

// 添加响应拦截器
axios.interceptors.response.use(function (response) {
  // 对响应数据做点什么
  if (response.status === 200){
    return response.data
  } else {
    return Promise.reject(new Error('error'))
  }
}, function (error) {
  // 对响应错误做点什么
  return Promise.reject(error);
});
```

如果想取消拦截器，可以通过使用一个变量来接收设置拦截器时返回的实例，然后使用 eject 来取消拦截器：

```javaScript
const myInterceptor = axios.interceptors.request.use(function () {...});
axios.interceptors.request.eject(myInterceptor);
```



