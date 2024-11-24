> 了解一下就行，没必要详细深入系统地学习，需要的时候再补充也行。

# 说在前面

本文档 Vue2 和 Vue3 混搭，注意区分。

一些规则：

1. Vue2/3 通用：在函数名称和括号之间需要加一个空格；
2. Vue2/3 通用：代码行与行缩进是 2 个空格；
3. Vue2/3 通用：注释符号 `//` 后面需要加一个空格；
4. Vue2/3 通用：删除文件末尾的多余空行，确保代码文件在最后只有一个空白行；
5. Vue3 使用 `<script setup></script>` ，Vue2 使用 `<script></script>` ；
6. 在 Vue3 的 `<script setup>` 中，不能直接使用 `export default` 。`<script setup>` 是一种简化的方式，自动处理 `export default` ，你只需编写逻辑代码即可。

# 简介

Vue ，读音 /vjuː/ ，全称 Vue.js ，是一种用于构建用户界面的渐进式 JavaScript 框架，专注于通过简洁直观的语法和强大的功能，帮助开发者创建现代化的网页应用程序。

Vue3 是 Vue 框架的第三个版本，发布于 2020 年，它在性能、开发体验和框架架构方面做了许多改进。

如果项目需要兼容老旧浏览器（如 IE 11），或当前团队对 Vue2 更熟悉，短期内可以继续使用。

对于新项目或希望利用最新技术的团队，推荐使用 Vue3 ，它的性能和可维护性更高。

Vue（Vue2）的主要特点：

1. **渐进式框架**：可以从简单的页面部分增强，逐步扩展为复杂的单页面应用（SPA）。

   > **SPA** ，Single Page Application 的缩写，意思是「单页应用程序」。
   >
   > SPA 是一种网页应用程序，它的核心特点是页面整体不会重新加载，所有的内容更新通过 JavaScript 动态加载并渲染。用户在页面之间切换时，实际上只是更新了页面的一部分，而无需重新请求整个页面。
   >
   > 优点：更流畅的用户体验、更快的页面切换速度。
   
2. **响应式数据绑定**：基于模板的语法，使用双向数据绑定简化 DOM 操作。

3. **组件化开发**：通过组件（Component）来构建独立、可复用的 UI 模块。

   > **UI** ，User Interface 的缩写，意思是「用户界面」。
   
4. **生态系统完善**：配合 Vue Router（路由） 和 Vuex（状态管理） 等工具，构建完整的前端应用。

# 快速开始

```bash
# Vue2
npm install -g @vue/cli-init
vue init webpack my-project # 按照指导输入或一路yes
cd my-project
npm install
npm run dev

# Vue3
npm install -g @vue/cli
vue create my-project # 按照指导输入或一路yes
cd my-project
npm install
npm run dev
```

Vue2 项目目录解析：

| 目录/文件    | 说明                                                         |
| :----------- | :----------------------------------------------------------- |
| build        | 项目构建（webpack）相关代码。                                |
| config       | 配置目录，包括端口号等。                                     |
| node_modules | npm 加载的项目依赖模块。                                     |
| src          | 这里是我们要开发的目录，基本上要做的事情都在这个目录里。assets：放置一些图片，如 logo 等。components：组件文件，可以不用。App.vue：项目入口文件，我们也可以直接将组件写这里，而不使用 components 目录。main.js：项目的核心文件。 |
| static       | 静态资源目录，如图片、字体等。                               |
| public       | 公共资源目录。                                               |
| test         | 初始测试目录，可删除                                         |
| .xxxx文件    | 这些是一些配置文件，包括语法配置，git 配置等。               |
| index.html   | 首页入口文件，你可以添加一些 meta 信息或统计代码啥的。       |
| package.json | 项目配置文件。                                               |
| README.md    | 项目的说明文档。                                             |
| dist         | 使用 `npm run build` 命令打包后会生成该目录。                |

# 声明式渲染

每一个 .vue 文件是一个 Vue 单文件组件 (Single-File Component，缩写为 SFC)，它将从属于同一个组件的  HTML 、CSS 和 JavaScript 封装在使用 .vue 后缀的文件中。

Vue 的核心功能是**声明式渲染**，即根据 JavaScript 的状态来描述 HTML 应该是什么样子的。当状态改变时，HTML 会自动更新。

能在改变时触发更新的状态被认为是**响应式**的。在 Vue 中，响应式状态被保存在组件中。

我们可以使用 data 组件选项来声明响应式状态，该选项应该是一个返回对象的函数：

```js
export default {
  data () {
    return {
      message: 'Hello World!'
    }
  }
}
```

message 属性可以在模板中使用。

下面展示了我们如何使用双花括号法，根据 message 的值来渲染动态文本：

```vue
<h1>{{ message }}</h1>
```

在双花括号中的内容并不只限于标识符或路径——我们可以使用任何有效的 JavaScript 表达式。

```vue
<h1>{{ message.split('').reverse().join('') }}</h1>
```

# 属性绑定

在 Vue 中，双花括号只能用于文本插值。为了给属性绑定一个动态值，需要使用 `v-bind` 指令：

```html
<div v-bind:id="dynamicId"></div>
<!--简写-->
<div :id="dynamicId"></div>
```

**指令**是由 `v-` 开头的一种特殊属性，它们是 Vue 模板语法的一部分。和文本插值类似，指令的值也可以是访问组件状态的 JavaScript 表达式。

冒号后面的部分（ `id` ）是指令的“参数”。此处表明，div 元素的 id 属性将与组件状态里的 dynamicId 属性保持同步。

给一个实例：

```vue
<script>
export default {
  data () {
    return {
      titleClass: 'title'
    }
  }
}
</script>

<template>
  <h1 :class="titleClass">Make me red</h1>
</template>

<style>
.title {
  color: red;
}
</style>
```

# 事件监听

我们可以使用 `v-on` 指令监听 DOM 事件：

```vue
<button v-on:click="increment">{{ count }}</button>
<!--简写-->
<button @click="increment">{{ count }}</button>
```

此处，increment 引用了一个使用 methods 选项声明的函数：

```js
export default {
  data () {
    return {
      count: 0
    }
  },
  methods: {
    increment () {
      // 更新组件状态
      this.count++
    }
  }
}
```

在方法中，我们可以使用 `this` 来访问组件实例。组件实例会暴露 `data` 中声明的数据属性。我们可以通过改变这些属性的值来更新组件状态。

# 表单绑定

我们可以同时使用 `v-bind` 和 `v-on` 来在表单的输入元素上创建双向绑定：

```vue
<input :value="text" @input="onInput">
```

```javascript
export default {
  data () {
    return {
      text: ''
    }
  },
  methods: {
    onInput (e) {
      this.text = e.target.value
    }
  }
}
```

为了简化双向绑定，Vue 提供了一个 `v-model` 指令，它实际上是上述操作的语法糖：

```vue
<input v-model="text">
```

`v-model` 会将被绑定的值与 `<input>` 的值自动同步，这样我们就不必再使用事件处理函数了。

```js
export default {
  data () {
    return {
      text: ''
    }
  }
}
```

`v-model` 不仅支持文本输入框，也支持诸如多选框、单选框、下拉框之类的输入类型。

# 条件渲染

我们可以使用 `v-if` 指令来有条件地渲染元素：

```vue
<h1 v-if="awesome">Vue is awesome!</h1>
```

`<h1>` 标签只会在 `awesome` 的值为 true/1 时渲染。若 `awesome` 更改为 false/0 ，它将被从 DOM 中移除。

我们也可以使用 `v-else` 和 `v-else-if` 来表示其他的条件分支：

```vue
<h1 v-if="awesome">Vue is awesome!</h1>
<h1 v-else>Oh no 😢</h1>
```

# 列表渲染

我们可以使用 `v-for` 指令来渲染一个基于源数组的列表：

```vue
<ul>
  <li v-for="todo in todos" :key="todo.id">
    {{ todo.text }}
  </li>
</ul>
```

这里的 `todo` 是一个局部变量，表示当前正在迭代的数组元素。它只能在 `v-for` 所绑定的 HTML 元素上或是其内部访问，就像函数的作用域一样。

更新列表有两种方式：

1. 在源数组上调用变更方法：

   ```js
   this.todos.push(newTodo)
   ```

2. 使用新的数组替代原数组：

   ```js
   this.todos = this.todos.filter(...)
   ```

[官方实例](https://cn.vuejs.org/tutorial/#step-7)

# 计算属性

[官方教程](https://cn.vuejs.org/tutorial/#step-8)

官方教程对计算属性的含义讲得不是很清楚，可以到[菜鸟教程](https://www.runoob.com/vue2/vue-computed.html)看看，并了解一下 computed 和 methods 的区别。

注意，官方教程基于 Vue3 ，菜鸟教程还是 Vue2 。

# 生命周期和模板引用

Vue 通过响应性和声明式渲染为我们处理了所有的 DOM 更新，但有时我们需要手动操作 DOM ，这时我们需要使用**模板引用**，也就是指向模板中一个 DOM 元素的 ref：

```vue
<p ref="pElementRef">hello</p>
```

要访问该引用，我们需要声明一个同名的 ref：

```js
const pElementRef = ref(null)
```

注意这个 ref 使用 `null` 值来初始化。这是因为当 `<script setup>` 执行时，DOM 元素还不存在。模板引用 ref 只能在组件**挂载**后访问。

这被称为**生命周期钩子**，它允许我们注册一个在组件的特定生命周期调用的回调函数。

要在挂载之后执行代码，我们可以使用 `onMounted()` 函数：

```js
import { onMounted } from 'vue'

onMounted(() => {
  // 此时组件已经挂载。
})
```

完整代码：

```vue
<script setup>
import { ref, onMounted } from 'vue'

const pElementRef = ref(null)

onMounted(() => {
  pElementRef.value.textContent = 'mounted!'
    //此时hello将变为mounted!
})
</script>

<template>
  <p ref="pElementRef">Hello</p>
</template>
```

Vue2 使用 `this.$refs` 修改 DOM 内容，p 元素将作为 `this.$refs.pElementRef` 暴露在 `this.$refs` 上。使用 `mounted` 选项，在组件挂载后访问：

```vue
<script>
export default {
  mounted () {
    this.$refs.pElementRef.textContent = 'mounted!'
  }
}
</script>

<template>
  <p ref="pElementRef">Hello</p>
</template>
```

# 侦听器

[官方教程](https://cn.vuejs.org/tutorial/#step-10)

# 嵌套组件

ChildComp.vue：

```vue
<template>
  <h2>A Child Component!</h2>
</template>
```

父组件可以在模板中渲染另一个组件作为子组件。要使用子组件，我们需要先导入它：

```js
import ChildComp from './ChildComp.vue'
```

我们还需要使用 `components` 选项注册组件：

```js
import ChildComp from './ChildComp.vue'

export default {
  components: {
    ChildComp
  }
}
```

然后我们就可以在模板中使用组件，就像这样：

```vue
<ChildComp />
```

嵌套后的完整 App.vue：

```vue
<script>
import ChildComp from './ChildComp.vue'

export default {
  components: {
    ChildComp
  }
}
</script>

<template>
  <ChildComp />
</template>
```

# Props

在上一节中，App.vue 是父组件，ChildComp.vue 是子组件。

子组件可以通过 props 从父组件接受动态数据。首先，需要声明它所接受的 props：

```js
// 在子组件中
export default {
  props: {
    msg: String
  }
}
```

一旦声明，`msg` prop 就会暴露在 `this` 上，并可以在子组件的模板中使用。

父组件可以使用 `v-bind` 语法传递 props：

```vue
<ChildComp :msg="greeting" />
```

[官方实例](https://cn.vuejs.org/tutorial/#step-12)（Vue3）

# Emits

除了接收 props ，子组件还可以向父组件触发事件。

[官方教程](https://cn.vuejs.org/tutorial/#step-13)

# 插槽

除了通过 props 传递数据外，父组件还可以通过插槽（slots）将模板片段传递给子组件：

```vue
<ChildComp>
  This is some slot content!
</ChildComp>
```

在子组件中，可以使用 `<slot>` 元素作为插槽出口（slot outlet）渲染父组件中的插槽内容（slot content）：

```vue
<!-- 在子组件的模板中 -->
<slot></slot>
```

`<slot>` 插口中的内容将被当作“默认”内容，它会在父组件没有传递任何插槽内容时显示：

```vue
<slot>Fallback content</slot>
```

[官方实例](https://cn.vuejs.org/tutorial/#step-14)（Vue3）

# OVER！

作为一名后端开发者，Vue 学到这里就差不多了。

结合讲解和实例，现在，你应该大致明白什么是 Vue ，使用 Vue 开发应用是怎样的感觉，以及 Vue 大致有哪些内容了。虽然我们飞快地介绍了许多东西，但也因此忽略了大量的细节。

[在线实验](https://play.vuejs.org/#eNp9kVFLwzAQx7/KeS9TmBuiT6MOVAbqg4oKvuSltLeuM01CcpmF0u/utaXVhzEISe7/vyS/yzV459ziEAlXmITMl47XylDtrGfIaZtGzdAoA5CnnJ5fDHsATxy9GSOAKhQrmD2S1ha+rNf52Wyw2m6RSUaynB6QgKlyOmWSCCDZXa2bprsF2jZZStSrpXGR4XBZ2Zz0rULxFYqVLKfTOEcOmTXbsljsgzVSRw+lMLOVKzX5V8elNUHhasRVmArnz3OvsY80H/VsR9n3EX0f6k5T+OYpkD+Qwsnj1BfEg735eKFa9pMp5FFL9gnznYLVsWMc0u6jyQX7X15P+1R1PSlN8Rk2NZMJY1EdaP/Jfb5CaebDidL/cK8XN2NzsP0F+HSp8w==)，这样你不需要在本地 Vue 环境中测试代码。

[深入指南](https://cn.vuejs.org/guide/essentials/application.html)，详细探讨之前学过的话题。