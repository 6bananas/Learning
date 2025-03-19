# Linux

## cat

```bash
cat filename
```

查看文件内容。

## chmod

全称 change mode ，是控制用户对文件的权限的命令。

Linux/Unix 的文件调用权限分为三级 : 文件所有者（Owner）、用户组（Group）、其它用户（Other Users）。

![](img/1.jpg)

只有文件所有者和超级用户可以修改文件或目录的权限。

可以使用绝对模式（八进制数字模式）或符号模式指定文件的权限。

绝对模式和符号模式的对应关系：

![](img/2.png)

命令格式：

```bash
chmod [-R] mode file...
```

mode：权限设定字串，格式如下 :

```bash
[ugoa][[+-=][rwxX]]
```

- u 表示该文件的拥有者，g 表示与该文件的拥有者属于同一个群体（group）者，o 表示其他以外的人，a 表示这三者皆是。
- \+ 表示增加权限、- 表示取消权限、= 表示唯一设定权限。
- r 表示可读取，w 表示可写入，x 表示可执行，X 表示只有当文件为目录文件，或者其他类型的用户有可执行权限时，才将文件权限设置可执行。

- -R 表示对目前目录下的所有文件与子目录进行相同的权限变更，即以递归的方式逐个变更。

八进制数字模式：

| #    | 权限           | rwx  | 二进制 |
| :--- | :------------- | :--- | :----- |
| 7    | 读 + 写 + 执行 | rwx  | 111    |
| 6    | 读 + 写        | rw-  | 110    |
| 5    | 读 + 执行      | r-x  | 101    |
| 4    | 只读           | r--  | 100    |
| 3    | 写 + 执行      | -wx  | 011    |
| 2    | 只写           | -w-  | 010    |
| 1    | 只执行         | --x  | 001    |
| 0    | 无             | ---  | 000    |

一些例子：

```bash
# 多mode多file
chmod ug+w,o-w file1.txt file2.txt
# 通配符
chmod -R a+r *
```

## cp

用于复制文件或目录。

```bash
cp [参数] source dest
```

- -f：覆盖已经存在的目标文件而不给出提示。
- -i：与 **-f** 选项相反，在覆盖目标文件之前给出提示，要求用户确认是否覆盖，回答 **y** 时目标文件将被覆盖。
- -p：除复制文件的内容外，还把修改时间和访问权限也复制到新文件中。
- -r：若给出的源文件是一个目录文件，此时将复制该目录下所有的子目录和文件。

## curl

### 查看网页源码

```bash
curl www.baidu.com
#查看并保存源码
curl -o a.html www.baidu.com
curl -O https://www.example.com/foo/bar.html #将URL的最后部分当作文件名
```

### 查看响应头

```bash
curl -i www.baidu.com
curl -I www.baidu.com #此时只显示头部
```

### 发送表单信息

```bash
#GET
curl example.com/form.cgi?data=xxx
#POST
curl -X POST --data "data=xxx" example.com/form.cgi
curl -d 'login=emma＆password=123' -X POST https://google.com/login
curl -d 'login=emma' -d 'password=123' -X POST  https://google.com/login
```

curl 默认使用 GET 方式，如需改变，使用 `-X method` 即可

### Referer

```bash
curl --referer http://www.referer.com http://www.example.com
curl -e 'http://www.referer.com' https://www.example.com
curl -H 'Referer: http://www.referer.com' https://www.example.com
```

### Cookie

```bash
#发送Cookie
curl --cookie "name=xxx" www.example.com
curl -b 'foo=bar' https://google.com
curl -b 'foo1=bar;foo2=bar2' https://google.com
curl -b cookies.txt https://www.google.com
#将Cookie写入文件
curl -c cookies.txt https://www.google.com
```

### 改变UA头

```bash
curl --user-agent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' https://google.com
curl -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.100 Safari/537.36' https://google.com
curl -A '' https://google.com #移除UA头
```

### 增加请求头字段

```bash
curl --header "Content-Type:application/json" http://example.com
curl -H 'Accept-Language: en-US' https://google.com
curl -H 'Accept-Language: en-US' -H 'Secret-Message: xyzzy' https://google.com
```

## grep

在文件中搜索模式并输出。

```bash
grep [参数] 模式 文件名
```

- grep xxx 文件名：在文件中搜索 xxx 并输出。
- grep -v xxx 文件名：输出文件中所有不含 xxx 的内容。
- grep -n xxx 文件名：在文件中搜索 xxx 并输出，及其所在第几行。
- grep -c xxx 文件名：输出含 xxx 的有几行。
- grep [ab] 文件名：输出含 a、b 的内容。

## head

查看文件开头部分的内容，默认开头 10 行。

```bash
head [-c x] [-n x] file
```

- -n x：指定显示几行。
- -c x：指定显示开头几个字节的字符。

## less

打开并浏览文件，按 q 关闭文件。

```bash
less [参数] file
```

- -e：当文件显示结束后，滚动鼠标即可离开。
- -N：显示行号。
- -s：显示连续空行为一行。

## ls

```shell
ls [参数] [目录名]
#如果省略目录名，则默认为 -da
```

- -a：显示所有文件及目录（**.** 开头的隐藏文件也会列出）。Linux 常采用隐藏文件来保存配置信息，隐藏文件通常是文件名以点号开始的文件，它们不会在默认的 ls 命令输出中显示出来。
- -d：只列出目录（不递归列出目录内的文件）。
- -l：以长格式显示文件和目录信息，包括权限、所有者、大小、创建时间等。
- -r：倒序显示文件和目录。
- -t：将按照修改时间排序，最新的文件在最前面。
- -F：区分文件和目录，目录会在后面加 / ，可执行文件会在后面加 * 。
- -R：递归输出。

## mkdir

创建目录。

```bash
# 创建目录
mkdir 目录名/
# 创建目录树，可延拓
mkdir -p 目录名1/目录名2/
```

## more

类似 cat ，不过会以一页一页的形式显示。按空格键往下一页显示，按 b 往回（back）一页显示。

```bash
more [-s] [-num] [+/pattern] [+linenum] file
```

- -s：当遇到有连续两行以上的空白行，就代换为一行的空白行。
- -num：一次显示的行数。
- +/pattern：正则匹配，从匹配到的第一个字符串开始显示。
- +linenum：从第几行开始显示。

## mv

用来为文件或目录改名、或将文件或目录移入其它位置。

```bash
mv [参数] source dest
```

- -b：当目标文件或目录存在时，在执行覆盖前，会为其创建一个备份。
- -i：如果指定移动的源目录或文件与目标的目录或文件同名，则会先询问是否覆盖旧文件。输入 y 表示直接覆盖，输入 n 表示取消该操作。
- -f：如果指定移动的源目录或文件与目标的目录或文件同名，不会询问，直接覆盖旧文件。
- -n：不要覆盖任何已存在的文件或目录。
- -u：当源文件比目标文件新或者目标文件不存在时，才执行移动操作。

实例：

将 aaa 移到 bbb 。如果 bbb 目录不存在，则该命令将 aaa 改名为 bbb：

```bash
mv aaa bbb
```

## nc

nc ，netcat 的简称，是一个用于网络通信的实用工具，它可以在不同主机之间建立连接、传输数据或监听端口。

```bash
nc [-hlnruz] [-g <网关...>] [-G <指向器数目>] [-i <延迟秒数>] [-o <输出文件>] [-p <通信端口>] [-s <来源位址>] [-v] [-w <超时秒数>] [主机名称] [通信端口]
```

- -g <网关> 设置路由器跃程通信网关，最多可设置 8 个。
- -G <指向器数目> 设置来源路由指向器，其数值为 4 的倍数。
- -h 在线帮助。
- -i <延迟秒数> 设置时间间隔，以便传送信息及扫描通信端口。
- -l 表示 nc 将作为侦听器监听传入的连接请求。
- -n 直接使用 IP 地址，而不通过域名服务器。
- -o <输出文件> 指定文件名称，把往来传输的数据以 16 进制字码倾倒成该文件保存。
- -p \<port> 指定 nc 监听的端口号。
- -r 乱数指定本地与远端主机的通信端口。
- -s <来源位址> 设置本地主机送出数据包的 IP 地址。
- -u 使用 UDP 传输协议。
- -v 表示 nc 在执行操作时显示详细的调试信息，使您能够查看连接和数据传输的细节。
- -w <超时秒数> 设置等待连线的时间。
- -z 使用 0 输入/输出模式，只在扫描通信端口时使用。

常见用法：

- `nc -lvp <port>` ：创建一个网络侦听器，监听指定的端口以接收传入的连接请求和数据。

## nl

同 cat ，但会加上行号。

## pwd

查看当前目录的绝对路径。

## rev

反序查看文件内容。

```bash
#flag{this_1s_f1@9}
rev flag.txt
#输出：}9@1f_s1_siht{galf
```

## rm

删除文件或目录。

```bash
# 删除文件
rm 文件名
# 递归删除目录，同时询问
rm -ri(或-Ri) 目录名/
# 一口气删除目录的终极大法，既没有警告信息，也没有声音提示，务必谨慎使用
rm -rf 目录名/
```

-i 参数：询问 yes/no 删除。

## rmdir

删除目录。

```bash
rmdir 目录名/
```

只能删空目录。

该命令没有 -i 选项。

## sleep

```bash
sleep number[smhd]
#s 秒，m 分钟，h 小时，d 日
```

## sort

将文件内容排序并输出，以行为单位。

```bash
sort [-bdfiur] file
```

- -b：忽略每行前面的空格字符。
- -d：排序时，仅处理英文字母、数字及空格字符，忽略其他字符。
- -f：排序时，将小写字母视为大写字母。
- -i：排序时，仅处理 [40-176] 之间的 ASCII 字符，忽略其他字符。
- -u：去重。
- -r：倒序排序。

## tac

同 cat ，但是倒序显示。

## tail

查看文件结尾部分的内容，默认结尾 10 行。

```bash
tail [-c x] [-n x] file
```

- -n x：指定显示几行。
- -c x：指定显示结尾几个字节的字符。

## tee

从标准输入设备读取数据，将其内容输出到标准输出设备。如果指定了文件的话，输出同时将其写入文件并保存。

Ctrl+C 退出。

```bash
tee [-ai] [--help] [--version] [file1] [file2]……
```

- -a 或 --append：附加到既有文件的后面，而非覆盖它。
- -i 或--ignore-interrupts：忽略中断信号。
- --help：输出帮助信息。
- --version：输出版本信息。
- file：指定写入文件，文件不存在会自动新建。

## touch

创建文件。

```bash
touch 文件名
```

## uniq

检查并删除文件在重复出现的行，然后输出最终结果。

```bash
uniq [-cd] file
```

- -c 或 --count：在每行旁边显示该行重复出现的次数。
- -d 或 --repeated：仅显示重复出现的行。

## wc

```bash
wc 文件名
```

输出三个值：文件的行数、词数、字节数。

## wget

wget 是一个用于从 Web 服务器上下载文件的常用命令行工具。它支持 HTTP、HTTPS 和 FTP 协议，并且提供了多种功能和选项，可以满足不同的下载需求。

### 下载文件

```bash
wget [URL]
```

从指定的 URL 下载文件，并保存到当前工作目录中。

### 指定保存文件名

```bash
wget -O [文件名] [URL]
```

### 递归下载

下载指定 URL 页面上的所有链接文件，包括子目录中的文件。这对于下载整个网站非常有用。

```bash
wget -r [URL]
```

### 后台下载

将 wget 放在后台执行，即使关闭终端窗口，下载仍将继续进行。

```bash
wget -b [URL]
```

## ifconfig

查看 IP 地址。

## uname -r

查看内核版本。

## >、>>

```bash
command > filename
command >> filename
```

`>` 符号用于重定向命令的输出并将其写入到指定的文件中。如果文件不存在，则会创建该文件。如果文件已经存在，将会被清空并写入新的输出内容。 

`>>` 符号也用于重定向命令的输出，但是与 `>` 不同的是，它会将输出追加到指定的文件末尾，而不会清空文件内容。

> Windows 下也适用。

# Windows

> 可使用通配符 * 和  ? 。

## cls

清屏。

## copy

```bash
copy <source> <destination>
copy <source1>+<source2> <destination>
```

## del

删除文件。

## dir

显示该目录下的所有文件和目录的最后修改时间。

## md

新建目录。

## netstat -ano

查看端口使用情况。

本地地址和外部地址，说人话就是，服务端 `IP:端口` 和 客户端 `IP:端口` 。

如果只有服务端开着，没有客户端连接，则状态是 `LISTENING` 。如果客户端和服务端建立了一条连接，则状态是 `ESTABLISHED` 。

## rd

删除目录。

## ren

重命名。

```bash
ren <oldname> <newname>
```

可使用绝对路径，但不能指定新的驱动器或路径，也不能使用此命令跨驱动器重命名文件，或将文件移动到不同的目录。

## type

查看文件内容。
