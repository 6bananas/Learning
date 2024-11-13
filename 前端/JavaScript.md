# 概述

- 使用：
  1. \<head> 中 \<script>
  2. \<body> 中 \<script> （把脚本置于 \<body> 的底部，可改善显示速度，因为脚本编译会拖慢显示）
  3. \<script src="url">\</script>

- JavaScript 数值始终以双精度浮点数来存储。

- 整数（不使用指数或科学计数法）会被精确到 15 位。

- for in 和 for of 循环：

  ```javascript
  for (let x in numbers) {
    txt += numbers[x];
  }
  
  for (let x of numbers) {
    console.log(x);
  }
  ```

  for … in 如果是对象，则循环的是键；如果是数组，则循环的是下标。

  for … of 如果是对象，不可循环（没有 Symbol.iterator 属性）；如果是数组，则循环的是值。

- toString() 方法是公有的，有的地方没列出来，但知道有就好。

- this 关键字：

  - 单独的情况下，`this` 指的是全局对象。
  - 对于常规函数，`this` 表示调用该函数的对象。
  - 用了箭头函数，则 `this` 表示函数的拥有者。
  - 在函数中，严格模式下，`this` 是 undefined 。
  - 在事件中，`this` 指的是接收事件的元素。
  
- debugger 关键字：调试用，如果调试器已打开，此代码会在执行第三行之前停止运行。

  ```javascript
  var x = 15 * 5;
  debugger;
  document.getElementbyId("demo").innerHTML = x; 
  ```

# 语法

## 输出

### innerHTML

写入 HTML 元素。

```javascript
//<p id="demo"></p>
document.getElementById("demo").innerHTML=xxx;
```

### document.write()

写入 HTML 输出，即直接 echo 。注意，在 HTML 文档完全加载后使用（即\<script>放最底部）。document.write() 将删除所有已有的 HTML（即清屏echo）。

```javascript
document.write(xxx);
```

### window.alert()

浏览器弹窗，也可以不带 window 前缀来写。

```javascript
window.alert(xxx);
```

### console.log()

输出到浏览器控制台。

```javascript
console.log(xxx);
```

## 变量

### 关键字

- var
- let

### 变量名规则

1. 首字符：变量名必须以字母（a-z，A-Z）、下划线（_）或美元符号（$）开头，不能以数字开头。

2. 后续字符：变量名的后续字符可以是字母、数字、下划线或美元符号，但不能包含空格或其他特殊字符。

3. 区分大小写：JavaScript 的变量名是区分大小写的。

4. 避免保留字：变量名不能使用 JavaScript 的关键字或保留字（例如 `let`、`var`、`function`、`if` 等），否则会导致语法错误。

5. 命名规范：
   - 驼峰命名法（camelCase）：这是 JavaScript 变量的常见命名风格，首个单词全小写，后续单词首字母大写。例如 `firstName`、`totalCount `。
   - 全部大写加下划线分隔：通常用于表示常量，如 `MAX_VALUE`、`DEFAULT_COLOR` 。

6. 语义化：建议变量名要有具体的含义，能够表达其用途。                                                                                     

### 作用域                                    

1. 全局作用域。

2. 函数作用域：局部变量只能在它们被声明的函数内访问。  

3. 块作用域：

   -  通过 `var` 关键词声明的变量没有块作用域。

     ```javascript
     { 
       var x = 10; 
     }
     // 此处可以使用 x
     ```

   - 使用 `let` 关键词声明的变量拥有块作用域的变量。

     ```javascript
     { 
       let x = 10;
     }
     // 此处不可以使用 x
     ```

   - 注意这种也属于块作用域：

     ```javascript
     for (var i = 0; i < 10; i++) {
       // 一些语句
     }
     ```

### 提升

通过 `var` 声明的变量会提升到顶端：

```javascript
// 在此处，您可以使用 carName
var carName;
```

而 `let` 不行。

### 注意事项

1. 可以在一条语句中声明许多变量，如 `var person = "Bill Gates", carName = "porsche", price = 15000;` 。

3. 使用 JavaScript 的情况下，全局作用域是 JavaScript 环境。在 HTML 中，全局作用域是 window 对象。通过 `var` 关键词定义的全局变量属于 window 对象，通过 `let` 关键词定义的全局变量不属于 window 对象。

   ```javascript
   var carName = "porsche";
   // 此处的代码可使用 window.carName
   let carName = "porsche";
   // 此处的代码不可使用 window.carName
   ```

4. 在相同的作用域，或在相同的块中，通过 `let` 重新声明一个 `var` 变量是不允许的：

   ```javascript
   var x = 10;       // 允许
   let x = 6;       // 不允许
   
   {
     var x = 10;   // 允许
     let x = 6;   // 不允许
   }
   ```

   在相同的作用域，或在相同的块中，通过 `let` 重新声明一个 `let` 变量是不允许的：

   ```javascript
   let x = 10;       // 允许
   let x = 6;       // 不允许
   
   {
     let x = 10;   // 允许
     let x = 6;   // 不允许
   }
   ```

   在相同的作用域，或在相同的块中，通过 `var` 重新声明一个 `let` 变量是不允许的：

   ```javascript
   let x = 10;       // 允许
   var x = 6;       // 不允许
   
   {
     let x = 10;   // 允许
     var x = 6;   // 不允许
   }
   ```

   在不同的作用域或块中，通过 `let` 重新声明变量是允许的：

   ```javascript
   let x = 6;       // 允许
   
   {
     let x = 7;   // 允许
   }
   
   {
     let x = 8;   // 允许
   }
   ```

## const

### 概述

与 C 语言的 const 类似，且必须在声明时赋值：

```javascript
//错误
const PI;
PI = 3.14159265359
```

### 注意事项

1. 可以更改常量对象的属性：

   ```javascript
   // 您可以创建 const 对象：
   const car = {type:"porsche", model:"911", color:"Black"};
   
   // 您可以更改属性：
   car.color = "White";
   
   // 您可以添加属性：
   car.owner = "Bill";
   ```

   但是无法重新为常量对象赋值：

   ```javascript
   const car = {type:"porsche", model:"911", color:"Black"};
   car = {type:"Volvo", model:"XC60", color:"White"};    // ERROR
   ```

   该规则也适用于常量数组。

2. 在同一作用域或块中，不允许将已有的 `var` 或 `let` 变量重新声明或重新赋值给 `const`：

   ```javascript
   var x = 2;         // 允许
   const x = 2;       // 不允许
   {
     let x = 2;     // 允许
     const x = 2;   // 不允许
   }
   ```

3. 在同一作用域或块中，为已有的 const 变量重新声明或赋值是不允许的：

   ```javascript
   const x = 2;       // 允许
   const x = 3;       // 不允许
   x = 3;             // 不允许
   var x = 3;         // 不允许
   let x = 3;         // 不允许
   
   {
     const x = 2;   // 允许
     const x = 3;   // 不允许
     x = 3;         // 不允许
     var x = 3;     // 不允许
     let x = 3;     // 不允许
   }
   ```

   在另外的作用域或块中重新声明 `const` 是允许的：

   ```javascript
   const x = 2;       // 允许
   
   {
     const x = 3;   // 允许
   }
   
   {
     const x = 4;   // 允许
   }
   ```

4. const 定义的量也不能提升。

## 运算符

| 运算符   | 描述         |
| :------- | :----------- |
| **       | 幂           |
| ===、!== | 类似 PHP     |
| &        | 与           |
| \|       | 或           |
| ~        | 非           |
| ^        | 异或         |
| <<       | 零填充左位移 |
| >>       | 有符号右位移 |
| >>>      | 零填充右位移 |

## 数据类型

### 概述

字符串、数、布尔（true/false）、数组、对象，但 Javascript 是弱类型语言。

如果变量没有赋值，则为 undefined 类型。

null 的数据类型是对象。可以通过设置值为 `null` 清空对象，也可以通过设置值为 `undefined` 清空对象。

`undefined` 与 `null` 的值相等，但类型不相等：

```javascript
null === undefined            // false
null == undefined             // true
```

### typeof

返回数据类型：

```javascript
typeof "Bill"              // 返回 "string"
typeof 0                   // 返回 "number"
```

返回值：

- string
- number
- boolean
- undefined
- function
- object

### 数值

- NaN：Not a Number

  ```javascript
  var x = 100 / "Apple";  //NaN
  ```

  but

  ```javascript
  var x = 100 / "10";     //10
  ```

  isNaN(x)：判断某个值是否是 NaN 。

  假如您在数学运算中使用了 `NaN`，则结果也将是 `NaN` 。

  `NaN` 是数，`typeof NaN` 返回 `number` 。

- [-]Infinity：JavaScript 在计算数时超出最大可能数范围时返回的值。

  除以 0 也会生成 `Infinity` 。

  `typeOf Infinity` 返回 `number` 。

- JavaScript 支持使用进制数，可以使用 `toString()` 方法把数输出为十六进制、八进制或二进制：

  ```javascript
  var myNumber = 128;
  myNumber.toString(16);     // 返回 80
  myNumber.toString(8);      // 返回 200
  myNumber.toString(2);      // 返回 10000000
  ```

- 函数：

  - num.toString()：返回数值。

    ```javascript
    var x = 123;
    x.toString();            // 从变量 x 返回 123
    (123).toString();        // 从文本 123 返回 123
    (100 + 23).toString();   // 从表达式 100 + 23 返回 123
    ```

  - num.toExponential([x])：返回字符串值，它包含已被四舍五入并使用科学计数法的数字。

    ```javascript
    var x = 9.656;
    x.toExponential(2);     // 返回 9.66e+0
    x.toExponential(4);     // 返回 9.6560e+0
    x.toExponential(6);     // 返回 9.656000e+0
    ```

    如果没有设置舍入位，JavaScript 不会对数字进行舍入。

  - num.toFixed(x)：返回字符串值，它包含了根据位数舍入的数字。

    ```javascript
    var x = 9.656;
    x.toFixed(0);           // 返回 10
    x.toFixed(2);           // 返回 9.66
    x.toFixed(4);           // 返回 9.6560
    x.toFixed(6);           // 返回 9.656000
    ```

  - num.toPrecision()：返回字符串值，它包含了根据指定长度舍入的数字。

    ```javascript
    var x = 9.656;
    x.toPrecision();        // 返回 9.656
    x.toPrecision(2);       // 返回 9.7
    x.toPrecision(4);       // 返回 9.656
    x.toPrecision(6);       // 返回 9.65600
    ```

  - num.valueOf()：以数值返回数值，且可将 Number 对象转换为原始值。

    ```javascript
    var x = 123;
    x.valueOf();            // 从变量 x 返回 123
    (123).valueOf();        // 从文本 123 返回 123
    (100 + 23).valueOf();   // 从表达式 100 + 23 返回 123
    ```

  - Number()：把 JavaScript 变量转换为数值。

    ```javascript
    x = true;
    Number(x);        // 返回 1
    x = false;     
    Number(x);        // 返回 0
    x = new Date();
    Number(x);        // 返回 1404568027739，1970年1月1日至今的毫秒数
    x = "10"
    Number(x);        // 返回 10
    x = "10 20"
    Number(x);        // 返回 NaN
    ```

  - parseInt()：解析一段字符串并返回数值，允许空格，只返回首个数字。

    ```javascript
    parseInt("10");         // 返回 10
    parseInt("10.33");      // 返回 10
    parseInt("10 20 30");   // 返回 10
    parseInt("10 years");   // 返回 10
    parseInt("years 10");   // 返回 NaN
    ```

  - parseFloat()：解析一段字符串并返回数值，允许空格，只返回首个数字。

    ```javascript
    parseFloat("10");        // 返回 10
    parseFloat("10.33");     // 返回 10.33
    parseFloat("10 20 30");  // 返回 10
    parseFloat("10 years");  // 返回 10
    parseFloat("years 10");  // 返回 NaN
    ```

- 数字属性：

  | 属性                                                         | 描述                          |
  | :----------------------------------------------------------- | :---------------------------- |
  | [EPSILON](https://www.w3school.com.cn/jsref/jsref_number_epsilon.asp) | 1 和大于 1 的最小数之间的差。 |
  | [MAX_VALUE](https://www.w3school.com.cn/jsref/jsref_max_value.asp) | JavaScript 中可能的最大数。   |
  | [MIN_VALUE](https://www.w3school.com.cn/jsref/jsref_min_value.asp) | JavaScript 中可能的最小数。   |
  | [MAX_SAFE_INTEGER](https://www.w3school.com.cn/jsref/jsref_max_safe_integer.asp) | 最大安全整数。                |
  | [MIN_SAFE_INTEGER](https://www.w3school.com.cn/jsref/jsref_min_safe_integer.asp) | 最小安全整数。                |
  | [POSITIVE_INFINITY](https://www.w3school.com.cn/jsref/jsref_positive_infinity.asp) | 无穷大（溢出时返回）。        |
  | [NEGATIVE_INFINITY](https://www.w3school.com.cn/jsref/jsref_negative_infinity.asp) | 负无穷大（溢出时返回）。      |
  | [NaN](https://www.w3school.com.cn/jsref/jsref_number_nan.asp) | “非数字”值。                  |

### 布尔

- 所有”真实“值都为 true ，如 100、"Hello"、"false"、5 < 6 。
- 所有不具有“真实”值的即为 false ，如 0、-0、""、undefined、null、false、NaN 。

### 字符串

- 可被单/双引号包围。

- 可使用 + 。

- 可使用 `${...}` 进行模板替换，类似 Python 的 f-string ，但必须使用反引号包围整个字符串。`{}` 内可为变量名或表达式。

  ```javascript
  let firstName = "Bill";
  let lastName = "Gates";
  let text = `Welcome ${firstName}, ${lastName}!`;
  ```

- 数值与字符串级联：

  ```javascript
  var "10"+20; //"1020"
  var "a"+10+10; //"a20"
  ```

- 字符串换行：

  ```javascript
  document.getElementById("demo").innerHTML = "Hello \
  World!";
  ```

- 函数：

  - str.length：返回字符串长度。

  - str.indexOf("xxx"[, index])：返回字串 xxx 第一次出现的位置。index - 指定开始检索的位置。

  - str.search("xxx")：返回字串 xxx 第一次出现的位置。

    > `indexOf()` 与 `search()`，是相等的。
    >
    > 但这两种方法又是不相等的，区别在于：
    >
    > - search() 方法无法设置第二个开始位置参数。
    > - indexOf() 方法无法设置正则表达式。

  - str.lastindexOf("xxx"[, index])

    > 如果未找到文本，`indexOf()` 和 `lastIndexOf()` 均返回 -1。

  - str.slice(begin, end)：截取 [begin, end) 区间的字符串。如果某个参数为负，则从字符串结尾开始计数。如果省略第二个参数，则该方法将裁剪至计数方向的尽头。

  - str.substring(begin, end)：类似 slice() ，但无法接受负的索引。

  - str.substr(begin, length)：类似 slice() ，但第二个参数规定被提取部分的长度。如果省略第二个参数，则该方法将裁剪至计数方向的尽头。

  - str.replace("old", "new")：字符串替换，返回替换后的整个新字符串，并只替换首个匹配、支持正则。

  - str.toUpperCase()：转大写。

  - str.toLowerCase()

  - str.concat("str1"[, "str2", ...])：字符串连接，返回新的整个字符串。

  - str.trim()：字符串两端去空格。

  - str.charAt()：返回指定下标的字符。

  - str.charCodeAt()：返回指定索引字符的 unicode 编码。

  - str[index]：不适用 IE7 或更早的版本。如果找不到字符，将返回 `undefined` 。它是只读的，`str[0] = "A"` 不会产生错误（但也不会工作）：

    ```javascript
    var str = "HELLO WORLD";
    str[0] = "A";             // 不产生错误，但不会工作
    str[0];                   // 返回 H
    ```

  - str.split("flag")：将字符串转换为数组，flag 为拆分标志。
  
  - str.match(xxx)：正则匹配，结果以数组形式返回。
  
  - str.includes("xxx")：返回 true/false 。
  
  - str.startsWith("xxx"[, index])：返回 true/false ，index 指定起始搜索位置。
  
  - str.startsWith("xxx"[, length])：返回 true/false ，length 指定搜索子串的长度。

### 数组

- 定义：

  ```javascript
  var cars = ["Saab", "Volvo", "BMW"];
  var cars = new Array("Saab", "Volvo", "BMW");
  ```

- 访问：

  ```javascript
  var name = cars[0]; //下标法
  
  var cars = ["Audi", "BMW", "porsche"];
  document.getElementById("demo").innerHTML = cars; //Audi,BMW,porsche
  ```

- 数组是一种特殊类型的对象。在 JavaScript 中对数组使用 `typeof` 运算符会返回 "object" 。

- 方法：

  - arr.length

  - arr.push(x)：push 到末尾，返回新数组的长度。

  - arr.unshift(x)：类似 push() ，但是插入开头。

  - arr.pop()：从末尾 pop 。

  - arr.shift()：类似 pop() ，但从开头。

  - Array.isArray(arr)

  - arr.toString()

    ```javascript
    var fruits = ["Banana", "Orange", "Apple", "Mango"];
    document.getElementById("demo").innerHTML = fruits.toString(); //Banana,Orange,Apple,Mango
    ```

  - arr.join("flag")：类似 toString()，但是可以规定分隔符 flag 。

    ```javascript
    var fruits = ["Banana", "Orange","Apple", "Mango"];
    document.getElementById("demo").innerHTML = fruits.join(" * ");  
    //Banana * Orange * Apple * Mango
    ```

  - delete：删除，但会在数组留下未定义的空洞。

    ```javascript
    var fruits = ["Banana", "Orange", "Apple", "Mango"];
    delete fruits[0];           // 把 fruits 中的首个元素改为 undefined
    ```

  - arr.concat(arr1[, arr2, ...])

  - arr.slice(begin[, end])：裁剪数组。

  - arr.sort([function])：排序。

  - arr.reverse()
  
  - [迭代](https://www.w3school.com.cn/js/js_array_iteration.asp) ：
  
    > arr.forEach()、arr.map()、arr.filter()、arr.reduce()、arr.reduceRight()、arr.every()、arr.some()、arr.indexOf()、arr.lastIndexOf()、arr.find()、arr.findIndex()、

### 对象

- 类似 Python 的字典。

- 对象也可以有方法：

  ```javascript
  var person = {
    firstName: "Bill",
    lastName : "Gates",
    id       : 678,
    fullName : function() {
      return this.firstName + " " + this.lastName;
    }
  };
  ```

- 访问：

  1. person.lastName
  2. person["lastName"]
  3. person.fullName()
  
- Object.values()

  ```javascript
  const person = {
    name: "Bill",
    age: 19,
    city: "Seattle"
  };
  
  const myArray = Object.values(person);
  document.getElementById("demo").innerHTML = myArray;
  //Bill,19,Seattle
  ```

### 类型转换

| 原始值           | 转换为数字 | 转换为字符串      | 转换为逻辑 |
| :--------------- | :--------- | :---------------- | :--------- |
| false            | 0          | "false"           | false      |
| true             | 1          | "true"            | true       |
| 0                | 0          | "0"               | false      |
| 1                | 1          | "1"               | true       |
| "0"              | 0          | "0"               | `true`     |
| "000"            | 0          | "000"             | `true`     |
| "1"              | 1          | "1"               | true       |
| NaN              | NaN        | "NaN"             | false      |
| Infinity         | Infinity   | "Infinity"        | true       |
| -Infinity        | -Infinity  | "-Infinity"       | true       |
| ""               | `0`        | ""                | `false`    |
| "20"             | 20         | "20"              | true       |
| "twenty"         | NaN        | "twenty"          | true       |
| [ ]              | `0`        | ""                | true       |
| [20]             | `20`       | "20"              | true       |
| [10,20]          | NaN        | "10,20"           | true       |
| ["twenty"]       | NaN        | "twenty"          | true       |
| ["ten","twenty"] | NaN        | "ten,twenty"      | true       |
| function(){}     | NaN        | "function(){}"    | true       |
| { }              | NaN        | "[object Object]" | true       |
| null             | `0`        | "null"            | false      |
| undefined        | NaN        | "undefined"       | false      |

方法：

- String(xxx)
- Number(xxx)
- Boolean(xxx)

## 函数

### 常规函数

```javascript
function toCelsius(f) {
    return (5/9) * (f-32);
}
document.getElementById("demo").innerHTML = toCelsius;
```

### 箭头函数

```javascript
hello = function() {
  return "Hello World!";
}
==>
hello = () => {
  return "Hello World!";
}
```

如果函数只有一个语句，并且该语句返回一个值，则可以去掉括号和 `return` 关键字：

```javascript
hello = () => "Hello World!";
//如果您有参数，则将它们传递到括号内
hello = (val) => "Hello " + val;
//也可以略过括号
hello = val => "Hello " + val;
```

### 函数表达式

```javascript
var x = function (a, b) {return a * b}; //函数表达式在变量中存储
var z = x(4, 3);
```

### Function()构造器

```javascript
var myFunction = new Function("a", "b", "return a * b");
```

### 自调用函数

```javascript
(function () {
    var x = "Hello!!";      // 我会调用我自己
})();
```

### call()

不带参数：

```javascript
var person = {
    fullName: function() {
        return this.firstName + " " + this.lastName;
    }
}
var person1 = {
    firstName:"Bill",
    lastName: "Gates",
}
var person2 = {
    firstName:"Steve",
    lastName: "Jobs",
}
person.fullName.call(person1);  // 将返回 "Bill Gates"
```

带参数：

```javascript
var person = {
  fullName: function(city, country) {
    return this.firstName + " " + this.lastName + "," + city + "," + country;
  }
}
var person1 = {
  firstName:"Bill",
  lastName: "Gates"
}
person.fullName.call(person1, "Seattle", "USA");
```

### apply()

与 call() 类似，但 apply() 接受参数时要求是数组形式：`person.fullName.apply(person1, ["Oslo", "Norway"]);` 。

### 函数回调

```javascript
function myDisplayer(some) {
  document.getElementById("demo").innerHTML = some;
}

function myCalculator(num1, num2, myCallback) {
  let sum = num1 + num2;
  myCallback(sum);
}

myCalculator(5, 5, myDisplayer);
```

### 注意事项

- 函数能够在声明之前被调用（即提升），但使用表达式定义的函数不会被提升。
- 如果函数调用时省略了参数（少于被声明的数量），则丢失的值被设置为 undefined 。
- arguments 对象：JavaScript 函数有一个名为 arguments 的内置对象，该对象为函数调用时的参数数组。

## 事件

如：

```javascript
<button onclick='document.getElementById("demo").innerHTML=Date()'>现在的时间是？</button>
```

常见的 HTML 事件：

| 事件        | 描述                         |
| :---------- | :--------------------------- |
| onchange    | HTML 元素已被改变            |
| onclick     | 用户点击了 HTML 元素         |
| onmouseover | 用户把鼠标移动到 HTML 元素上 |
| onmouseout  | 用户把鼠标移开 HTML 元素     |
| onkeydown   | 用户按下键盘按键             |
| onload      | 浏览器已经完成页面加载       |

## 日期

### 创建

返回格式都是 `Tue Apr 02 2019 09:01:19 GMT+0800 (中国标准时间)` ，可以使用 toDateString() 方法使其返回为 `Fri Mar 10 2023` 格式。

注意 JavaScript 里 1~12 月对应 0~11 。

创建方法：

- new Date()

- new Date(year, month, day, hours, minutes, seconds, milliseconds)：6 个数字指定年、月、日、小时、分钟、秒；5 个数字指定年、月、日、小时和分钟；4 个数字指定年、月、日和小时……不能省略月份，如果只提供一个参数，则将其视为毫秒。

  一位和两位数年份将被解释为 19xx 年。

- new Date("dateString")：YYYY-MM-DD、YYYY-MM、YYYY、YYYY-MM-DDTHH:MM:SS、MM/DD/YYYY、Apr DD YYYY 或 DD Apr YYYY（Apr - 星期的前三位，也可以用全称、也可以大写；分隔符用“逗号+空格"也行）。

- new Date(milliseconds)

### 相关方法

getter

| 方法              | 描述                                   |
| :---------------- | :------------------------------------- |
| getDate()         | 以数值返回天（1-31）                   |
| getDay()          | 以数值获取周名（0-6）                  |
| getFullYear()     | 获取四位的年（yyyy）                   |
| getHours()        | 获取小时（0-23）                       |
| getMilliseconds() | 获取毫秒（0-999）                      |
| getMinutes()      | 获取分（0-59）                         |
| getMonth()        | 获取月（0-11）                         |
| getSeconds()      | 获取秒（0-59）                         |
| getTime()         | 获取毫秒数（从 1970 年 1 月 1 日至今） |

setter（做为参数的数字不需要引号包围）

| 方法              | 描述                                         |
| :---------------- | :------------------------------------------- |
| setDate()         | 以数值（1-31）设置日                         |
| setFullYear()     | 设置年（可选月和日）                         |
| setHours()        | 设置小时（0-23）                             |
| setMilliseconds() | 设置毫秒（0-999）                            |
| setMinutes()      | 设置分（0-59）                               |
| setMonth()        | 设置月（0-11）                               |
| setSeconds()      | 设置秒（0-59）                               |
| setTime()         | 设置时间（从 1970 年 1 月 1 日至今的毫秒数） |

## Math

### 常见方法

- Math.round(x)
- Math.pow(x, y)
- Math.sqrt(x)
- Math.abs(x)
- Math.ceil(x)
- Math.floor(x)
- Math.min(a, b[, c, d, ...])、Math.max(a, b[, c, d, ...])

### 常见常数

```javascript
Math.E          // 返回欧拉指数（Euler's number）
Math.PI         // 返回圆周率（PI）
Math.SQRT2      // 返回 2 的平方根
Math.SQRT1_2    // 返回 1/2 的平方根
Math.LN2        // 返回 2 的自然对数
Math.LN10       // 返回 10 的自然对数
Math.LOG2E      // 返回以 2 为底的 e 的对数（约等于 1.414）
Math.LOG10E     // 返回以 10 为底的 e 的对数（约等于 0.434）
```

### 随机数

Math.random()：返回 [0, 1) 之间的随机数。扩大范围：Math.random() * 10 。返回整数：Math.floor(Math.random() * 10) 。

## 异常

与 Java 大致相同，说明几点：

1. catch() 里不需要指定错误类型，`catch(err)` 即可。

2. 只有 throw ，用法同 Java 。

3. Error 对象属性：

   | 属性    | 描述                             |
   | :------ | :------------------------------- |
   | name    | 设置或返回错误名                 |
   | message | 设置或返回错误消息（一条字符串） |

4. Error Name Value：

   | 错误名         | 描述                          |
   | :------------- | :---------------------------- |
   | EvalError      | 已在 eval() 函数中发生的错误  |
   | RangeError     | 已发生超出数字范围的错误      |
   | ReferenceError | 已发生非法引用                |
   | SyntaxError    | 已发生语法错误                |
   | TypeError      | 已发生类型错误                |
   | URIError       | 在 encodeURI() 中已发生的错误 |

5. 基本使用：

   ```javascript
   try {
       xxx
    }
   catch(err) {
       document.getElementById("demo").innerHTML = err.name;
   }
   //输出某个Error Name Value
   ```

## 严格模式

在 \<script> 标签的开头，即脚本开头加上 `"use strict";` 来进入“严格模式”，该模式下将严格遵循 JavaScript 语法和相关规定。

规定如下：

- 删除变量、对象、函数是不允许的，即 delete 关键字不能用。
- 八进制数值文本是不允许的。
- 转义字符是不允许的。
- 字符串 "eval"、"arguments" 不可用作变量名。
- `with` 语句是不允许的。

## 类

### 定义

```javascript
class xxx{
    constructor() { //构造方法
    	xxx
	}
    hello([x, y, z]){ //普通方法
        xxx
        [return xxx;]
    }
}

var x=new xxx();
x.hello();
```

### 继承

同 Java 。

### static方法

不能在类的实例上调用 static 方法，只能通过类本身调用：

```javascript
class Car {
  constructor(name) {
    this.name = name;
  }
  static hello() {
    return "Hello!!";
  }
}

let myCar = new Car("Ford");

// 您可以在 Car 类上调用 'hello()'
document.getElementById("demo").innerHTML = Car.hello();
// 但不能在 Car 对象上调用
document.getElementById("demo").innerHTML = myCar.hello();
// 此举将引发错误
```

### 注意事项

- JavaScript 类不是对象，它只是对象的模板。
- JavaScript 类也有 getter/setter ，用法同对象。
- 类声明不会被提升，必须先声明类，然后才能使用它。

## 对象

### 概述

- 在 JavaScript 中，几乎所有事物都是对象。
  - 布尔是对象（如果用 new 关键词定义）
  - 数字是对象（如果用 new 关键词定义）
  - 字符串是对象（如果用 new 关键词定义）
  - 日期永远都是对象
  - 算术永远都是对象
  - 正则表达式永远都是对象
  - 数组永远都是对象
  - 函数永远都是对象
  - 对象永远都是对象

- 对象是易变的，它们通过引用来寻址，而非值。

  ```javascript
  var person = {firstName:"Bill", lastName:"Gates", age:62, eyeColor:"blue"}
  var x = person;
  x.age = 10;           // 这将同时改变 x.age 和 person.age
  ```

### getter/setter

```javascript
//get
var person = {
  firstName: "Bill",
  lastName : "Gates",
  language : "en",
  get lang() {
    return this.language;
  }
};
document.getElementById("demo").innerHTML = person.lang;
//set
var person = {
  firstName: "Bill",
  lastName : "Gates",
  language : "",
  set lang(lang) {
    this.language = lang;
  }
};
person.lang = "en";
document.getElementById("demo").innerHTML = person.language;
```

### 构造器

```javascript
// 使用构造器函数构造 Person 对象
function Person(first, last, age, eye) {
  this.firstName = first;
  this.lastName = last;
  this.age = age;
  this.eyeColor = eye;
}
// 创建 Person 对象
var myFriend = new Person("Bill", "Gates", 62, "blue");
```

### Map

- Map 对象存有键值对，其中的键可以是任何数据类型；Map 对象记得键的原始插入顺序。

- 创建：

  ```javascript
  // 创建对象
  const apples = {name: 'Apples'};
  const bananas = {name: 'Bananas'};
  const oranges = {name: 'Oranges'};
  
  // 创建新的 Map
  const fruits = new Map();
  
  // Add new Elements to the Map
  fruits.set(apples, 500);
  fruits.set(bananas, 300);
  fruits.set(oranges, 200);
  
  //也可以使用数组创建
  const fruits = new Map([
    [apples, 500],
    [bananas, 300],
    [oranges, 200]
  ]);
  ```

- 方法：

  | Method       | Description                   |
  | :----------- | :---------------------------- |
  | set()        | 为 Map 对象中的键设置值。     |
  | get()        | 根据键获取 Map 对象中的值。   |
  | entries()    | 返回 Map 对象中键值对的数组。 |
  | keys()       | 返回 Map 对象中键的数组。     |
  | values()     | 返回 Map 对象中值的数组。     |
  | clear()      | 删除 Map 中的所有元素。       |
  | delete()     | 删除由键指定的元素。          |
  | has()        | 如果键存在，则返回 true。     |
  | mapName.size | 获取 Map 中元素数量。         |

### Set

- Set 是唯一值的集合，每个值在 Set 中只能出现一次，一个 Set 可以容纳任何数据类型的任何值。

- 创建：

  ```javascript
  // 创建新的变量
  const a = "a";
  const b = "b";
  const c = "c";
  
  // 创建 Set
  const letters = new Set();
  
  // Add the values to the Set
  letters.add(a);
  letters.add(b);
  letters.add(c);
  
  //也可以使用数组创建
  const letters = new Set(["a","b","c"]);
  ```

- 方法：

  | 方法         | 描述                      |
  | ------------ | ------------------------- |
  | add()        | 向 Set 添加新元素。       |
  | clear()      | 从 Set 中删除所有元素。   |
  | delete()     | 删除由其值指定的元素。    |
  | entries()    | 返回 Set 对象中值的数组。 |
  | has()        | 如果值存在则返回 true。   |
  | keys()       | 返回 Set 对象中值的数组。 |
  | values()     | 与 keys() 相同。          |
  | setName.size | 返回元素个数。            |

## DOM

DOM，Document Object Model，文档对象模型，即 HTML DOM 。

### 查找HTML元素

1. 通过 id ：`var myElement = document.getElementById("intro");` 。如果元素被找到，此方法会以对象返回该元素，myElement.innerHTML 将存储元素的内容。如果未找到元素，myElement 将包含 null 。

2. 通过标签名：`var x = document.getElementsByTagName("p");` 。所有查找结果将存储到名为 x 的数组中，x[index].innerHTML 将存储对应元素的内容。看起来像数组，且存在 x.length ，但实际上并不是真正的数组，无法使用数组方法，比如 `valueOf()`、`pop()`、`push()` 或 `join()` 。

3. 通过类名：`var x = document.getElementsByClassName("intro");` ，类似 2 。

4. 通过 CSS 选择器：`var x = document.querySelectorAll("p.intro");` ，类似 2 。

5. 通过 HTML 对象选择器：

   ```javascript
   /*
   <form id="frm1" action="/demo/demo_form.asp">
     First name: <input type="text" name="fname" value="Bill"><br>
     Last name: <input type="text" name="lname" value="Gates"><br><br>
     <input type="submit" value="提交">
   </form> 
   */
   function myFunction() {
     var x = document.forms["frm1"];
     var text = "";
     var i;
     for (i = 0; i < x.length; i++) {
       text += x.elements[i].value + "<br>";
     }
     document.getElementById("demo").innerHTML = text;
   }
   //二阶数组获取
   var x = document.forms["frm1"]["fname"]
   ```

### 改变CSS

1. 改变属性：

   ```javascript
   //<img id="myImage" src="smiley.gif">
   document.getElementById("myImage").src = "landscape.jpg";
   ```

2. 改变属性值：

   ```javascript
   //<p id="p2">Hello World!</p>
   document.getElementById("p2").style.color = "blue";
   ```

### 事件

分配事件：

```javascript
//<button id="myBtn">试一试</button>
document.getElementById("myBtn").onclick = displayDate;
function displayDate() {
  document.getElementById("demo").innerHTML = Date();
}
```

事件类型：

- onclick

- onload、onunload：当用户进入后及离开页面时，会触发 `onload` 和 `onunload` 事件。

- onchange：经常与输入字段验证结合使用。

  ```javascript
  /*
  请输入您的名字：<input type="text" id="fname" onchange="myFunction()">
  <p>离开输入字段时，会触发一个函数，将输入文本转换为大写。</p>
  */
  function myFunction() {
    var x = document.getElementById("fname");
    x.value = x.value.toUpperCase();
  }
  ```

- onmouseover、onmouseout：用于当用户将鼠标移至 HTML 元素上或移出时触发某个函数。

- onmousedown、onmouseup：当鼠标点击时，`onmousedown` 事件被触发；当鼠标点击后释放时，`onmouseup` 事件被触发。

- onfocus：当输入框获得焦点时触发。

- onerror：加载外部文件出错时触发。

### 事件监听

`addEventListener()` 方法为指定元素指定事件处理程序，且不会覆盖已有的事件处理程序，即能够向一个元素添加多个事件处理程序。

```javascript
document.getElementById("idname").addEventListener("event", function, useCapture);
```

第一个参数是事件的类型，比如 "click" 或 "mousedown" 。

第二个参数是当事件发生时我们需要调用的函数。

第三个参数是布尔值，指定使用事件冒泡还是事件捕获。此参数是可选的，默认值是 `false` ，即使用冒泡传播。

> 在 HTML DOM 中有两种事件传播的方法：冒泡和捕获。
>
> 事件传播是一种定义当发生事件时元素次序的方法。假如 <div> 元素内有一个 <p>，然后用户点击了这个 <p> 元素，应该首先处理哪个元素“click”事件？
>
> 在冒泡中，最内侧元素的事件会首先被处理，然后是更外侧的：首先处理 <p> 元素的点击事件，然后是 <div> 元素的点击事件。
>
> 在捕获中，最外侧元素的事件会首先被处理，然后是更内侧的：首先处理 <div> 元素的点击事件，然后是 <p> 元素的点击事件。

`removeEventListener()` 方法会删除已通过 `addEventListener()` 方法附加的事件处理程序：

```javascript
document.getElementById("idname").removeEventListener("event", function)
```

### 节点

- 节点导航：

  - parentNode
  - childNodes[*nodenumber*]
  - firstChild
  - lastChild
  - nextSibling（下一个兄弟节点）
  - previousSibling

- 节点值：DOM 处理中的一种常见错误是认为元素节点中包含文本。在 `<title id="demo">DOM 教程</title> ` 中，元素节点 \<title> 不包含文本，它包含了值为 "DOM 教程" 的文本节点。

  文本节点的值能够通过节点的 innerHTML 属性进行访问：`var myTitle = document.getElementById("demo").innerHTML;` 。

  访问 innerHTML 属性等同于访问首个子节点的 `nodeValue`：`var myTitle = document.getElementById("demo").firstChild.nodeValue;` 。

  也可以这样访问第一个子节点：`var myTitle = document.getElementById("demo").childNodes[0].nodeValue;` 。

- DOM 根节点：

  - document.body - 整个 HTML 文档的 \<body> 部分
  - document.documentElement - 完整的 HTML 文档
  
- nodeName：

  - nodeName 是只读的
  - 元素节点的 nodeName 等同于标签名（大写）
  - 属性节点的 nodeName 是属性名称
  - 文本节点的 nodeName 总是 #text ，即无论什么文本节点，其 nodeName 的值都是常量 "#text"
  - 文档节点的 nodeName 总是 #document ，即无论什么文档节点，其 nodeName 的值都是常量 "#document"

- nodeValue：

  - 元素节点的 nodeValue 是 undefined
  - 文本节点的 nodeValue 是文本
  - 属性节点的 nodeValue 是属性值

- nodeType：

  | 节点               | 类型 | 例子                              |
  | :----------------- | :--- | :-------------------------------- |
  | ELEMENT_NODE       | 1    | <h1 class="heading">W3School</h1> |
  | ATTRIBUTE_NODE     | 2    | class = "heading" （弃用）        |
  | TEXT_NODE          | 3    | W3School                          |
  | COMMENT_NODE       | 8    | <!-- 这是注释 -->                 |
  | DOCUMENT_NODE      | 9    | HTML 文档本身（<html> 的父）      |
  | DOCUMENT_TYPE_NODE | 10   | <!Doctype html>                   |

### 节点增删改

- 创建新 HTML 元素：

  appendChild() （追加新元素作为父的最后一个子）

  ```html
  <div id="div1">
  <p id="p1">这是一个段落。</p>
  <p id="p2">这是另一个段落。</p>
  </div>
  
  <script>
  var para = document.createElement("p"); //创建了一个新的 <p> 元素
  var node = document.createTextNode("这是新文本。"); //如需向 <p> 元素添加文本，则必须首先创建文本节点
  para.appendChild(node); //向 <p> 元素追加这个文本节点
  
  var element = document.getElementById("div1"); //查找一个已有的元素
  element.appendChild(para); //向这个已有的元素追加新元素
  </script>
  ```

  insertBefore()

  ```html
  <div id="div1">
  <p id="p1">这是一个段落。</p>
  <p id="p2">这是另一个段落。</p>
  </div>
  
  <script>
  var para = document.createElement("p");
  var node = document.createTextNode("这是新文本。");
  para.appendChild(node);
  
  var element = document.getElementById("div1");
  var child = document.getElementById("p1");
  element.insertBefore(para, child);
  </script>
  ```

- 删除已有 HTML 元素：

  ```html
  <div>
    <p id="p1">This is a paragraph.</p>
    <p id="p2">This is another paragraph.</p>
  </div>
  
  <script>
  const elmnt = document.getElementById("p1");
  elmnt.remove();
  </script>
  ```

  对于不支持 remove() 方法的浏览器，您必须找到父节点才能删除一个元素：

  ```html
  <div id="div1">
    <p id="p1">This is a paragraph.</p>
    <p id="p2">This is another paragraph.</p>
  </div>
  
  <script>
  const parent = document.getElementById("div1");
  const child = document.getElementById("p1");
  parent.removeChild(child);
  </script>
  ```

- 替换 HTML 元素：

  ```html
  <div id="div1">
  <p id="p1">这是一个段落。</p>
  <p id="p2">这是另一个段落。</p>
  </div>
  
  <script>
  var para = document.createElement("p");
  var node = document.createTextNode("这是新文本。");
  para.appendChild(node);
  
  var parent = document.getElementById("div1");
  var child = document.getElementById("p1");
  parent.replaceChild(para, child);
  </script>
  ```

## BOM

BOM，Browser Object Model，浏览器对象模型。

### window

- window.open() - 打开新窗口
- window.close() - 关闭当前窗口
- window.moveTo(x, y) -移动当前窗口
- window.resizeTo(width, height) -重新调整当前窗口

### location

window.location 对象，可不带 window 前缀书写。

- window.location.href 返回当前页面的 href (URL)
- window.location.hostname 返回 web 主机的域名
- window.location.pathname 返回当前页面的路径或文件名
- window.location.protocol 返回使用的 web 协议（http: 或 https:）
- window.location.port 返回（当前页面的）互联网主机端口的编号
- window.location.assign("url") 加载新文档

> 补充：
>
> 1、document 表示的是一个文档对象，window 表示的是一个窗口对象，一个窗口下可以有多个文档对象，所以一个窗口下只有一个 window.location.href ，但是可能有多个 document.URL、document.location.href 。
> 2、window.location.href 和 document.location.href 可以被赋值，然后跳转到其它页面，document.URL 只能读不能写。
> 3、document.location.href 和document.location.replace 都可以实现从 A 页面切换到 B 页面，但用document.location.href 切换后，可以退回到原页面，而用 document.location.replace 切换后，不可以通过退回到原页面。

### history

window.history 对象，可不带 window 书写。

- history.back() - 等同于在浏览器点击后退按钮
- history.forward() - 等同于在浏览器中点击前进按钮

### navigator

window.navigator 对象包含有关访问者的信息，可以不带 window 前缀来写。

- navigator.cookieEnabled 如果 cookie 已启用，返回 true，否则返回 false
- navigator.appName 返回浏览器的应用程序名称，"Netscape" 是 IE11、Chrome、Firefox 以及 Safari 的应用程序名称的统称
- navigator.appCodeName 返回浏览器的应用程序代码名称，"Mozilla" 是 Chrome、Firefox、IE、Safari 以及 Opera 的应用程序代码名称
- navigator.product 返回浏览器引擎的产品名称，大多数浏览器都将 “Gecko” 作为产品名称返回
- navigator.appVersion 返回有关浏览器的版本信息
- navigator.userAgent 返回由浏览器发送到服务器的用户代理报头
- navgator.platform 返回浏览器平台（操作系统）
- navigator.language 返回浏览器语言
- navigator.onLine 返回 true，假如浏览器在线
- navigator.javaEnabled() 返回 true，如果 Java 已启用

### 弹出框

- 警告：window.alter(message)
- 确认：window.confirm(message) ，可以不带 window 前缀来编写。如果用户单击“确定”，该框返回 `true`。如果用户单击“取消”，该框返回 `false` 。
- 提示：window.prompt("sometext", "defaultText") ，可以不带 window 前缀来编写。如果您希望用户在进入页面前输入值，通常会使用提示框。当提示框弹出时，用户将不得不输入值后单击“确定”或点击“取消”来继续进行。如果用户单击“确定”，该框返回输入值。如果用户单击“取消”，该框返回 `NULL`。
- 如需在弹出框中显示多行文本，使用 `\n` 换行即可。

### Timing事件

以指定的时间间隔执行代码，这些时间间隔事件称为定时事件。

- window.setTimeout(function, milliseconds)：可以不带 window 前缀来编写。使用 window.clearTimeout() 停止执行（可以不带 window 前缀来写）。

  ```javascript
  myVar = setTimeout(function, milliseconds);
  clearTimeout(myVar);
  ```

- window.setInterval(function, milliseconds)：可以不带 window 前缀来编写。使用 window.clearInterval() 停止执行（可以不带 window 前缀来写）。

  ```javascript
  myVar = setInterval(function, milliseconds);
  clearInterval(myVar);
  ```

setTimeout 和 setInterval 的主要区别：

| 特性           | `setTimeout()`               | `setInterval()`                           |
| -------------- | ---------------------------- | ----------------------------------------- |
| **执行次数**   | 只执行一次                   | 重复执行，直到调用 `clearInterval()` 停止 |
| **停止方法**   | 不需要停止，自动停止一次执行 | 必须使用 `clearInterval()` 手动停止       |
| **使用场景**   | 延迟执行一次代码             | 定期（重复）执行某个任务                  |
| **执行的间隔** | 在指定的延迟后执行一次       | 在指定的时间间隔内不断重复执行            |

setTimeout()：适用于仅需执行一次的任务，比如延时显示某个提示框，或者在某个操作完成后再执行后续操作。

setInterval()：适用于需要周期性执行的任务，比如轮询、更新时钟、定期发送请求等。

### cookie

```javascript
/*创建*/
document.cookie = "username=Bill Gates";
//您还可以添加有效日期（UTC 时间）。默认情况下，在浏览器关闭时会删除 cookie
document.cookie = "username=Bill Gates; expires=Sun, 31 Dec 2017 12:00:00 UTC";
//通过 path 参数，您可以告诉浏览器 cookie 属于什么路径。默认情况下，cookie 属于当前页
document.cookie = "username=Bill Gates; expires=Sun, 31 Dec 2017 12:00:00 UTC; path=/";

/*读取*/
var x = document.cookie;

/*更改*/
document.cookie = "username=Steve Jobs; expires=Sun, 31 Dec 2017 12:00:00 UTC; path=/";
//旧 cookie 被覆盖。

/*删除*/
document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/";
//不必指定 cookie 值，直接把 expires 参数设置为过去的日期即可
```

# 函数

## exec()

正则匹配，匹配结果以数组形式返回，匹配失败返回 null 。

```javascript
/e/.exec("The best things in life are free!");
```

# 操作

## 文本延迟显示

```javascript
setTimeout(myFunction, 3000);

function myFunction() {
  document.getElementById("demo").innerHTML = "I love You !!";
}
```

## 动态时钟

```javascript
setInterval(myFunction, 1000);

function myFunction() {
  let d = new Date();
  document.getElementById("demo").innerHTML=
  d.getHours() + ":" +
  d.getMinutes() + ":" +
  d.getSeconds();
}
```
