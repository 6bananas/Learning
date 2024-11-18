# 命令集

- git init ：将当前文件夹创建为仓库，注意为空文件夹。
- git add 文件名：将文件添加到暂存区，`git add .` 表示将所有文件添加。
- git commit -m '提交说明'：把 add 的文件提交到仓库。
- git status：查看当前所在分支、查看修改了什么文件。
- git diff 文件名：查看文件具体被修改了什么地方。
- git log：查看 commit 历史记录。
- git reset --hard HEAD^：回退到上一个版本（上一次提交），上上次为 `HEAD^^` ，上 n 次为 `HEAD~n` 。
- git branch 分支名：新建分支。
- git checkout -b 分支名：新建分支并切换到该分支。
- git checkout 分支名：切换分支。
- git branch -d 分支名：删除分支。
- git merge 分支名：将命令中的分支合并到当前分支。
- git clone 仓库链接：克隆仓库。
- git remote add origin 仓库链接：将代码提交到 github 时，首先要在 github 新建仓库（此时为空），然后将其链接复制到此，执行该命令和下一个命令，完成将本地仓库提交到远程仓库的操作。
- git push -u origin 分支名：将代码提交到该分支。

# PR

## 概述

PR 是 Pull Request 的缩写，即“合并请求”或“拉取请求”。它是协作式开发中非常常见的一个概念，主要用于代码审查和合并流程。

PR 的作用：

- 代码审查：团队成员可以通过 PR 对代码变更进行审查，确保代码质量和规范性。
- 版本管理：可以将代码从一个分支合并到另一个分支，同时保留清晰的变更记录。
- 协作开发：PR 提供了一个平台，方便开发者之间讨论代码修改和功能实现。

当你发起一个 PR 后，团队成员或项目维护者会查看你的代码，提出修改建议或直接批准。审查通过后，PR 会被合并到目标分支中，通常由项目维护者完成合并。

## 提交PR

1. clone
2. 新建并切换分支
3. 修改代码
4. add
5. commit
6. git push --set-upstream origin 分支名
7. 来到 github 该项目中你的分支，create 一个 pr 然后提交即可。

## 合并PR

1. clone
2. merge
3. add
4. commit
5. git push -u origin 分支名
6. 删除 pr 的分支

# 常用操作

## 新建仓库后提交项目

1. init
2. add
3. commit
4. git branch -M main 设置主分支
5. git remote add origin 仓库链接
6. git push -u origin main

## 向已有仓库提交项目

如果没有本地仓库，则需要先 clone 下来。

复制要提交的项目进本地仓库，然后：

1. add
2. commit
3. git push -u origin 分支名
