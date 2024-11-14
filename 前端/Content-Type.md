Content-Type 用于向接收方说明传输资源的媒体类型，语法如下：

```
Content-Type: text/html; charset=UTF-8
Content-Type: multipart/form-data; boundary=something
```

包含三个部分：

- **media type**：声明传输数据的媒体类型（MIME）；
- **charset**：声明传输数据采用的是何种字符集；
- **boundary**：数据分界符，有多部分数据实体时（multipart/form-data、multipart/byteranges），该指令是必需的，用于封装消息的多个部分的边界；其由 1 到 70 个字符组成，浏览器中会自动生成。

一般 GET 是不需要 Content-Type 的，因为传的数据太简单了，直接加在 url 里就可以了。

POST 常用：

-  **application/x-www-form-urlencoded**：该值是表单默认的编码方式，使用该值时，提交表单时的内容必须经过如下规则编码：

  - 空格转换为 “+” 号；
  - 非字母数字的其它字符转换为类似于“%E0”的两位 16 进制表示的 ASCII 码；
  - 换行符被转换为“CR LF”；
  - 数据项名称和数据值以“=”号分割，数据项与数据项之间以“&”分割。

  ```html
  <form action="https://xxx.com/api/submit" method="post">
      <input type="text" name="name" value="Javon Yan">
      <input type="text" name="age" value="18">
      <button type="submit">Submit</button>
  </form>
  
  
  Content-Type: application/x-www-form-urlencoded
  
  name=Javon+Yan&age=18
  ```

- **multipart/form-data**：对于二进制文件或者非 ASCII 字符的传输，application/x-www-form-urlencoded 是低效的。对于包含文件、二进制数据、非 ASCII 字符的内容，应该使用 multipart/form-data 。 multipart/form-data 的请求体包含多个部分，需要通过 boundary 字符分割。

  ```html
  <form action="https://xxx.com/api/submit" method="post" enctype="multipart/form-data">
      <input type="text" name="name" value="Javon Yan">
      <input type="text" name="age" value="18">
      <input type="file" name="file">
      <button type="submit">Submit</button>
  </form>
  
  
  Content-Type: multipart/form-data; boundary=----WebKitFormBoundaryujecLxDFPt6acCab
  
  ------WebKitFormBoundaryujecLxDFPt6acCab
  Content-Disposition: form-data; name="name"
  
  Javon Yan
  ------WebKitFormBoundaryujecLxDFPt6acCab
  Content-Disposition: form-data; name="age"
  
  18
  ------WebKitFormBoundaryujecLxDFPt6acCab
  Content-Disposition: form-data; name="file"; filename="avatar.png"
  Content-Type: image/png
  
  ... (png binary data) ....
  ------WebKitFormBoundaryujecLxDFPt6acCab--
  ```

- **application/json**：以序列化的 JSON 字符串形式传输。

- **application/octet-stream**：

  用于传输二进制数据，可用于上传文件的场景。可具体点如 application/pdf，指定特定的二进制文件类型。application/octet-stream 就像对于 text 文件类型若没有特定的子类型就使用 text/plain ，类似的，二进制文件没有特定或已知的子类型，就使用 application/octet-stream，这是应用程序文件的默认值，一般很少直接使用 。
  对于 application/octet-stream，只能提交二进制，而且只能提交一个二进制，如果提交文件的话，只能提交一个文件，后台接收参数只能有一个，而且只能是流（或者字节数组）。

- **其他**：

  - 文本：text/plain、text/html、text/css、text/javascript、text/xml
  - 图片：image/gif、image/png、image/jpeg
  - 视频：video/webm、video/ogg
  - 音频：audio/midi、audio/mpeg、audio/webm、audio/ogg、audio/wav