# 简介

turtle 海龟，python 内置库，可视化界面绘图工具。源于一种专门给儿童学习编程的语言 LOGO ，它的特色就是通过编程指挥一个小海龟（turtle）在屏幕上绘图。

使用 turtle 时，先使用 `import turtle` 导入库。

# 画布

指定宽、高和背景颜色创建一个画布：

```python
turtle.screensize(canvwidth, canvheight, bg)

参数：画布的宽(像素)、高(像素)、背景颜色

返回值：
由宽、高组成的元组，如(400, 300)

例子：
turtle.screensize(800, 600, "green")
turtle.screensize() #默认(400, 300, "white")
```

设置画布的宽、高和窗口位置：

```python
turtle.setup(width, height, startx, starty)

参数:
width, height: 输入宽和高为整数时, 表示像素; 为小数时, 表示占据电脑屏幕的比例
(startx, starty): 这一坐标表示矩形窗口左上角顶点的位置, 如果为空，则窗口位于屏幕中心

例子：
turtle.setup(width=0.6, height=0.6)
turtle.setup(width=800, height=800, startx=100, starty=100)
```

# 画笔

## 状态

在画布上，默认有一个以画布中心为坐标原点的坐标轴，坐标原点上有一只面朝 x 轴正方向小乌龟。

这里我们描述小乌龟时使用了两个词语：坐标原点（位置）、面朝 x 轴正方向（方向）。turtle 绘图中，就是使用位置和方向描述小乌龟（画笔）的状态。

## 属性

设置画笔的宽度：

```python
turtle.pensize(size)

例子：
turtle.pensize(1)
```

画笔的颜色默认是黑色。设置画笔颜色：

```python
turtle.pencolor()

没有参数传入，则设置默认颜色
传入参数则可以是字符串如"green"、"red"，也可以是RGB 3元组

例子：
turtle.pencolor('brown')
tup = (0.2, 0.8, 0.55)
turtle.pencolor(tup)
```

设置画笔移动速度：

```python
turtle.speed(speed)

参数：[0,10]的整数, 数字越大越快
```

## 绘图命令

操纵海龟绘图的命令可以划分为 3 种：运动命令、画笔控制命令和全局控制命令。

### 画笔运动命令

| 命令                      | 说明                                                   |
| ------------------------- | ------------------------------------------------------ |
| turtle.forward(distance)  | 向当前画笔方向移动 distance 像素长                     |
| turtle.backward(distance) | 向当前画笔相反方向移动 distance 像素长度               |
| turtle.right(degree)      | 顺时针移动 degree 角度                                 |
| turtle.left(degree)       | 逆时针移动 degree 角度                                 |
| turtle.penup()            | 移动时不绘制图形，提起笔，用于另起一个地方绘制时用     |
| turtle.goto(x,y)          | 将画笔移动到坐标为 (x, y) 的位置，移动过程中不提起笔   |
| turtle.pendown()          | 移动时绘制图形，用于提笔后落笔                         |
| turtle.circle()           | 画圆，半径为正（负），表示圆心在画笔的左边（右边）画圆 |

### 画笔控制命令

| 命令                          | 说明                                       |
| ----------------------------- | ------------------------------------------ |
| turtle.fillcolor(colorstring) | 绘制图形的填充颜色                         |
| turtle.color(color1, color2)  | 同时设置 pencolor=color1, fillcolor=color2 |
| turtle.filling()              | 返回当前是否在填充状态                     |
| turtle.begin_fill()           | 准备开始填充图形                           |
| turtle.end_fill()             | 填充完成                                   |
| turtle.hideturtle()           | 隐藏箭头显示                               |
| turtle.showturtle()           | 不隐藏箭头显示                             |

### 全局控制命令

| 命令                                                      | 说明                                                         |
| --------------------------------------------------------- | ------------------------------------------------------------ |
| turtle.clear()                                            | 清空 turtle 窗口，但是 turtle 的位置和状态不会改变           |
| turtle.reset()                                            | 清空窗口，重置 turtle 状态为起始状态                         |
| turtle.undo()                                             | 撤销上一个 turtle 动作                                       |
| turtle.isvisible()                                        | 返回当前 turtle 是否可见                                     |
| stamp()                                                   | 复制当前图形                                                 |
| turtle.write(s[, font=(font-name, font_size, font_type)]) | 写文本，s 为文本内容，font 是字体的参数，里面分别为字体名称、大小和类型，font 的参数也是可选项 |
| turtle.done()                                             | 画布保持显示状态，直到手动关闭窗口                           |
| turtle.title(name)                                        | 设置窗口标题                                                 |

# 应用

## 画一个M

```python
import turtle
import math

#创建画布
turtle.screensize(800, 800, "pink")
turtle.title("M")
#设置画笔属性
turtle.pensize(3)
turtle.pencolor("cyan")
turtle.speed(2)
#绘画
turtle.hideturtle()
turtle.penup()
turtle.right(135)
turtle.forward(175*math.sqrt(2))
turtle.pendown()
turtle.showturtle()
turtle.right(150)
turtle.forward(300)
turtle.right(120)
turtle.forward(150)
turtle.left(90)
turtle.forward(150)
turtle.right(120)
turtle.forward(300)
turtle.done()
```

## 画一个小猪佩奇

```python
import turtle as t

# 绘制小猪佩奇
# =======================================

t.pensize(4)
t.hideturtle()
t.colormode(255)
t.color((255, 155, 192), "pink")
t.setup(840, 500)
t.speed(10)

# 鼻子
t.pu()
t.goto(-100, 100)
t.pd()
t.seth(-30)
t.begin_fill()
a = 0.4
for i in range(120):
    if 0 <= i < 30 or 60 <= i < 90:
        a = a + 0.08
        t.lt(3)  # 向左转3度
        t.fd(a)  # 向前走a的步长
    else:
        a = a - 0.08
        t.lt(3)
        t.fd(a)
        t.end_fill()

t.pu()
t.seth(90)
t.fd(25)
t.seth(0)
t.fd(10)
t.pd()
t.pencolor(255, 155, 192)
t.seth(10)
t.begin_fill()
t.circle(5)
t.color(160, 82, 45)
t.end_fill()

t.pu()
t.seth(0)
t.fd(20)
t.pd()
t.pencolor(255, 155, 192)
t.seth(10)
t.begin_fill()
t.circle(5)
t.color(160, 82, 45)
t.end_fill()

# 头
t.color((255, 155, 192), "pink")
t.pu()
t.seth(90)
t.fd(41)
t.seth(0)
t.fd(0)
t.pd()
t.begin_fill()
t.seth(180)
t.circle(300, -30)
t.circle(100, -60)
t.circle(80, -100)
t.circle(150, -20)
t.circle(60, -95)
t.seth(161)
t.circle(-300, 15)
t.pu()
t.goto(-100, 100)
t.pd()
t.seth(-30)
a = 0.4
for i in range(60):
    if 0 <= i < 30 or 60 <= i < 90:
        a = a + 0.08
        t.lt(3)  # 向左转3度
        t.fd(a)  # 向前走a的步长
    else:
        a = a - 0.08
        t.lt(3)
        t.fd(a)
        t.end_fill()

# 耳朵
t.color((255, 155, 192), "pink")
t.pu()
t.seth(90)
t.fd(-7)
t.seth(0)
t.fd(70)
t.pd()
t.begin_fill()
t.seth(100)
t.circle(-50, 50)
t.circle(-10, 120)
t.circle(-50, 54)
t.end_fill()

t.pu()
t.seth(90)
t.fd(-12)
t.seth(0)
t.fd(30)
t.pd()
t.begin_fill()
t.seth(100)
t.circle(-50, 50)
t.circle(-10, 120)
t.circle(-50, 56)
t.end_fill()

# 眼睛
t.color((255, 155, 192), "white")
t.pu()
t.seth(90)
t.fd(-20)
t.seth(0)
t.fd(-95)
t.pd()
t.begin_fill()
t.circle(15)
t.end_fill()

t.color("black")
t.pu()
t.seth(90)
t.fd(12)
t.seth(0)
t.fd(-3)
t.pd()
t.begin_fill()
t.circle(3)
t.end_fill()

t.color((255, 155, 192), "white")
t.pu()
t.seth(90)
t.fd(-25)
t.seth(0)
t.fd(40)
t.pd()
t.begin_fill()
t.circle(15)
t.end_fill()

t.color("black")
t.pu()
t.seth(90)
t.fd(12)
t.seth(0)
t.fd(-3)
t.pd()
t.begin_fill()
t.circle(3)
t.end_fill()

# 腮
t.color((255, 155, 192))
t.pu()
t.seth(90)
t.fd(-95)
t.seth(0)
t.fd(65)
t.pd()
t.begin_fill()
t.circle(30)
t.end_fill()

# 嘴
t.color(239, 69, 19)
t.pu()
t.seth(90)
t.fd(15)
t.seth(0)
t.fd(-100)
t.pd()
t.seth(-80)
t.circle(30, 40)
t.circle(40, 80)

# 身体
t.color("red", (255, 99, 71))
t.pu()
t.seth(90)
t.fd(-20)
t.seth(0)
t.fd(-78)
t.pd()
t.begin_fill()
t.seth(-130)
t.circle(100, 10)
t.circle(300, 30)
t.seth(0)
t.fd(230)
t.seth(90)
t.circle(300, 30)
t.circle(100, 3)
t.color((255, 155, 192), (255, 100, 100))
t.seth(-135)
t.circle(-80, 63)
t.circle(-150, 24)
t.end_fill()

# 手
t.color((255, 155, 192))
t.pu()
t.seth(90)
t.fd(-40)
t.seth(0)
t.fd(-27)
t.pd()
t.seth(-160)
t.circle(300, 15)
t.pu()
t.seth(90)
t.fd(15)
t.seth(0)
t.fd(0)
t.pd()
t.seth(-10)
t.circle(-20, 90)

t.pu()
t.seth(90)
t.fd(30)
t.seth(0)
t.fd(237)
t.pd()
t.seth(-20)
t.circle(-300, 15)
t.pu()
t.seth(90)
t.fd(20)
t.seth(0)
t.fd(0)
t.pd()
t.seth(-170)
t.circle(20, 90)

# 脚
t.pensize(10)
t.color((240, 128, 128))
t.pu()
t.seth(90)
t.fd(-75)
t.seth(0)
t.fd(-180)
t.pd()
t.seth(-90)
t.fd(40)
t.seth(-180)
t.color("black")
t.pensize(15)
t.fd(20)

t.pensize(10)
t.color((240, 128, 128))
t.pu()
t.seth(90)
t.fd(40)
t.seth(0)
t.fd(90)
t.pd()
t.seth(-90)
t.fd(40)
t.seth(-180)
t.color("black")
t.pensize(15)
t.fd(20)

# 尾巴
t.pensize(4)
t.color((255, 155, 192))
t.pu()
t.seth(90)
t.fd(70)
t.seth(0)
t.fd(95)
t.pd()
t.seth(0)
t.circle(70, 20)
t.circle(10, 330)
t.circle(70, 30)
t.done()
```

