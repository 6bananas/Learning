# 杂

查看 Python 版本：

```bash
python -V
或
python --version
```

Python 是一门解释型语言。

默认情况下，Python 3 源码文件以 UTF-8 编码，所有字符串都是 Unicode 字符串。 当然你也可以为源码文件指定不同的编码：

```python
# -*- coding: cp-1252 -*-
```

时间戳：1970.01.01 00:00:00 以来的秒数。

pip ：Python 包管理工具，提供了对 Python 包的查找、下载、安装、卸载的功能。常用命令：

```bash
pip --version
pip install xxx
pip uninstall xxx
pip list
```

指定循环次数：

```python
for i in range(3) :
    print(1)
```

`pip install -r requirements.txt` ，用来安装一个 Python 项目所需要的依赖包，其中 `requirements. txt` 是一个文本文件，里面列出了这个项目所需要的所有依赖包的名称和版本号。

Python 中的 NULL 为 None 。

# 语法

## 标识符

第一个字符必须是字母或下划线。

标识符的其他的部分由字母、数字和下划线组成。

标识符对大小写敏感。

## 注释

```python
#这是单行注释

'''
这是
多行注释
'''

"""
这也是
多行注释
"""
```

## 转义字符

| 转义字符 | 描述                                                    |
| :------- | :------------------------------------------------------ |
| \000     | 空（null）                                              |
| \yyy     | ASCII 字符的八进制表示，y 代表 0~7 的字符               |
| \xyy     | ASCII 字符的十六进制表示，以 \x 开头，y 代表 0~f 的字符 |

使用 **r** 或 **R** 可以让反斜杠不转义。 如 **r"this is a line with \n"** 中 **\n** 会显示，而不是换行。

## 行与缩进

Python 使用缩进来表示代码块，而不使用大括号 {}。缩进的空格数是可变的，但是同一个代码块的语句必须包含相同的缩进空格数。

缩进相同的一组语句构成一个代码块，我们称之代码组：

```python
if expression : 
   suite
elif expression : 
   suite 
else : 
   suite
```

我们将首行及后面的代码组称为一个子句。

如果一条语句一行写不完，可以使用反斜杠 \ 来实现多行语句，例如：

```python
total = item_one + \
        item_two + \
        item_three
```

在 []、{}、或 () 中的多行语句，不需要使用反斜杠。

Python 可以在一行中使用多条语句，语句之间使用分号 **;** 分割即可。

## 数据类型

### 变量

Python 中的变量不需要声明，每个变量在使用前都必须赋值，变量赋值以后该变量才会被创建。变量没有类型，我们所说的"类型"是值的类型。

多个变量赋值：

```python
a, b, c = 1, 2, "runoob"
```

变量地址：

```python
a=1
print(a, id(a))
a=2
print(a, id(a))

输出：
1 1831899195696
2 1831899195728
#变量每赋值一次，地址就会改变
```

变量回收：

```python
del 变量名1[, 变量名2, 变量名3……]
```

常用常量：

- pi：圆周率
- e：自然常数

三种命名空间：

- 内置名称（built-in）：Python 内置名称，如 abs、char、Exception 。
- 全局名称（global）：模块中定义的名称，模块其实就是一个个 .py 文件。
- 局部名称（local）：函数中定义的名称。
- Python 查找名称的顺序：局部->全局->内置。

四种作用域：

- L（Local）：最内层。
- E（Enclosing）：最内层与最外层之间。
- G（Global）：最外层，即全局。
- B（Built-in）： Python 内置。
- Python 查找名称的顺序：L->E->G->B 。

```python
num #G，全局名称
def func():
    num #E，局部名称
    def func2():
        num #E，局部名称
        def func3():
            num #L，局部名称
```

里层可应用外层的变量，但不能改变，如果要改变：

```python
num = 1
def func():
    global num #L作用域变量，使用global关键字
    num = 2
    
def func1():
    num = 1
    def func2():
        nonlocal num = 2 #E作用域变量，使用nonlocal关键字
```

### 数字Number

Python 中数字有四种类型：整数、布尔型、浮点数和复数。

- int (整数)，如 1。只有一种整数类型 int，表示为长整型，没有 Python2 中的 Long 。
- bool (布尔)，True/False 。Python3 中，bool 是 int 的子类，True 和 False 可以和数字相加。
- float (浮点数)，如 1.23、3E-2 。
- complex (复数)，如 1+2j、 1.1+2.2J 。可以用 a + bj，或者 complex(a, b) 表示，复数的实部 a 和虚部 b 都是浮点型。

### 运算符

```python
>>> 2 / 4  # 除法，得到一个浮点数
0.5
>>> 2 // 4 # 除法，得到一个整数
0
>>> 2 ** 5 # 乘方
32
```

海象运算符（:=）：

```python
a = 15
if a > 10:
    print('hello, walrus operator!')
    
<==>

if a := 15 > 10:
    print('hello, walrus operator!')
```

位运算符：&、|、^(异或)、~、<<、>>

逻辑运算符：and、or、not ，没有 && 、|| 、! 这三个运算符。

成员运算符：in、not in

身份运算符：is、is not ，用于比较两个对象的存储单元。`x is y ` <=> `id(x)==id(y)` 。即 == 和 != ，两种用法均可。

[优先级](https://www.runoob.com/python3/python3-basic-operators.html)。

### 字符串String

单引号 **'** 和双引号 **"** 的使用完全相同。

使用三引号(**'''** 或 **"""**)可以指定一个多行字符串，如：

```python
paragraph = """这是一个段落，
可以由多行组成"""
```

按字面意义级联字符串，如 **"this " "is " "string"** 会被自动转换为 **this is string** 。

字符串不能被改变。向一个索引位置赋值，比如 **word[0] = 'm'** 会导致错误。

字符串可以用 **+** 号连接在一起。

字符串有两种索引方式，从左往右以 **0** 开始，从右往左以 **-1** 开始。

字符串的截取：

```python
语法：
变量名[first:last:length]，表示从[first, last)区间每间隔length长度截取一个字符
last可以越界
length为正数，表示从左到右跳间隔；length为负数，表示从右到左跳间隔
默认length=1，此时只需要 变量名[first:last]

a="1234567"
print(a[0:6:1])
print(a[0:6:2])

输出：
123456
135
                        
str='123456789'
print(str[0:-1])           # 输出第一个到倒数第二个的所有字符
print(str[0])              # 输出字符串第一个字符
print(str[2:])             # 输出从第三个开始后的所有字符
print(str[:2])             # 输出[0, 2)区间的字符
print(str * 2)             # 输出字符串两次
```

相关函数：

- .strip()：两头去空格，此处的空格包含 `\n、\r、\t、' '` 。

- .split(str[, num])：通过指定分隔符对字符串进行切片，切片成列表。
  - str -- 分隔符，默认为所有的空字符，包括空格、换行(\n)、制表符(\t)等。
  - num -- 分割次数。默认为 -1, 即全部分隔。
  
- .join(sequence)：将序列中的元素以指定的字符连接生成一个新的字符串。

  ```python
  words = ['Python', 'is', 'fun']
  sentence = ' '.join(words)
  print(sentence)  # 输出: Python is fun
  
  items = ['apple', 'banana', 'cherry']
  result = ', '.join(items)
  print(result)  # 输出: apple, banana, cherry
  ```

- .find(str[, beg, end])：检测字符串中是否包含子串 str ，如果指定 beg（开始） 和 end（结束） 范围，则检查是否包含在指定范围内。如果包含子字符串返回开始的索引值，否则返回 -1。

### 列表List

列表中元素的类型可以不相同，它支持数字、字符串、列表（即嵌套）等。列表是写在方括号 **[]** 之间、用逗号分隔开的元素集合。

和字符串一样，列表同样可以被索引和截取，列表被截取后返回一个子列表。列表截取的语法格式如下：

```python
变量[first:last:length]
```

索引值以 **0** 为开始值，**-1** 为从末尾的开始位置。

```python
list = [ 'abcd', 786 , 2.23, 'runoob', 70.2 ]
tinylist = [123, 'runoob']

print (list)            # 输出完整列表
print (list[0])         # 输出列表第一个元素
print (list[1:3])       # 从第二个开始输出到第三个元素
print (list[2:])        # 输出从第三个元素开始的所有元素
print (tinylist * 2)    # 输出两次列表 [123, 'runoob', 123, 'runoob']
print (list + tinylist) # 连接列表 ['abcd', 786, 2.23, 'runoob', 70.2, 123, 'runoob']
```

与字符串不一样的是，列表中的元素是可以改变的，即 `a[0]=1` 是可以的。

相关函数：

| 函数                    | 说明                        |
| ----------------------- | --------------------------- |
| list.append(xxx)        | 在列表末尾添加元素xxx       |
| max(list)               | 返回元素最大值              |
| min(list)               | 返回元素最小值              |
| list(seq)               | 将元组转换为列表            |
| list.count(obj)         |                             |
| list.extend(seq)        | 将序列seq的值添加到列表末尾 |
| list.index(obj)         | 返回obj第一次出现的位置     |
| list.insert(index, obj) |                             |
| list.pop(index)         | index默认为-1               |
| list.remove(obj)        |                             |
| list.reverse()          |                             |
| list.clear()            |                             |
| list.copy()             | 创建列表的浅拷贝            |

说明：

- `del list[1]` 可以删除 list[1] 元素，后面的元素整体向前移动一位。

- `list.sort(key=xxx, reverse=xxx)` ：默认值为 None、False(升序)

  ```python
  # 获取列表的第二个元素
  def takeSecond(elem):
      return elem[1]
   
  # 列表
  random = [(2, 2), (3, 4), (4, 1), (1, 3)]
   
  # 指定第二个元素排序
  random.sort(key=takeSecond)
   
  # 输出类别
  print ('排序列表：', random)
  
  #输出
  排序列表：[(4, 1), (2, 2), (1, 3), (3, 4)]
  ```

列表比较：需要引入 **operator** 模块的 **eq** 方法，

```python
import operator

a = [1, 2]
b = [2, 3]
c = [2, 3]
#返回True/False
print("operator.eq(a,b): ", operator.eq(a,b))
print("operator.eq(c,b): ", operator.eq(c,b))
```

### 元组Tuple

与 List 类似，区别在于用 **()** 、元素不能修改和删除。

构造包含 0 个或 1 个元素的元组比较特殊，所以有一些额外的语法规则：

```python
tup1 = ()    # 空元组
tup2 = (20,) # 一个元素，需要在元素后添加逗号
```

相关函数：

- max(tuple)、min(tuple)
- tuple(iterable)：将可迭代序列如列表转换为元组。

 <mark>String、List 和 Tuple 都属于 sequence（序列）</mark>。

### 集合Set

由一个或多个对象组成的，构成集合的对象称作元素或是成员，集合创建后会自动删除重复的元素。可以使用大括号 **{ }** 或者 **set()** 函数创建集合，注意：创建一个空集合必须用 **set()** 而不是 **{ }**，**{ }** 是用来创建空字典的。

```python
sites = {'Google', 'Taobao', 'Runoob', 'Facebook', 'Zhihu', 'Baidu'}

print(sites)   # 输出集合，重复的元素被自动去掉

# 成员测试
if 'Runoob' in sites :
    print('Runoob 在集合中')
else :
    print('Runoob 不在集合中')

# set可以进行集合运算
a = set('abracadabra')
b = set('alacazam')

print(a)
print(a - b)     # a 和 b 的差集
print(a | b)     # a 和 b 的并集
print(a & b)     # a 和 b 的交集
print(a ^ b)     # a 和 b 中不同时存在的元素

输出：
{'Zhihu', 'Baidu', 'Taobao', 'Runoob', 'Google', 'Facebook'}
Runoob 在集合中
{'b', 'c', 'a', 'r', 'd'}
{'r', 'b', 'd'}
{'b', 'c', 'a', 'z', 'm', 'r', 'l', 'd'}
{'c', 'a'}
{'z', 'b', 'm', 'r', 'l', 'd'}
```

添加元素，且参数可以是列表，元组，字典等：

```python
>>> thisset = set(("Google", "Runoob", "Taobao"))
>>> thisset.update({1,3})
>>> print(thisset)
{1, 3, 'Google', 'Taobao', 'Runoob'}
>>> thisset.update([1,4],[5,6])  
>>> print(thisset)
{1, 3, 4, 5, 6, 'Google', 'Taobao', 'Runoob'}
```

相关函数：

| 函数                                               | 说明                                 |
| -------------------------------------------------- | ------------------------------------ |
| set.add(x)                                         |                                      |
| set.clear()                                        |                                      |
| set.copy()                                         |                                      |
| set.difference(set2)                               | 差集                                 |
| set.discard(x)                                     | 移除指定元素，如果元素不存在不会报错 |
| set.remove(x)                                      | 移除指定元素，如果元素不存在会报错   |
| set.intersection(set2)                             | 交集                                 |
| set.intersection_update(set1[, set2, ...])         | 交集                                 |
| set.isdisjoint(set2)                               | 判断是否是交集                       |
| set.issubset(set2)                                 | 判断是否子集                         |
| set.issuperset(set2)                               | 判断是否父集                         |
| set.pop()                                          | 随机移除元素                         |
| set.symmetric_difference(set2)                     | (A-B)+(B-A)                          |
| set.symmetric_difference_update(set1[, set2, ...]) |                                      |
| set.union(set1[, set2, ...])                       | 并集                                 |
| set.update(obj)                                    | 给集合添加元素，obj可为元素或集合    |

### 字典Dictionary

列表是有序的对象集合，字典是无序的对象集合。两者的区别在于：字典当中的元素是通过键来存取的，而不是通过下标存取。

字典是一种映射类型，用 **{ }** 标识，它是一个无序的 **键(key) : 值(value)** 的集合。在同一个字典中，键(key)必须是唯一的。键可以用数字，字符串或元组充当，而用列表不行。

```python
dict = {}
dict['one'] = "1 - 菜鸟教程"
dict[2]     = "2 - 菜鸟工具"

tinydict = {'name': 'runoob', 'code':1, 'site': 'www.runoob.com'}

print (dict['one'])       # 输出键为 'one' 的值
print (dict[2])           # 输出键为 2 的值
print (tinydict)          # 输出完整的字典
print (tinydict.keys())   # 输出所有键
print (tinydict.values()) # 输出所有值

输出：
1 - 菜鸟教程
2 - 菜鸟工具
{'name': 'runoob', 'code': 1, 'site': 'www.runoob.com'}
dict_keys(['name', 'code', 'site'])
dict_values(['runoob', 1, 'www.runoob.com'])
```

构造函数 dict() 可以直接从键值对序列中构建字典：

```python
>>> dict([('Runoob', 1), ('Google', 2), ('Taobao', 3)])
{'Runoob': 1, 'Google': 2, 'Taobao': 3}
>>> {x: x**2 for x in (2, 4, 6)}
{2: 4, 4: 16, 6: 36}
>>> dict(Runoob=1, Google=2, Taobao=3)
{'Runoob': 1, 'Google': 2, 'Taobao': 3}
```

删除某项元素需要使用 del 。

相关函数：

| 函数                              | 描述                                                         |
| --------------------------------- | ------------------------------------------------------------ |
| dict.clear()                      |                                                              |
| dict.copy()                       |                                                              |
| dict.fromkeys(seq[, value])       | 以seq的值为键，value(可选，默认None)为值创建字典             |
| dict.get(key, default=xxx)        | 返回指定键的值，如果键不在字典中返回 default 设置的值(默认None) |
| dict.setdefault(key, default=xxx) | 和get()类似, 但如果键不存在于字典中，将会添加键并将值设为default(默认None) |
| dict.update(dict2)                | 把字典dict2的键/值对更新到dict里，如果dict没有dict2的键，则将该键/值对添加到dict |
| dict.pop(key[, defaulte])         | 删除 key 所对应的值，返回被删除的值。                        |

```python
dict.items() #以列表形式返回一个视图对象
dishes = {'eggs': 2, 'sausage': 1, 'bacon': 1, 'spam': 500}
print(dishes.items())
#dict_items([('eggs', 2), ('sausage', 1), ('bacon', 1), ('spam', 500)])

dict.keys() #返回键的视图对象
dishes = {'eggs': 2, 'sausage': 1, 'bacon': 1, 'spam': 500}
print(dishes.keys())
#dict_keys(['eggs', 'sausage', 'bacon', 'spam'])

dict.values() #返回值的视图对象
dishes = {'eggs': 2, 'sausage': 1, 'bacon': 1, 'spam': 500}
print(dishes.values())
#dict_values([2, 1, 1, 500])
```

### 数据类型转换

在运算中，数据会自动在本数据大类中转换。当需要在不同数据大类间转换，如 string 转 int ，则需要强制类型转换。相关函数：

| 函数                  | 描述                                                         |
| :-------------------- | :----------------------------------------------------------- |
| int(x, base=?)        | 将x转换为一个整数，x可为数字或字符串(注意要是'10'、'0xa'这样的)；base指定进制，默认10进制 |
| float(x)              | 将x转换到一个浮点数                                          |
| complex(real [,imag]) | 创建一个复数                                                 |
| str(x)                | 将对象 x 转换为字符串                                        |
| repr(x)               | 将对象 x 转换为表达式字符串                                  |
| eval(str)             | 用来计算在字符串中的有效Python表达式，并返回一个对象         |
| tuple(s)              | 将序列 s 转换为一个元组                                      |
| list(s)               | 将序列 s 转换为一个列表                                      |
| set(s)                | 转换为可变集合                                               |
| dict(d)               | 创建一个字典。d 必须是一个 (key, value)元组序列。            |
| frozenset(s)          | 转换为不可变集合                                             |
| chr(x)                | 将一个整数转换为一个字符                                     |
| hex(x)                | 将一个整数转换为一个十六进制字符串                           |

## 进制

Python 默认为十进制，非十进制需要标注，无论什么进制输出都为十进制：

```python
print(11)
print(0b11)

输出：
11
3
```

## 输入输出

### input

```python
a=input("请输入：\n")
print(a)

请输入：
123
123
```

input() 是按行读入一个字符串，如果需要读入一个整数，则 `int(input())` 。

### print

可将内容输出到显示屏或文件，默认每个 print 函数结束后都会自动输出换行，如不想要自动换行，则 `print(xxx, end="") `。

- 显示屏：
  
  ```python
  print(3+1)
  print(1,2)
  print("hello","world")
  
  输出：
  4
  1 2 #自动输出空格
  hello world
  ```
  
- 文件：
  
  ```python
  fp=open("file", "mode")
  print("hello", file=fp)
  fp.close()
  ```
  
  - 参数（mode）：
    
    | mode | 描述                                                         |
    | :--- | :----------------------------------------------------------- |
    | r    | 以只读方式打开文件。文件的指针将会放在文件的开头。这是**默认**模式。 |
    | rb   | 以二进制格式打开一个文件用于只读。文件指针将会放在文件的开头。 |
    | r+   | 打开一个文件用于读写。文件指针将会放在文件的开头。           |
    | rb+  | 以二进制格式打开一个文件用于读写。文件指针将会放在文件的开头。 |
    | w    | 打开一个文件只用于写入。如果该文件已存在则打开文件，并从开头开始编辑，即原有内容会被删除。如果该文件不存在，创建新文件。 |
    | wb   | 以二进制格式打开一个文件只用于写入。如果该文件已存在则打开文件，并从开头开始编辑，即原有内容会被删除。如果该文件不存在，创建新文件。 |
    | w+   | 打开一个文件用于读写。如果该文件已存在则打开文件，并从开头开始编辑，即原有内容会被删除。如果该文件不存在，创建新文件。 |
    | wb+  | 以二进制格式打开一个文件用于读写。如果该文件已存在则打开文件，并从开头开始编辑，即原有内容会被删除。如果该文件不存在，创建新文件。 |
    | a    | 打开一个文件用于追加。如果该文件已存在，文件指针将会放在文件的结尾。也就是说，新的内容将会被写入到已有内容之后。如果该文件不存在，创建新文件进行写入。 |
    | ab   | 以二进制格式打开一个文件用于追加。如果该文件已存在，文件指针将会放在文件的结尾。也就是说，新的内容将会被写入到已有内容之后。如果该文件不存在，创建新文件进行写入。 |
    | a+   | 打开一个文件用于读写。如果该文件已存在，文件指针将会放在文件的结尾。文件打开时会是追加模式。如果该文件不存在，创建新文件用于读写。 |
    | ab+  | 以二进制格式打开一个文件用于追加。如果该文件已存在，文件指针将会放在文件的结尾。如果该文件不存在，创建新文件用于读写。 |

### 格式化输出

```python
print ("我叫 %s 今年 %d 岁!" % ('小明', 10))
```

格式化符号：

| 符  号 | 描述                                                      |
| :----- | :-------------------------------------------------------- |
| %c     | 格式化字符及其ASCII码                                     |
| %s     | 格式化字符串                                              |
| %d     | 格式化整数                                                |
| %u     | 格式化无符号整型                                          |
| %o     | 格式化无符号八进制数                                      |
| %x     | 格式化无符号十六进制数                                    |
| %X     | 格式化无符号十六进制数（大写）                            |
| %f     | 格式化浮点数字，默认小数点后6位精度，可指定精度（如%.1f） |
| %e     | 用科学计数法格式化浮点数                                  |
| %E     | 作用同%e                                                  |
| %g     | %f和%e的简写                                              |
| %G     | %f 和 %E 的简写                                           |
| %p     | 用十六进制数格式化变量的地址                              |

更多格式化方法：

- %-5d、%0d：同 C 语言
- %+d：在正数前加 + 号

### f-string

f-string 格式化字符串以 **f** 开头，后面跟着字符串，字符串中的变量或表达式用大括号 {} 包起来，它会将变量或表达式计算后的值替换进去，实例如下：

```python
>>> name = 'Runoob'
>>> f'Hello {name}'  # 替换变量
'Hello Runoob'
>>> f'{1+2}'         # 使用表达式
'3'

>>> w = {'name': 'Runoob', 'url': 'www.runoob.com'}
>>> f'{w["name"]}: {w["url"]}'
'Runoob: www.runoob.com'
```

在 Python 3.8 中可以使用 **=** 来拼接运算表达式与结果：

```python
>>> x = 1
>>> print(f'{x+1=}')   # Python 3.8
x+1=2
```

### .format()

```python
#默认按顺序匹配{}
>>> print('{}网址： "{}!"'.format('菜鸟教程', 'www.runoob.com'))
菜鸟教程网址： "www.runoob.com!"

>>> print('{0} 和 {1}'.format('Google', 'Runoob'))
Google 和 Runoob

>>> print('{name}网址： {site}'.format(name='菜鸟教程', site='www.runoob.com'))
菜鸟教程网址： www.runoob.com

>>> print('站点列表 {0}, {1}, 和 {other}。'.format('Google', 'Runoob', other='Taobao'))
站点列表 Google, Runoob, 和 Taobao。

#使用“:”格式化
>>> import math
>>> print('常量 PI 的值近似为 {0:.3f}。'.format(math.pi))
常量 PI 的值近似为 3.142。

#字典
>>> table = {'Google': 1, 'Runoob': 2, 'Taobao': 3}
>>> print('Runoob: {0[Runoob]:d}; Google: {0[Google]:d}; Taobao: {0[Taobao]:d}'.format(table))
Runoob: 2; Google: 1; Taobao: 3
或
>>> table = {'Google': 1, 'Runoob': 2, 'Taobao': 3}
>>> print('Runoob: {Runoob:d}; Google: {Google:d}; Taobao: {Taobao:d}'.format(**table))
Runoob: 2; Google: 1; Taobao: 3
```

## 模块

### import

使用 import 或者 from...import... 来导入模块(somemodule) 。

- 将整个模块导入： import somemodule
- 从某个模块中导入某个函数： from somemodule import somefunction
- 从某个模块中导入多个函数： from somemodule import firstfunc, secondfunc, thirdfunc
- 将某个模块中的全部函数导入： from somemodule import *

### \__name__

一个模块被另一个程序第一次引入时，其主程序将运行。如果我们想在模块被引入时，模块中的某一程序块不执行，我们可以用 \__name__ 属性来使该程序块仅在该模块自身运行时执行：

```python
# Filename: using_name.py

if __name__ == '__main__':
   print('程序自身在运行')
else:
   print('我来自另一模块')


$ python using_name.py
程序自身在运行
$ python
>>> import using_name
我来自另一模块
```

## 推导式

### 列表推导式

格式：

```python
[表达式 for 变量 in 列表] 
[out_exp_res for out_exp in input_list]

或者 

[表达式 for 变量 in 列表 if 条件]
[out_exp_res for out_exp in input_list if condition]
```

- out_exp_res：列表生成元素表达式，可以是有返回值的函数。
- for out_exp in input_list：迭代 input_list 将 out_exp 传入到 out_exp_res 表达式中。
- if condition：条件语句，可以过滤列表中不符合条件的值。

示例：

- 过滤掉长度 <=3 的字符串，并将剩下的转换成大写：

  ```python
  >>> names = ['Bob','Tom','alice','Jerry','Wendy','Smith']
  >>> new_names = [name.upper() for name in names if len(name)>3]
  >>> print(new_names)
  ['ALICE', 'JERRY', 'WENDY', 'SMITH']
  ```

- 计算 30 以内可以被 3 整除的整数：

  ```python
  >>> multiples = [i for i in range(30) if i % 3 == 0]
  >>> print(multiples)
  [0, 3, 6, 9, 12, 15, 18, 21, 24, 27]
  ```

### 字典推导式

格式：

```python
{ key_expr: value_expr for value in collection }

或

{ key_expr: value_expr for value in collection if condition }
```

示例：

- 将列表中各字符串值为键，长度为值，组成键-值对创建字典：

  ```python
  listdemo = ['Google','Runoob', 'Taobao']
  >>> newdict = {key:len(key) for key in listdemo}
  >>> newdict
  {'Google': 6, 'Runoob': 6, 'Taobao': 6}
  ```

- 提供三个数字，以三个数字为键，三个数字的平方为值来创建字典：

  ```python
  >>> dic = {x: x**2 for x in (2, 4, 6)}
  >>> dic
  {2: 4, 4: 16, 6: 36}
  >>> type(dic)
  <class 'dict'>
  ```

### 集合推导式

格式：

```python
{ expression for item in Sequence }

或

{ expression for item in Sequence if conditional }
```

示例：

- 计算数字 1,2,3 的平方数：

  ```python
  >>> setnew = {i**2 for i in (1,2,3)}
  >>> setnew
  {1, 4, 9}
  ```

- 判断不是 abc 的字母并输出：

  ```python
  >>> a = {x for x in 'abracadabra' if x not in 'abc'}
  >>> a
  {'d', 'r'}
  >>> type(a)
  <class 'set'>
  ```

### 元组推导式

也叫生成器表达式，格式：

```python
(expression for item in Sequence )

或

(expression for item in Sequence if conditional )
```

元组推导式和列表推导式的用法完全相同，只是元组推导式是用 **()** 圆括号而已。另外元组推导式返回的结果是一个生成器对象。

示例：

- 生成一个包含数字 1~9 的元组：

  ```python
  >>> a = (x for x in range(1,10))
  >>> a
  <generator object <genexpr> at 0x7faf6ee20a50>  # 返回的是生成器对象
  
  >>> tuple(a)       # 使用 tuple() 函数，可以直接将生成器对象转换成元组
  (1, 2, 3, 4, 5, 6, 7, 8, 9)
  ```

## 迭代器与生成器

### 迭代器

相关函数：iter()、next()，字符串、列表或元组对象都可用于创建迭代器。

```python
>>> list=[1,2,3,4]
>>> it = iter(list)    # 创建迭代器对象
>>> print (next(it))   # 输出迭代器的下一个元素
1
>>> print (next(it))
2
```

### 生成器

关键字 yield，一般是用在函数里面，此时这个函数就不再是一个普通函数，而是一个生成器函数。普通函数是顺序执行，遇到 return 语句或者最后一行函数语句就返回；而生成器函数在每次调用 next() 的时候执行，遇到 yield 语句返回，再次执行时从上次返回的 yield 语句处继续执行。

```python
import sys
 
def fibonacci(n): # 生成器函数 - 斐波那契
    a, b, counter = 0, 1, 0
    while True:
        if (counter > n): 
            return
        yield a
        a, b = b, a + b
        counter += 1
f = fibonacci(10) # f 是一个迭代器，由生成器返回生成
 
while True:
    try:
        print (next(f), end=" ")
    except StopIteration: # 请在生成器函数里带上StopIteration异常的处理，因为循环结束它会抛错
        sys.exit()
```

### StopIteration

StopIteration 异常用于标识迭代的完成。为防止出现无限循环的情况，在 next() 方法中我们可以设置在完成指定循环次数后触发 StopIteration 异常来结束迭代。

## 函数

### 带**的参数

加了 ** 的参数会以字典的形式导入：

```python
def printinfo( arg1, **vardict ):
   print (arg1)
   print (vardict)
printinfo(1, a=2,b=3)

#输出：
1
{'a': 2, 'b': 3}
```

### 参数*

如果单独出现 *，则 * 后的参数必须用关键字传入：

```python
def func(a, *, b):
    print(a)
    print(b)
func(1, b=2)
```

### 强制位置参数

关键符号 `/` 。在以下的例子中，形参 a 和 b 必须使用指定位置参数，c 或 d 可以是位置形参或关键字形参，而 e 和 f 要求为关键字形参：

```python
def f(a, b, /, c, d, *, e, f):
    print(a, b, c, d, e, f)
    
f(10, 20, 30, d=40, e=50, f=60)       # 正确
f(10, b=20, c=30, d=40, e=50, f=60)   # b 不能使用关键字参数的形式
f(10, 20, 30, 40, 50, f=60)           # e 必须使用关键字参数的形式
```

### 一般的函数

```python
def func(a, b):
	print(a);
    print(b)
```

a、b 可以是位置形参或关键字形参。

## 文件

### file对象属性

一个文件被打开后，你有一个 file 对象，你可以得到有关该文件的各种信息。

| 属性        | 描述                                      |
| :---------- | :---------------------------------------- |
| file.closed | 返回true如果文件已被关闭，否则返回false。 |
| file.mode   | 返回被打开文件的访问模式。                |
| file.name   | 返回文件的名称。                          |

### 相关函数

- open("file"[, "mode"])、.write("string")、.close()、.flush()：write() 不会在字符串的结尾添加换行符('\n') 。
- .read(size)：当 size 被忽略了或者为负，那么该文件的所有内容都将被读取并且返回。
- .readline()：读一行，\n 截止。如果返回一个空字符串，说明已经已经读取到最后一行。
- .readlines()：返回该文件中包含的所有行。如果设置可选参数 sizehint ，则读取指定字节, 并且将这些字节按行分割。
- .tell()：返回文件指针所在位置，从文件开头算起的字节数。

## 面向对象

```python
class Parent:        # 定义父类
    ...
 
class Child(Parent1[, Parent2, ...]): # 定义子类
	...
```

子类重写了构造方法，但仍需要使用父类的构造方法时：`super(子类名，self).__init__(参数列表)` 或

`父类名.__init__(self,参数列表)`

子类调用父类中已被子类重写的方法：`super(子类名, self).被重写方法名`

\__del__()：析构函数，在类的实例被删除时自动调用。我们可以在该方法中添加一些释放资源的操作，比如关闭文件、关闭数据库链接。

## 异常

继承关系：

```python
Exception
|__Warning
|__Error
   |__InterfaceError
   |__DatabaseError
      |__DataError
      |__OperationalError
      |__IntegrityError
      |__InternalError
      |__ProgrammingError
      |__NotSupportedError
```

## MySQL

### 模板

```python
import mysql-connector #导入模块

db = mysql.connector.connect(xxx) #连接MySQL（缆线）
cursor = db.cursor() #创建游标对象（缆车）
cursor.execute(sql) #执行SQL语句
try: #可选
    db.commit()
except:
    db.rollback()
db.close() #关闭连接
```

### 连接数据库

```python
mydb = mysql.connector.connect(
  host="localhost",       # 数据库主机地址
  user="yourusername",    # 数据库用户名
  passwd="yourpassword"   # 数据库密码
  database="xxx"		  # 可选
)
```

### 查询

```python
datas = cursor.fetchall() #获取全部查询数据

data = cursor.fetchone() #获取一条数据

for row in datas:
      fname = row[0]
      lname = row[1]
      age = row[2]
      sex = row[3]
      income = row[4]
      print(xxx)
```

### 批量插入

```python
sql = "INSERT INTO sites (name, url) VALUES (%s, %s)"
val = [
  ('Google', 'https://www.google.com'),
  ('Github', 'https://www.github.com'),
  ('Taobao', 'https://www.taobao.com'),
  ('stackoverflow', 'https://www.stackoverflow.com/')
]
 
mycursor.executemany(sql, val)
```

# 模块

## requests

向指定 URL 发送请求：

```python
# 导入 requests 包
import requests

# 发送请求
response = requests.get('https://www.runoob.com/')

# 返回网页内容
print(resp.text)
```

每次调用 requests 请求之后，会返回一个 response 对象，该对象包含了具体的响应信息，如状态码、响应头、响应内容等。

| 属性或方法            | 说明                                                         |
| :-------------------- | :----------------------------------------------------------- |
| apparent_encoding     | 编码方式                                                     |
| close()               | 关闭与服务器的连接                                           |
| content               | 返回响应的内容，以字节为单位                                 |
| cookies               | 返回一个 Cookie 对象，包含了从服务器发回的 cookie            |
| elapsed               | 返回一个 timedelta 对象，包含了从发送请求到响应到达之间经过的时间量，可以用于测试响应速度。比如 r.elapsed.microseconds 表示响应到达需要多少微秒。 |
| encoding              | 解码 r.text 的编码方式                                       |
| headers               | 返回响应头，字典格式                                         |
| history               | 返回包含请求历史的响应对象列表（url）                        |
| is_permanent_redirect | 如果响应是永久重定向的 url，则返回 True，否则返回 False      |
| is_redirect           | 如果响应被重定向，则返回 True，否则返回 False                |
| iter_content()        | 迭代响应                                                     |
| iter_lines()          | 迭代响应的行                                                 |
| json()                | 返回结果的 JSON 对象 (结果需要以 JSON 格式编写的，否则会引发错误) |
| links                 | 返回响应的解析头链接                                         |
| next                  | 返回重定向链中下一个请求的 PreparedRequest 对象              |
| ok                    | 检查 "status_code" 的值，如果小于400，则返回 True，如果不小于 400，则返回 False |
| raise_for_status()    | 如果发生错误，方法返回一个 HTTPError 对象                    |
| reason                | 响应状态的描述，比如 "Not Found" 或 "OK"                     |
| request               | 返回请求此响应的请求对象                                     |
| status_code           | 返回 http 的状态码，比如 404 和 200                          |
| text                  | 返回响应的内容，unicode 类型数据                             |
| url                   | 返回响应的 URL                                               |

## json

### json.dumps(xxx)

将 Python 对象编码成 JSON 字符串。

### json.loads(xxx)

将已编码的 JSON 字符串解码为 Python 对象。

### 类型转化对照表

| Python           | JSON   |
| :--------------- | :----- |
| dict             | object |
| list, tuple      | array  |
| str              | string |
| int, long, float | number |
| True             | true   |
| False            | false  |
| None             | null   |

## os

### os.access(path, mode)

检查文件权限。

### os.chdir("newdir")

改变当前工作目录。

### os.chmod(path, mode)

更改文件权限。

### os.getcwd()

返回当前目录。

### os.listdir("path")

返回指定的文件夹包含的文件或文件夹的名字的列表，注意请先使用 os.chdir() 将工作目录切换到需要 os.listdir() 的目录。

### os.mkdir("name")

在当前目录下新建目录。

### os.path

| 方法                                | 说明                                                         |
| :---------------------------------- | :----------------------------------------------------------- |
| os.path.abspath(path)               | 返回绝对路径                                                 |
| os.path.basename(path)              | 返回文件名                                                   |
| os.path.dirname(path)               | 返回文件路径                                                 |
| os.path.exists(path)                | 如果路径 path 存在，返回 True；如果路径 path 不存在或损坏，返回 False。 |
| os.path.lexists(path)               | 路径存在则返回 True，路径损坏也返回 True                     |
| os.path.getatime(path)              | 返回最近访问时间（浮点型秒数）                               |
| os.path.getmtime(path)              | 返回最近文件修改时间                                         |
| os.path.getctime(path)              | 返回文件 path 创建时间                                       |
| os.path.getsize(path)               | 返回文件大小，如果文件不存在就返回错误                       |
| os.path.isabs(path)                 | 判断是否为绝对路径                                           |
| os.path.isfile(path)                | 判断路径是否为文件                                           |
| os.path.isdir(path)                 | 判断路径是否为目录                                           |
| os.path.islink(path)                | 判断路径是否为链接                                           |
| os.path.join(path1[, path2[, ...]]) | 把目录和文件名合成一个路径                                   |
| os.path.realpath(path)              | 返回path的真实路径                                           |
| os.path.sameopenfile(fp1, fp2)      | 判断fp1和fp2是否指向同一文件                                 |
| os.path.samestat(stat1, stat2)      | 判断stat1和stat2是否指向同一个文件                           |
| os.path.split(path)                 | 把路径分割成 dirname 和 basename，返回一个元组               |
| os.path.splitdrive(path)            | 一般用在 windows 下，返回驱动器名和路径组成的元组            |
| os.path.splitext(path)              | 分割路径，返回路径名和文件扩展名的元组                       |
| os.path.supports_unicode_filenames  | 设置是否支持unicode路径名                                    |

### os.remove(path)

删除路径为 path 的文件。如果 path 是一个文件夹，将抛出 OSError 。

### os.rename(src, dst)

重命名。

### os.rmdir(path)

删除 path 指定的空目录，如果目录非空，则抛出一个 OSError 异常。

### os.unlink(path)

删除文件。

### os.pardir()

获取当前目录的父目录，以字符串形式显示目录名。

### os.replace(src, dst)

重命名文件或目录。

## Queue

### Queue.qsize()

### Queue.empty()

### Queue.full()

### Queue.put(item)

## random

### random.sample(sequence, k)

- 参数：
  - sequence：可以是一个列表，元组，字符串，或集合
  - k：一个整数值，它指定一个样本的长度

- 返回：从序列中选择元素的 k 长度的新列表。

## re

### flags参数值

- 默认 0 ，没有意义
- re.I 忽略大小写
- re.M 多行模式
- re.S 即为 `. ` ，并且包括换行符在内的任意字符（` . `不包括换行符）
- re.X 为了增加可读性，忽略空格和 `#` 后面的注释

### re.match(pattern, string[, flags])

从字符串的起始位置匹配一个模式，如果不是起始位置匹配成功的话则匹配失败。

```python
import re

print(re.match('www', 'www.runoob.com'))
print(re.match('www', 'www.runoob.com').span())
print(re.match('www', 'www.runoob.com').group())
print(re.match('com', 'www.runoob.com')) #匹配失败返回None
print(re.match('com', 'www.runoob.com').group()) #将抛出错误

#输出：
<re.Match object; span=(0, 3), match='www'>
(0, 3)
www
None
——错误描述——
```

### re.search(pattern, string[, flags])

扫描整个字符串并返回第一个成功的匹配。匹配成供返回 (x, y) ，失败返回 None ，同样有 .group() 方法。

### re.sub(pattern, repl, string[, count, flags])

替换字符串中的匹配项。参数 count 表示替换的最大次数，默认 0 表示替换所有的匹配。参数 repl 可以是一个函数。

### re.compile(pattern[, flags])

编译正则表达式，生成一个正则表达式对象。

```python
>>import re
>>> pattern = re.compile(r'\d+')                    # 用于匹配至少一个数字
>>> m = pattern.match('one12twothree34four')        # 查找头部，没有匹配
>>> print( m )
None
>>> m = pattern.match('one12twothree34four', 2, 10) # 从'e'的位置开始匹配，没有匹配
>>> print( m )
None
>>> m = pattern.match('one12twothree34four', 3, 10) # 从'1'的位置开始匹配，正好匹配
>>> print( m )                                        # 返回一个 Match 对象
<_sre.SRE_Match object at 0x10a42aac0>
>>> m.group(0)   # 可省略 0
'12'
>>> m.start(0)   # 可省略 0
3
>>> m.end(0)     # 可省略 0
5
>>> m.span(0)    # 可省略 0
(3, 5)

>>>import re
>>> pattern = re.compile(r'([a-z]+) ([a-z]+)', re.I)   # re.I 表示忽略大小写
>>> m = pattern.match('Hello World Wide Web')
>>> print( m )                            # 匹配成功，返回一个 Match 对象
<_sre.SRE_Match object at 0x10bea83e8>
>>> m.group(0)                            # 返回匹配成功的整个子串
'Hello World'
>>> m.span(0)                             # 返回匹配成功的整个子串的索引
(0, 11)
>>> m.group(1)                            # 返回第一个分组匹配成功的子串
'Hello'
>>> m.span(1)                             # 返回第一个分组匹配成功的子串的索引
(0, 5)
>>> m.group(2)                            # 返回第二个分组匹配成功的子串
'World'
>>> m.span(2)                             # 返回第二个分组匹配成功的子串索引
(6, 11)
>>> m.groups()                            # 等价于 (m.group(1), m.group(2), ...)
('Hello', 'World')
>>> m.group(3)                            # 不存在第三个分组
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: no such group
```

### re.findall(pattern, string[, flags])

也可写为 `pattern.findall(string[, pos[, endpos]]) ` 。

- pos 可选参数，指定字符串的起始位置，默认为 0。
- endpos 可选参数，指定字符串的结束位置，默认为字符串的长度。

找到正则表达式所匹配的所有子串，并返回一个列表；如果有多个匹配模式，则返回元组列表；如果没有找到匹配的，则返回空列表。

### re.finditer(pattern, string[, flags])

和 findall 类似，在字符串中找到正则表达式所匹配的所有子串，并把它们作为一个迭代器返回。

### re.split(pattern, string[, maxsplit, flags])

匹配的子串将字符串分割后返回列表。参数 maxsplit 表示分割次数，默认为 0，不限制次数。如果匹配不到，则以列表形式返回整个字符串。

## string

### string.ascii_letters

下面描述的 ascii_lowercase 和 ascii_uppercase 常量的串联。

### string.ascii_lowercase

小写字母 `abcdefghijklmnopqrstuvwxyz` 。

### string.ascii_uppercase

大写字母 `ABCDEFGHIJKLMNOPQRSTUVWXYZ` 。

### string.digits

字符串 `0123456789` 。

### string.hexdigits

字符串 `0123456789abcdefABCDEF` 。

### string.octdigits

字符串 `01234567` 。

### string.punctuation

在 C 语言环境中被视为标点符号的 ASCII 字符的字符串：`!"#$%&'()*+,-./:;<=>?@[\]^_{|}~` 。

# 函数

## abs、ceil、exp、fabs、floor、log、max、min、pow、round、sqrt

模块：math

用法：math.sqrt(2)

## (x>y)-(x<y)

如果 x < y 返回 -1 ，如果 x == y 返回 0 ，如果 x > y 返回 1 。

## 随机数相关

| 函数         | 描述                                                         |
| :----------- | :----------------------------------------------------------- |
| choice(seq)  | 从序列的元素中随机挑选一个元素，比如random.choice(range(10))，从0到9中随机挑选一个整数。 |
| random()     | 随机生成下一个实数，它在[0,1)范围内。                        |
| seed([x])    | 改变随机数生成器的种子seed。如果你不了解其原理，你不必特别去设定seed，Python会帮你选择seed。 |
| shuffle(lst) | 将序列的所有元素随机排序                                     |
| uniform(x,y) | 随机生成下一个实数，它在[x,y]范围内。                        |

## bin(x)

转为 2 进制数，0b 前缀，x 可为任意进制。

## enumerate()

```python
>>> for i, v in enumerate(['tic', 'tac', 'toe']):
...     print(i, v)
...
0 tic
1 tac
2 toe
```

## id(a)

获取变量 a 的地址。

## len(x)

返回 x 的长度，x 为 object 类型。

## oct(x)

转为 8 进制数，0o 前缀，x 可为任意进制。

## ord(x)

x 为字符，返回其 ASCII 码的十进制。

## range(x, y[, len])

生成 [x, y) 范围的数，间隔 len(默认为1) 。x 也可省，此时为 [0, y) 。

## type(a)

获取变量 a 的类型。
