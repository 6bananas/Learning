# 概述

JSON 文件的文件类型是 `.json` 。

JSON 文本的 MIME 类型是 `application/json` 。

一个 JSON 对象中的值可以是另一个 JSON 对象。

# 语法规则

- 数据在键-值对中。键必须是字符串，由双引号包围。值必须是以下数据类型之一：
  - 字符串（必须用双引号包围）
  - 数字
  - 对象（JSON 对象）
  - 数组
  - 布尔
  - null

- 数据由逗号分隔
- 花括号容纳对象
- 方括号容纳数组

# JSON对象

## 访问

1. 点号：

   ```javascript
   myObj =  { "name":"Bill Gates", "age":62, "car":null };
   x = myObj.name;
   ```

2. 方括号：

   ```javascript
   myObj =  { "name":"Bill Gates", "age":62, "car":null };
   x = myObj["name"];
   ```

3. 遍历：遍历的是键

   ```javascript
   myObj =  { "name":"Bill Gates", "age":62, "car":null };
   for (x in myObj) {
      document.getElementById("demo").innerHTML  += myObj[x];
   }
   ```

## 删/改

```javascript
{
  "cars": {
    "car1": "BMW",
    "car2": "Audi",
    "car3": "BYD"
  }
}

//改
myObj.cars.car3 = "Mercedes Benz";
or
myObj.cars["car3"] = "Mercedes Benz";

//删
delete myObj.cars.car1;
```

# JSON数组

在 JSON 中，数组值的类型必须属于字符串、数字、对象、数组、布尔或 null。

存在 `arr.length` 。

## 访问

```javascript
x = myObj.cars[0];
```

## 删/改

同 JSON 对象。

## json数组

```json
[
    {"title": "Movie 1", "year": 2021},
    {"title": "Movie 2", "year": 2022},
    {"title": "Movie 3", "year": 2023},
    {"title": "Movie 4", "year": 2024},
    {"title": "Movie 5", "year": 2025},
    {"title": "Movie 6", "year": 2026},
    {"title": "Movie 7", "year": 2027},
    {"title": "Movie 8", "year": 2028},
    {"title": "Movie 9", "year": 2029},
    {"title": "Movie 10", "year": 2030}
]
```

