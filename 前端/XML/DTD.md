> 时代的遗物。
>
> XML 实际上也是时代的遗物，当初为了学 XML 注入专门学的，后来发现开发中也用得到。
>
> 而 DTD 就是很明显的时代的遗物了，因为发现只学了 XML 好像并没有对 XML 注入的学习有很大的帮助，DTD 才是。

# 概述

- DTD：Document Type Definition，文档类型定义，用于定义 XML 文档的结构。
- 注释：//

# DOCTYPE声明

## 内部声明

DTD 位于 XML 文档内。

- 语法：

  ```dtd
  <!DOCTYPE xxx [内容]>
  //xxx是一个DTD标识名，一般是根元素名称
  ```

- 示例：

  ```xml-dtd
  <?xml version="1.0"?>
  <!DOCTYPE note [
    <!ELEMENT note (to,from,heading,body)>
    <!ELEMENT to      (#PCDATA)>
    <!ELEMENT from    (#PCDATA)>
    <!ELEMENT heading (#PCDATA)>
    <!ELEMENT body    (#PCDATA)>
  ]>
  <note>
    <to>George</to>
    <from>John</from>
    <heading>Reminder</heading>
    <body>Don't forget the meeting!</body>
  </note>
  ```

- 解释：
  - !DOCTYPE note：定义此文档是 note 类型的文档。
  - !ELEMENT note：定义 note 元素有四个元素："to、from、heading,、body"。
  - !ELEMENT to：定义 to 元素为 "#PCDATA" 类型。

## 外部声明

DTD 位于 XML 文档外（note.dtd）。

- 语法：

  ```dtd
  <!DOCTYPE xxx SYSTEM "note.dtd">
  //xxx是一个DTD标识名，一般是DTD文件名
  ```

- 示例：

  ```xml-dtd
  <?xml version="1.0"?>
  <!DOCTYPE note SYSTEM "note.dtd">
  <note>
  <to>George</to>
  <from>John</from>
  <heading>Reminder</heading>
  <body>Don't forget the meeting!</body>
  </note> 
  ```

  note.dtd：

  ```dtd
  <!ELEMENT note (to,from,heading,body)>
  <!ELEMENT to (#PCDATA)>
  <!ELEMENT from (#PCDATA)>
  <!ELEMENT heading (#PCDATA)>
  <!ELEMENT body (#PCDATA)>
  ```

# 元素

声明一个元素：

```dtd
<!ELEMENT 元素名称 类别>
```

类别如下：

1、**#PCDATA**

```xml-dtd
<!ELEMENT title (#PCDATA)>
```

2、**子元素列表**

- 定义：该元素包含其他子元素，子元素按指定的顺序出现，并且每个子元素可以出现一次或多次。

- 格式：

  - `子元素1 子元素2`：表示按顺序出现的子元素。
  - `子元素?`：表示子元素可选，最多出现一次。
  - `子元素*`：表示子元素可以出现零次或多次。
  - `子元素+`：表示子元素至少出现一次。

- 例子：

  ```xml-dtd
  <!ELEMENT note (to, from, heading, body)>
  ```

3、**元素内容的混合（#PCDATA + 子元素）**

- 定义：该元素的内容既包含文本（#PCDATA），也可以包含其他子元素。文本和子元素可以交替出现。

- 格式：通过 `#PCDATA` 和元素的名称混合，表示文本和子元素之间的交替顺序。

- 例子：

  ```xml-dtd
  <!ELEMENT paragraph (#PCDATA | bold | italic)*>
  ```

  这里定义了 `paragraph` 元素，它的内容可以包含文本（#PCDATA），也可以包含 `bold` 或 `italic` 元素，且它们的顺序可以交替，且可以重复出现。

  - `|`：表示“或”，意味着元素的内容可以是 `#PCDATA` 、`bold` 或 `italic` 中的任何一个。
  - `*`：表示可以重复零次或多次。

4、 **空元素**

- 定义：该元素没有任何内容，通常用来表示自闭合标签的元素（例如 HTML 中的 `<img>` 标签）。

- 格式：通过 `EMPTY` 来指定元素为空元素。

- 例子：

  ```xml-dtd
  <!ELEMENT image EMPTY>
  ```

5、**任意子元素**

- 定义：该元素可以包含任何类型的子元素，甚至其他文档类型中的元素。

- 格式：通过 `ANY` 来表示该元素可以包含任意的子元素。

- 例子：

  ```xml-dtd
  <!ELEMENT document ANY>
  ```

更多声明元素的例子：

- 只出现一次

  ```xml-dtd
  <!ELEMENT note (message)>
  ```

  message 子元素必须出现一次，并且必须只在 "note" 元素中出现一次。

- 至少出现一次

  ```xml-dtd
  <!ELEMENT note (message+)>
  ```

​		message 子元素必须在 "note" 元素内出现至少一次。

- 出现零次或多次

  ```xml-dtd
  <!ELEMENT note (message*)>
  ```

  message 子元素可在 "note" 元素内出现零次或多次。

- 出现零次或一次

  ```xml-dtd
  <!ELEMENT note (message?)>
  ```

  message 子元素可在 "note" 元素内出现零次或一次。

- “或”

  ```xml-dtd
  <!ELEMENT note (to,from,header,(message|body))>
  ```

# 属性

## 声明

```dtd
<!ATTLIST 元素名称 属性名称 属性类型 默认值>
```

DTD：

```dtd
<!ELEMENT square EMPTY>
<!ATTLIST square width CDATA "10">
```

对应 XML 示例：

```xml
<square width="100" />
```

## 属性类型

| 类型               | 描述                              |
| :----------------- | :-------------------------------- |
| CDATA              | 值为字符数据 (character data)     |
| (*en1*\|*en2*\|..) | 值可选该序列中的一个，en 为属性值 |
| ID                 | 值为唯一的 id                     |
| IDREF              | 值为另外一个元素的 id             |
| IDREFS             | 值为其他 id 的列表                |
| NMTOKEN            | 值为合法的 XML 名称               |
| NMTOKENS           | 值为合法的 XML 名称的列表         |
| ENTITY             | 值是一个实体                      |
| ENTITIES           | 值是一个实体列表                  |
| NOTATION           | 此值是符号的名称                  |
| xml:               | 值是一个预定义的 XML 值           |

## 属性值

| 值           | 解释           |
| :----------- | :------------- |
| 值           | 属性的默认值   |
| #REQUIRED    | 属性值是必需的 |
| #IMPLIED     | 属性不是必需的 |
| #FIXED value | 属性值是固定的 |

# 实体

实体以 & 开头，表示内容替换。

## 内部声明

```dtd
<!ENTITY 实体名称 "实体的值">
```

DTD：

```dtd
<!ENTITY writer "Bill Gates">
<!ENTITY copyright "Copyright W3School.com.cn">
```

XML：

```xml
<author>&writer;&copyright;</author>
```

## 外部声明

```dtd
<!ENTITY 实体名称 SYSTEM "url">
```

DTD：

```dtd
<!ENTITY writer SYSTEM "http://www.w3school.com.cn/dtd/entities.dtd">
<!ENTITY copyright SYSTEM "http://www.w3school.com.cn/dtd/entities.dtd">
```

XML：

```xml
<author>&writer;&copyright;</author>
```
