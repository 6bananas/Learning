> 想不到吧，我还学过 PHP！世界上最好的语言！
>
> 这也是时代的遗物。当初学习 web 安全的时候必学的一门语言，因为大部分漏洞的讲解、搭建和题目环境都是 PHP 。只是我很疑惑，现在都很难看到用 PHP 写的网站了，为何一代又一代的文章，包括我自己当时写的博客，环境都是 PHP 。
>
> 当时 PHP 用得很熟练的，所以写得就没那么详细了。

# 概述

1. 所有用户定义的函数、类和关键词（例如 if、else、echo）都对大小写不敏感，所有变量都对大小写敏感。
2. 引号包引号时，外层用单引号，内层用双引号。

# 语法

## 变量作用域

### global

函数之外声明的变量拥有 global 作用域，只能在函数以外进行访问。

### local

函数内部声明的变量拥有 local 作用域，只能在函数内部访问。使用 global 关键字能在函数内访问全局变量：

```php
$x=5;
$y=10;

function myTest() {
  global $x,$y;
  $y=$x+$y;
}
```

PHP 同时在名为 `$GLOBALS[index]` 的数组中存储了所有的全局变量，下标存有变量名，这个数组在函数内也可以访问，并能够用于直接更新全局变量。上面的例子可以这样重写：

```php
$x=5;
$y=10;

function myTest() {
  $GLOBALS['y']=$GLOBALS['x']+$GLOBALS['y'];
} 
```

### static

同 C 语言。

## 输出

| 函数      | 返回值                     | 括号         | 输出多个变量                          | 可以输出                                   | 不可以输出                               |
| --------- | -------------------------- | ------------ | ------------------------------------- | ------------------------------------------ | ---------------------------------------- |
| echo      | 没有返回值，返回会报错     | 可带，可不带 | 可以（不可加括号），如 `echo $a, $b;` | “字符型，整形，浮点型，布尔型”             | “数组，对象”（会报错）“NULL”（不会报错） |
| print     | 有返回值1，输出成功则返回1 | 可带，可不带 | 不可以                                | “字符型，整形，浮点型，布尔型”             | “数组，对象”（会报错）“NULL”（不会报错） |
| print_r() | 有返回值1，输出成功则返回1 | 必须带       | 不可以                                | “字符型，整形，浮点型，布尔型，数组，对象” | “NULL”（不会报错）                       |

速度：echo > print > print_r 。

## 类

class xxx{}

## 逻辑运算符

| 运算符 | 名称 |
| :----- | :--- |
| and    | 与   |
| or     | 或   |
| xor    | 异或 |
| &&     | 与   |
| \|\|   | 或   |
| !      | 非   |

## 数组运算符

| 运算符 | 名称   | 例子      | 结果                                                         |
| :----- | :----- | :-------- | :----------------------------------------------------------- |
| +      | 联合   | $x + $y   | $x 和 $y 的联合（但不覆盖重复的键）                          |
| ==     | 相等   | $x == $y  | 如果 $x 和 $y 拥有相同的键/值对，则返回 true。               |
| ===    | 全等   | $x === $y | 如果 $x 和 $y 拥有相同的键/值对，且顺序相同类型相同，则返回 true。 |
| !=     | 不相等 | $x != $y  | 如果 $x 不等于 $y，则返回 true。                             |
| <>     | 不相等 | $x <> $y  | 如果 $x 不等于 $y，则返回 true。                             |
| !==    | 不全等 | $x !== $y | 如果 $x 与 $y 完全不同，则返回 true。                        |

## switch

同 C 语言。

## do...while

同 C 语言。

## foreach

```php
$colors = array("red","green","blue","yellow"); 

foreach ($colors as $value) {
  echo "$value <br>";
}
```

## 函数

```php
function name([$x, $y]){
    xxx;
    [return xxx;]
}
```

## 数组

### 索引数组

即 C 语言的数组。

### 关联数组

键值对：

```php
$age=array("Bill"=>"35","Steve"=>"37","Elon"=>"43");

$age['Bill']="63";
$age['Steve']="56";
$age['Elon']="47";

foreach($age as $x=>$x_value) {
  echo "Key=" . $x . ", Value=" . $x_value;
  echo "<br>";
}
```

### 多维数组

### 排序函数

- sort() - 以升序对数组排序
- rsort() - 以降序对数组排序
- asort() - 根据值，以升序对关联数组进行排序
- ksort() - 根据键，以升序对关联数组进行排序
- arsort() - 根据值，以降序对关联数组进行排序
- krsort() - 根据键，以降序对关联数组进行排序

## 日期

### date(format)

1. 日期

   - d

   - m

   - Y

   - 1 - 表示周里的某天

   - 其他字符，比如 "/"、"." 或 "-" 也可被插入字符中，以增加其他格式

     ```php
     date("Y/m/d")
     date("Y.m.d")
     date("Y-m-d")
     date("l") //返回Monday
     ```

2. 时间

   - h - 带有首位零的 12 小时小时格式

   - i - 带有首位零的分钟

   - s - 带有首位零的秒（00 -59）

   - a - 小写的午前和午后（am 或 pm）

   - 其他字符，比如 "/"、"." 或 "-" 也可被插入字符中，以增加其他格式

     ```php
     echo date("h:i:sa"); //01:41:58pm
     ```

### date_default_timezone_set()

设置时区：

```php
date_default_timezone_set("Asia/Shanghai");
```

## 文件

### fopen("file", "flag")

| 模式 | 描述                                                         |
| :--- | :----------------------------------------------------------- |
| r    | 打开文件为只读。文件指针在文件的开头开始。                   |
| w    | 打开文件为只写。删除文件的内容或创建一个新的文件，如果它不存在。文件指针在文件的开头开始。 |
| a    | 打开文件为只写。文件中的现有数据会被保留。文件指针在文件结尾开始。创建新的文件，如果文件不存在。 |
| x    | 创建新文件为只写。返回 FALSE 和错误，如果文件已存在。        |
| r+   | 打开文件为读/写、文件指针在文件开头开始。                    |
| w+   | 打开文件为读/写。删除文件内容或创建新文件，如果它不存在。文件指针在文件开头开始。 |
| a+   | 打开文件为读/写。文件中已有的数据会被保留。文件指针在文件结尾开始。创建新文件，如果它不存在。 |
| x+   | 创建新文件为读/写。返回 FALSE 和错误，如果文件已存在。       |

### fread("file", maxbyte)

### filesize("file")

返回字节数。

### fgets($file)

读取单行并返回读取内容。

### fgetc($file)

读取单个字符并返回内容。

# 预定义常量

## \__FILE__

文件的绝对路径。如果用在被包含文件中，则返回被包含的文件名。

## $_FILES

- $_FILES\["file"]["name"] - 被上传文件的名称
- $_FILES\["file"]["type"] - 被上传文件的类型
- $_FILES\["file"]["size"] - 被上传文件的大小，以字节计
- $_FILES\["file"]["tmp_name"] - 存储在服务器的文件的临时副本的名称
- $_FILES\["file"]["error"] - 由文件上传导致的错误代码，0 表示上传成功，非 0 表示有错误

> **题外话-上传文件过大时的 $FILES**
>
> 对于文件上传，我们一般会定义一个 "MAX_FILE_SIZE" 来限制上传文件的大小。实际上 PHP 自身也定义了类似变量，其在 php.ini 中的 "upload_max_filesize" 设置。
>
> 上传文件到服务端时，PHP 会先检查文件大小是否大于 "upload_max_filesize" 的值，如果大于，则会如下设置：
>
> 1. `$_FILES['file']['tmp_name']` 为空。
> 2. `$_FILES['file']['name']` 依旧为上传文件名。
> 3. `$_FILES['file']['size']` 为 0 。
> 4. `$_FILES['file']['type']` 为空。
> 5. `$_FILES['file']['error']` 为 1 。

## $_GET['xxx']

接收 get 传入的数据。

## PHP_EOL

换行符。

## $_POST['xxx']

接收 post 传入的数据。

## $_REQUEST['xxx']

接收 get 或 post 传入的数据。

## $_SERVER

| Element/Code                    | 描述                                                         |
| :------------------------------ | :----------------------------------------------------------- |
| $_SERVER['PHP_SELF']            | 返回当前执行脚本的文件名，域名后面的一串路径直到目标文件，例如 “/demo/index.php”。 |
| $_SERVER['SERVER_ADDR']         | 返回当前运行脚本所在的服务器的 IP 地址。                     |
| $_SERVER['SERVER_NAME']         | 返回当前运行脚本所在的服务器的主机名。                       |
| $_SERVER['SERVER_SOFTWARE']     | 返回服务器标识字符串（比如 Apache/2.2.24）。                 |
| $_SERVER['SERVER_PROTOCOL']     | 返回请求页面时通信协议的名称和版本（例如，"HTTP/1.0"）。     |
| $_SERVER['REQUEST_METHOD']      | 返回访问页面使用的请求方法（例如 POST）。                    |
| $_SERVER['REQUEST_TIME']        | 返回请求开始时的时间戳（例如 1377687496）。                  |
| $_SERVER['QUERY_STRING']        | 返回查询字符串，如果是通过查询字符串访问此页面。             |
| $_SERVER['HTTP_ACCEPT']         | 返回来自当前请求的请求头。                                   |
| $_SERVER['HTTP_ACCEPT_CHARSET'] | 返回来自当前请求的 Accept_Charset 头。                       |
| $_SERVER['HTTP_HOST']           | 返回来自当前请求的 Host 头。                                 |
| $_SERVER['HTTP_REFERER']        | 返回当前页面的完整 URL 。                                    |
| $_SERVER['HTTPS']               | 是否通过安全 HTTP 协议查询脚本。                             |
| $_SERVER['REMOTE_ADDR']         | 返回浏览当前页面的用户的 IP 地址。                           |
| $_SERVER['REMOTE_HOST']         | 返回浏览当前页面的用户的主机名。                             |
| $_SERVER['REMOTE_PORT']         | 返回用户机器上连接到 Web 服务器所使用的端口号。              |
| $_SERVER['SCRIPT_FILENAME']     | 返回当前执行脚本的绝对路径。                                 |
| $_SERVER['SERVER_ADMIN']        | 该值指明了 Apache 服务器配置文件中的 SERVER_ADMIN 参数。     |
| $_SERVER['SERVER_PORT']         | Web 服务器使用的端口。默认值为 "80"。                        |
| $_SERVER['SERVER_SIGNATURE']    | 返回服务器版本和虚拟主机名。                                 |
| $_SERVER['PATH_TRANSLATED']     | 当前脚本所在文件系统（非文档根目录）的基本路径。             |
| $_SERVER['SCRIPT_NAME']         | 返回当前脚本的路径。                                         |
| $_SERVER['SCRIPT_URI']          | 返回当前页面的 URI 。                                        |
| $_SERVER['REQUEST_URI']         | 返回 URI 用来指定要访问的页面（域名后面的一串路径直到目标文件），例如 “/demo/index.html”。 |

# 函数

## A

### array_push($arr, value1[, value2...])

向数组末尾添加值，返回新数组长度。

## B

### basename("path"[, "suffix"])

返回路径中的文件名部分，即最后一个 / 后面的内容。如 /demo/index.php 将返回 index.php ，如果指定了后缀 suffix ，则只返回 index 。

## C

### chr(num)

返回 ASCII 码为 num 的字符，num 可用十、八、十六进制表示。

### count($array)

## D

### define("name", value[, flag])

定义常量，flag 用于指定是否对大小写敏感，默认 false 。

## F

### feof($file)

如果出错或者文件指针到了文件末尾（EOF）则返回 TRUE ，否则返回 FALSE 。 

### fgets("file", length)

从打开的文件中返回一行。函数会在到达指定长度（length - 1）、碰到换行符、读到文件末尾（EOF）时（以先到者为准）时停止，并返回一个新行。

如果失败该函数返回 FALSE。

### file_exists("path")

检查文件或目录是否存在。

### file_put_contents("file", "data")

向指定文件（如果不存在则新建）写入指定数据，返回写入数据的字节数。

### fwrite("file", "content"[, length])

将内容写入一个打开的文件中。函数会在到达指定长度或读到文件末尾（EOF）时（以先到者为准），停止运行。如果函数成功执行，则返回写入的字节数。如果失败，则返回 FALSE 。

## G

### getimagesize("file")

获取图像大小及相关信息，成功则返回一个数组，失败则返回 FALSE 并产生一条 E_WARNING 级的错误信息。

```php
Array
(
    [0] => 290 //图像宽度的像素值
    [1] =>69 // 图像高度的像素值
    [2] => 3 //图像的类型，返回的是数字，其中1 = GIF，2 = JPG，3 = PNG，4 = SWF，5 = PSD，6 = BMP，7 = TIFF(intel byte order)，8 = TIFF(motorola byte order)，9 = JPC，10 = JP2，11 = JPX，12 = JB2，13 = SWC，14 = IFF，15 = WBMP，16 = XBM
    [3] => width="290" height="69" //宽度和高度的字符串，可以直接用于 HTML 的 <image> 标签
    [bits] => 8 //图像的每种颜色的位数，二进制格式
    [mime] => image/png //MIME 类型
)
```

## I

### is_uploaded_file("file")

检查文件是否通过 POST 方式上传。

## J

### json_encode()

JSON 转换，失败则返回 false 。

### json_decode()

JSON 转换，失败则返回 false 。

## M

### move_upload_file("file", "des")

## O

### opendir("path")

打开目录。

## P

### pathinfo(path,options)

以数组的形式返回关于文件路径的信息，返回的数组元素如下：

- [dirname] - 目录路径
- [basename] - 文件名
- [extension] - 文件后缀名
- [filename] - 不包含后缀的文件名

| 参数    | 描述                                                         |
| :------ | :----------------------------------------------------------- |
| path    | 必需。规定要检查的路径。                                     |
| options | 可选。规定要返回的数组元素。默认是 all。可能的值：PATHINFO_DIRNAME - 只返回 dirname；PATHINFO_BASENAME - 只返回 basename；PATHINFO_EXTENSION - 只返回 extension；PATHINFO_FILENAME - 只返回 filename。 |

### preg_match($pattern, $subject\[, $matches][, $offset])

参数说明：

- $pattern：正则表达式
- $subject：目标字符串
- $matches：一个数组，将被填充为搜索结果。 $matches[0] 将包含完整模式匹配到的文本， $matches[1] 将包含第一个捕获子组匹配到的文本，以此类推。
- $offset：通常，搜索从目标字符串的最左边开始。$offset 用于指定起始搜索的偏移量（单位是字节）。

该函数将返回 $pattern 的匹配次数，值是 0 或 1 ，因为 preg_match() 在第一次匹配成功后会停止搜索。preg_match_all() 不同于此，它会一直搜索至结尾。 如果发生错误，preg_match() 返回 FALSE。

## R

### random_int(min, max)

返回 [min, max] 区间的一个伪随机数。

### readdir($dir)

返回目录中下一个文件的文件名，读取到空则返回 false ，一般用于遍历目录。

### readfile("file")

成功则返回文件内容及字节数，失败则返回 false 和错误信息。

## S

### scandir("dir")

返回 dir 目录的解构数组。

### strlen("str")

### str_word_count("str")

返回 str 中的单词数。

### strpos("str", "des")

在 str 中检索 des ，返回值 true/false 。

### str_replace("被替换内容", "替换内容", "str")

## U

### unlink("file")

删除文件。

## V

### var_dump($a)

用于输出变量的相关信息，包括表达式的类型与值。数组将递归展开值，通过缩进显示其结构。
