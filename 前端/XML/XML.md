# 概述

- XML：可扩展标记语言（EXtensible Markup Language），设计宗旨是传输数据，而非显示数据（HTML 的事）。

- XML 没有固定的标签，一切都需要程序员自定义。

- XML 标签对大小写敏感。

- XML 文档声明：

  ```xml
  <?xml version="1.0" encoding="ISO-8859-1"?>
  ```

- XML 树结构：

  ```xml
  <note>
  <to>George</to>
  <from>John</from>
  <heading>Reminder</heading>
  <body>Don't forget the meeting!</body>
  </note>
  ```

  ```xml
  <bookstore>
  <book category="COOKING">
    <title lang="en">Everyday Italian</title> 
    <author>Giada De Laurentiis</author> 
    <year>2005</year> 
    <price>30.00</price> 
  </book>
  <book category="CHILDREN">
    <title lang="en">Harry Potter</title> 
    <author>J K. Rowling</author> 
    <year>2005</year> 
    <price>29.99</price> 
  </book>
  <book category="WEB">
    <title lang="en">Learning XML</title> 
    <author>Erik T. Ray</author> 
    <year>2003</year> 
    <price>39.95</price> 
  </book>
  </bookstore>
  ```

# 语法

## 概述

- 属性值必须加引号。

- 注释：同 HTML 。

- HTML 会把多个连续的空格字符裁减（合并）为一个，而 XML 不会。

- 元素命名规则：

  - 名称可以含字母、数字以及其他的字符
  - 名称不能以数字或者标点符号开始
  - 名称不能以字符 “xml”（或者 XML、Xml）开始
  - 名称不能包含空格
  - 避免 "-" 、 "." 、 ":" 字符。

- 请尽量带上属性，因为这对处理该 XML 文档的软件来说很重要，如：

  ```xml
  <file type="gif">computer.gif</file>
  ```

  但是，在 XML 中，您应该尽量避免使用属性。如果信息感觉起来很像数据，那么请使用子元素吧，如：

  ```xml
  <person sex="female">
    <firstname>Anna</firstname>
    <lastname>Smith</lastname>
  </person> 
  
  <person>
    <sex>female</sex>
    <firstname>Anna</firstname>
    <lastname>Smith</lastname>
  </person> 
  ```

- 元素可拥有 id 属性，作用同 HTML 。

## 实体

### 内部实体

| 实体编码 | 真实内容 | 解释   |
| -------- | -------- | ------ |
| \&lt;    | <        | 小于   |
| \&gt;    | >        | 大于   |
| \&amp;   | &        | 和号   |
| \&apos;  | '        | 单引号 |
| \&quot;  | "        | 引号   |

注：只有字符 "<" 和 "&" 是非法字符。

### 字符实体

指用十进制格式（&#aaa;）或十六进制格式（\&#xaaa;）来指定任意 Unicode 字符。

对 XML 解析器而言，字符实体与直接输入指定字符的效果完全相同。

### DTD实体

### 参数实体

只能定义在 DTD 中，且只有 DTD 才能引用参数实体。

参数实体在 DTD 中解析优先级高于 XML 内部实体。

语法：

```dtd
<!ENTITY % 实体名称 "实体的值">
或
<!ENTITY % 实体名称 SYSTEM "url">
```

实例：

```dtd
<!DOCTYPE test [
        <!ENTITY % first "Hello">
        <!ENTITY % second "&first; world!">
        %second;
    ]>
//%second <=> Hello world!
```

# 进阶

## 美化

浏览器打开 XML 文件将显示源代码，可使用 CSS 美化显示结果，这样显示出来的就不是丑陋的源码格式了。

- [美化前](https://www.w3school.com.cn/example/xmle/cd_catalog.xml)

- [美化后](https://www.w3school.com.cn/example/xmle/cd_catalog_with_css.xml)

- 链接 CSS 方式：

  ```xml
  <?xml-stylesheet type="text/css" href="url"?>
  ```

## 命名空间

### 命名冲突

这个 XML 文档携带着某个表格中的信息：

```xml
<table>
   <tr>
   <td>Apples</td>
   <td>Bananas</td>
   </tr>
</table>
```

这个 XML 文档携带有关桌子的信息：

```xml
<table>
   <name>African Coffee Table</name>
   <width>80</width>
   <length>120</length>
</table>
```

假如这两个 XML 文档被一起使用，由于两个文档都包含带有不同内容的 \<table> 元素，就会发生命名冲突。

XML 解析器无法确定如何处理这类冲突。

### 使用前缀避免命名冲突

```xml
<h:table>
   <h:tr>
   <h:td>Apples</h:td>
   <h:td>Bananas</h:td>
   </h:tr>
</h:table>
```

```xml
<f:table>
   <f:name>African Coffee Table</f:name>
   <f:width>80</f:width>
   <f:length>120</f:length>
</f:table>
```

### 使用命名空间避免命名冲突

```xml
<h:table xmlns:h="http://www.w3.org/TR/html4/">
   <h:tr>
   <h:td>Apples</h:td>
   <h:td>Bananas</h:td>
   </h:tr>
</h:table>
```

```xml
<f:table xmlns:f="http://www.w3school.com.cn/furniture">
   <f:name>African Coffee Table</f:name>
   <f:width>80</f:width>
   <f:length>120</f:length>
</f:table>
```

### 命名空间

Namespace (xmlns)，XML 命名空间属性被放置于元素的开始标签之中，语法：

```xml
xmlns:前缀="url"
```

当命名空间被定义在元素的开始标签中时，所有带有相同前缀的子元素都会与同一个命名空间相关联。

注意，用于标示命名空间的地址不会被解析器用于查找信息。

### 默认命名空间

为元素定义默认的命名空间可以让我们省去在所有的子元素中使用前缀的工作，语法：

```xml
xmlns="url"
```

示例：

```xml
<table xmlns="http://www.w3.org/TR/html4/">
   <tr>
   <td>Apples</td>
   <td>Bananas</td>
   </tr>
</table>
```

## CDATA

CDATA（Character Data）是用来表示字符数据的部分，允许包含特殊字符（如 < 和 &）而不需要进行转义。CDATA 的主要作用是使文本内容中的所有字符都能原样显示，而不需要关心它们是否是 XML 的保留字符。

所有 XML 文档中的文本（PCDATA）均会被解析器解析，只有 CDATA 区段中的文本会被解析器忽略。

> PCDATA（Parsed Character Data）表示经过解析的字符数据。它是 XML 文档中普通文本内容的一部分，并且会按照 XML 语法规则进行解析，转换为对应的元素或实体。它允许在元素内部包含文本，并且在解析时，某些特殊字符（如 `<`、`>` 和 `&`）会被转换为对应的转义字符。
>
> 如果在 XML 中定义了元素为 PCDATA ，那么该元素的内容会被视为普通文本，XML 解析器会自动将其中的特殊字符转义。
>
> PCDATA 是指普通的字符数据，它会被解析为 XML 标记，并且其中的特殊字符会被转义。
>
> CDATA 是指未经解析的字符数据，允许在其中包含任何字符（包括 `<` 和 `&`），不会进行转义。
>
> PCDATA 用于存储大多数普通文本数据，这些数据需要根据 XML 语法规则进行解析。
>
> CDATA 用于存储不希望被解析的文本数据，通常包含不希望被转义的字符（如嵌入的 HTML 代码、JavaScript 等）。

在 XML 元素中，"<" 和 "&" 是非法的。而某些文本，比如 JavaScript 代码，包含大量 "<" 或 "&" 字符。为了避免错误，可以将脚本代码定义为 CDATA 。

CDATA 部分由 `<![CDATA[` 开始，由 `]]>` 结束：

```xml
<script>
<![CDATA[
function matchwo(a,b){
	if (a < b && a < 0){
  		return 1;
  	}
	else{
  		return 0;
 	}
}
]]>
</script>
```

注意，CDATA 部分不能包含字符串 `]]>` ，也不允许嵌套 CDATA 。
