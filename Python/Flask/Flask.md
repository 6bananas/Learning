# 简介

Flask 是一个用 Python 编写的轻量级 Web 应用框架。

Flask 基于 WSGI（Web Server Gateway Interface）和 Jinja2 模板引擎，旨在帮助开发者快速、简便地创建 Web 应用。

Flask 被称为"微框架"，因为它使用简单的核心，用扩展增加其他功能。

Flask 是灵活的，提供了基本的框架结构，但没有强制性的项目布局或组件，开发者可以根据自己的需求自定义。

Flask 安装：

```bash
pip install Flask
```

安装完成后，可以通过以下命令验证 Flask 是否安装成功：

```bash
pip show Flask
```

# 虚拟环境

虚拟环境是独立于 Python 全局环境的 Python 解释器环境，使用它的好处如下：

- 保持全局环境的干净
- 为同一个库在不同环境下指定不同的版本
- 方便记录和管理某个项目相关的依赖

在虚拟环境中，pip 版本不会继承全局环境中的版本，也不会继承全局环境中已经安装的包。如果虚拟环境被删除，即删除对应文件夹，则在虚拟环境中执行的所有安装、升级等操作一并被删除，且不会影响全局环境。

## 创建

我们将使用 Python 3 内置的 venv 模块创建虚拟环境，使用下面的命令即可为当前项目创建一个虚拟环境：

```bash
$ python -m venv env  # Windows
```

或：

```bash
$ python3 -m venv env  # Linux 和 macOS
```

上述命令的最后一个参数是虚拟环境名称，你可以自由定义，比如 venv、env、.venv，或是“项目名-venv”，这里使用了 env。

## 激活

创建虚拟环境后，我们可以使用下面的命令来激活虚拟环境（通过执行 /source 目录内的激活脚本实现）：

```bash
$ env\Scripts\activate  # Windows
```

或：

```bash
$ . env/bin/activate  # Linux 或 macOS
```

这时命令提示符前会显示虚拟环境的名称，表示已经激活成功：

```bash
(env) $
```

退出虚拟环境：

```bash
(env) $ deactivate
```

# 第一个应用

创建一个名为 app.py 的文件，并添加以下内容：

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(debug=True)
```

在命令行中运行 Flask 应用：

```python
python app.py
```

打开浏览器，访问 `http://127.0.0.1:5000/` 即可。

代码解析：

- **`from flask import Flask`**： 这行代码从 `flask` 模块中导入了 `Flask` 类。`Flask` 类是 Flask 框架的核心，用于创建 Flask 应用程序实例。
- **`app = Flask(__name__)`**： 这行代码创建了一个 Flask 应用实例。`__name__` 是一个特殊的 Python 变量，它在模块被直接运行时是 `'__main__'`，在被其他模块导入时是模块的名字。传递 `__name__` 给 `Flask` 构造函数允许 Flask 应用找到和加载配置文件。
- **`@app.route('/')`**： 这是一个装饰器，用于告诉 Flask 哪个 URL 应该触发下面的函数。在这个例子中，它指定了根 URL（即网站的主页）。
- **`if__name__ == '__main__'`**：这行代码是一个条件判断，用于检查这个模块是否被直接运行，而不是被其他模块导入。如果是直接运行，下面的代码块将被执行。
- **`app.run(debug=True)`**：这行代码调用 Flask 应用实例的 `run` 方法，启动 Flask 内置的开发服务器。`debug=True` 参数会启动调试模式，这意味着应用会在代码改变时自动重新加载。

# 项目结构

## 简单项目

```
my_flask_app/
│
├── app.py
└── requirements.txt
```

- **`app.py`**：主要的 Flask 应用文件，包含路由和视图函数的定义。
- **`requirements.txt`**：列出项目的依赖库，用于记录 Flask 和其他包的版本信息。

my_flask_app 目录下的 app.py 文件代码：

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(debug=True)
```

## 中型项目

```
my_flask_app/
│
├── app/
│   ├── __init__.py
│   ├── routes.py
│   └── models.py
│
├── config.py
├── requirements.txt
└── run.py
```

- `app/`：包含 Flask 应用的主要代码。
  - **`__init__.py`**：初始化 Flask 应用和配置扩展。
  - **`routes.py`**：定义应用的路由和视图函数。
  - **`models.py`**：定义应用的数据模型。
- **`config.py`**：配置文件，包含应用的配置信息。
- **`requirements.txt`**：列出项目的依赖库。
- **`run.py`**：用于启动 Flask 应用。

app/\__init__.py 示例：

```python
from flask import Flask

def create_app():
    app = Flask(__name__)
    app.config.from_object('config.Config')

    from . import routes
    app.register_blueprint(routes.bp)

    return app
```

app/routes.py 示例：

```python
from flask import Blueprint

bp = Blueprint('main', __name__)

@bp.route('/')
def home():
    return 'Hello, World!'
```

run.py 示例：

```python
from app import create_app

app = create_app()

if __name__ == '__main__':
    app.run(debug=True)
```

## 复杂项目

```
my_flask_app/
│
├── app/
│   ├── __init__.py
│   ├── routes/
│   │   ├── __init__.py
│   │   ├── main.py
│   │   └── auth.py
│   ├── models/
│   │   ├── __init__.py
│   │   └── user.py
│   ├── templates/
│   │   ├── layout.html
│   │   └── home.html
│   └── static/
│       ├── css/
│       └── js/
│
├── config.py
├── requirements.txt
├── migrations/
│   └── ...
└── run.py
```

- `app/routes/`：将不同功能模块的路由分开管理。
  - **`main.py`**：主模块的路由。
  - **`auth.py`**：认证相关的路由。
- `app/models/`：管理数据模型，通常与数据库操作相关。
  - **`user.py`**：用户模型。
- **`app/templates/`**：存放 HTML 模板文件。
- **`app/static/`**：存放静态文件，如 CSS 和 JavaScript。
- **`migrations/`**：数据库迁移文件，通常与 SQLAlchemy 相关。

app/routes/main.py 示例：

```python
from flask import Blueprint, render_template

bp = Blueprint('main', __name__)

@bp.route('/')
def home():
    return render_template('home.html')
```

app/models/user.py 示例：

```python
from app import db

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(150), unique=True, nullable=False)
```

# 路由

Flask 路由是 Web 应用程序中将 URL 映射到 Python 函数的机制。

以下是关于 Flask 路由的详细说明。

1. **定义路由**：使用 `@app.route('/path')` 装饰器定义 URL 和视图函数的映射。
2. **路由参数**：通过动态部分在 URL 中传递参数。
3. **路由规则**：使用类型转换器指定 URL 参数的类型。
4. **请求方法**：指定允许的 HTTP 请求方法。
5. **路由函数返回**：视图函数可以返回不同类型的响应。
6. **静态文件和模板**：管理静态文件和动态渲染 HTML 模板。
7. **路由优先级**：确保路由顺序正确，以避免意外的匹配结果。

## 定义路由

基本路由定义：

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return 'Welcome to the Home Page!'
```

- `@app.route('/')`：装饰器，用于定义路由。`/` 表示根 URL。
- `def home()`：视图函数，当访问根 URL 时，返回 `'Welcome to the Home Page!'` 。

## 路由参数

路由可以包含动态部分，通过在路由中指定参数，可以将 URL 中的部分数据传递给视图函数。

```python
@app.route('/greet/<name>')
def greet(name):
    return f'Hello, {name}!'
```

请求 URL 示例：`http://localhost:5000/greet/peter`

## 路由规则

路由规则支持不同类型的参数和匹配规则。

类型规则：

- **字符串（默认）：** 匹配任意字符串。
- **整数（`<int:name>`）：** 匹配整数值。
- **浮点数（`<float:value>`）：** 匹配浮点数值。
- **路径（`<path:name>`）：** 匹配任意字符，包括斜杠 `/`。

```python
@app.route('/user/<int:user_id>')
def user_profile(user_id):
    return f'User ID: {user_id}'

@app.route('/files/<path:filename>')
def serve_file(filename):
    return f'Serving file: {filename}'
```

## 请求方法

可以通过 methods 参数指定允许的请求方法。

```python
@app.route('/submit', methods=['POST'])
def submit():
    return 'Form submitted!'
```

## 路由转换器

Flask 提供了一些内置的转换器，可以对 URL 中的参数进行特定类型的转换。

常用转换器：

- **`int`：** 匹配整数。
- **`float`：** 匹配浮点数。
- **`path`：** 匹配任意路径，包括斜杠。

```python
@app.route('/items/<int:item_id>/details')
def item_details(item_id):
    return f'Item details for item ID: {item_id}'
```

## 路由函数返回

视图函数可以返回多种类型的响应：

- **字符串**：返回纯文本响应。
- **HTML**：返回 HTML 页面。
- **JSON**：返回 JSON 数据。
- **Response 对象**：自定义响应。

```python
from flask import jsonify, Response

@app.route('/json')
def json_response():
    data = {'key': 'value'}
    return jsonify(data)

@app.route('/custom')
def custom_response():
    response = Response('Custom response with headers', status=200)
    response.headers['X-Custom-Header'] = 'Value'
    return response
```

- `jsonify(data)`：将字典转换为 JSON 响应。
- `Response('Custom response with headers', status=200)`：创建自定义响应对象。"Custom response with headers" 为响应主体的内容，将显示在响应页面中。

## 静态文件和模板

静态文件（如 CSS、JavaScript、图片）可以通过 static 路由访问。模板文件则通过 templates 文件夹组织，用于渲染 HTML 页面。

静态文件访问：

```html
<link rel="stylesheet" href="{{ url_for('static', filename='style.css') }}">
```

模板文件渲染：

```python
from flask import render_template

@app.route('/hello/<name>')
def hello(name):
    return render_template('hello.html', name=name)
```

```html
<!DOCTYPE html>
<html>
<head>
    <title>Hello</title>
</head>
<body>
    <h1>Hello, {{ name }}!</h1>
</body>
</html>
```

## 路由优先级

Flask 按照定义的顺序匹配路由，第一个匹配成功的路由将被处理。确保更具体的路由放在更一般的路由之前。

```python
@app.route('/user/<int:user_id>')
def user_profile(user_id):
    return f'User ID: {user_id}'

@app.route('/user')
def user_list():
    return 'User List'
```

# 视图函数

视图函数是 Flask 应用中的核心部分，它负责处理请求并生成响应。

视图函数与路由紧密结合，通过路由将 URL 映射到具体的视图函数。

以下是对 Flask 视图函数的详细说明。

1. **定义视图函数**：视图函数是处理请求并返回响应的核心功能。
2. **接收请求数据**：使用 `request` 对象获取 URL 参数、表单数据、查询参数等。
3. **返回响应**：可以返回字符串、HTML、JSON 或自定义响应对象。
4. **处理请求和响应**：使用 `request` 对象处理请求，使用 `make_response` 生成自定义响应。
5. **处理错误**：视图函数内处理异常或使用 Flask 的错误处理机制。
6. **视图函数的装饰器**：使用 `@app.before_request`、`@app.after_request` 等装饰器处理请求前后逻辑。
7. **视图函数返回的状态码**：可以指定 HTTP 状态码来表示请求的处理结果。

## 定义视图函数

视图函数是一个普通的 Python 函数，它接收请求并返回响应。视图函数通常与路由配合使用，通过装饰器将 URL 映射到视图函数。

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return 'Hello, World!'
```

## 接收请求数据

视图函数可以接收不同类型的请求数据，包括 URL 参数、表单数据、查询参数等。

获取 URL 参数：

```python
@app.route('/greet/<name>')
def greet(name):
    return f'Hello, {name}!'
```

用户输入的数据可能包含恶意代码，所以不建议直接作为响应返回，需要使用 MarkupSafe 提供的 `escape()` 函数对 `name` 变量进行转义处理，防止触发代码执行漏洞。

```python
from markupsafe import escape

@app.route('/greet/<name>')
def greet(name):
    return f'Hello, {escape(name)}!'
```

获取表单数据：

```python
from flask import request

@app.route('/submit', methods=['POST'])
def submit():
    username = request.form.get('username')
    return f'Form submitted by {username}!'
```

**request.form.get('username')**：获取 POST 请求中表单数据的 username 字段。

获取查询参数：

```python
@app.route('/search')
def search():
    query = request.args.get('query')
    return f'Search results for: {query}'
```

**request.args.get('query')**：获取 GET 请求中的查询参数 query。

## 返回响应

视图函数可以返回多种类型的响应，包括字符串、HTML、JSON、或自定义响应对象。

```python
# 返回字符串
return 'This is a simple message.'
# 返回 HTML 模板
return render_template('hello.html', name=name)
# 返回 JSON 数据
data = {'key': 'value'}
return jsonify(data)
# 返回自定义响应对象
response = Response('Custom response with headers', status=200)
response.headers['X-Custom-Header'] = 'Value'
return response
```

注意 Flask 期望视图函数返回一个有效的 HTTP 响应类型（如字符串、字典、列表、元组、Response 实例等），像这种写法会报错：

```python
@app.route('/')
def hello():
    return 1
```

## 处理请求和响应

视图函数可以访问请求对象，并根据请求数据生成响应。可以使用 request 对象来获取请求的信息，使用 make_response 来创建自定义响应。

使用 request 对象：

```python
from flask import request

@app.route('/info')
def info():
    user_agent = request.headers.get('User-Agent')
    return f'Your user agent is {user_agent}'
```

**request.headers.get('User-Agent')**：获取请求头中的 User-Agent 信息。

使用 make_response：

```python
from flask import make_response

@app.route('/header')
def custom_header():
    response = make_response('Response with custom header')
    response.headers['X-Custom-Header'] = 'Value'
    return response
```

**make_response('Response with custom header')**：创建响应对象并设置自定义头信息。

"Response with custom header" 是响应主体的内容，将显示在响应页面中。

## 处理错误

可以在视图函数中处理异常或错误，或者通过 Flask 提供的错误处理机制来处理应用中的错误。

在视图函数中处理错误：

```python
@app.route('/divide/<int:x>/<int:y>')
def divide(x, y):
    try:
        result = x / y
        return f'Result: {result}'
    except ZeroDivisionError:
        return 'Error: Division by zero', 400
```

全局错误处理：

```python
@app.errorhandler(404)
def not_found(error):
    return 'Page not found', 404
```

## 视图函数的装饰器

一个视图函数也可以绑定多个 URL，这通过附加多个装饰器实现，比如：

```python
@app.route('/')
@app.route('/index')
@app.route('/home')
def hello():
    return 'Hello Flask!'
```

除了 @app.route，Flask 还支持其他装饰器，用于实现更复杂的功能。

示例：

- **`@app.before_request`**：在每个请求处理之前运行的函数。
- **`@app.after_request`**：在每个请求处理之后运行的函数。
- **`@app.teardown_request`**：在请求结束后运行的函数，用于清理工作。

```python
@app.before_request
def before_request():
    print('Before request')

@app.after_request
def after_request(response):
    print('After request')
    return response

@app.teardown_request
def teardown_request(exception):
    print('Teardown request')
```

## 视图函数返回状态码

指定 HTTP 状态码：

```python
@app.route('/status')
def status():
    return 'Everything is OK', 200
```

返回带有状态码的响应对象：

```python
from flask import Response

@app.route('/error')
def error():
    return Response('An error occurred', status=500)
```

## 一个标准的视图函数

```python
from flask import request, jsonify

@app.route('/', methods=['GET', 'POST'])
def index():
   if request.method=='POST':
      data = request.get_json()
      title = data.get('title')
      year = data.get('year')
      return jsonify({"msg": "POST OK"}), 200
   elif request.method=='GET':
      title = request.args.get('title')
      year = request.args.get('year')
      return jsonify({"msg": "GET OK"}), 200
```

# 模板渲染

Flask 使用 Jinja2 模板引擎来处理模板渲染。

关于模板的详细内容见 Django 学习笔记。

# 表单处理

Flask 提供了基本的表单处理功能，但通常结合 Flask-WTF 扩展来简化表单操作和验证。

## 基本表单处理

Flask 提供了直接处理表单数据的方式，使用 request 对象来获取提交的数据。

```python
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def form():
    return render_template('form.html')

@app.route('/submit', methods=['POST'])
def submit():
    name = request.form.get('name')
    email = request.form.get('email')
    return f'Name: {name}, Email: {email}'

if __name__ == '__main__':
    app.run(debug=True)
```

## 使用Flask-WTF扩展

Flask-WTF 是一个封装了 WTForms 的扩展，提供了表单处理和验证的功能，使得表单处理更加简洁和强大。

安装 Flask-WTF：

```bash
pip install flask-wtf
```

配置 Flask-WTF：

```python
# app.py
from flask import Flask, render_template, redirect, url_for
from flask_wtf import FlaskForm
from wtforms import StringField, EmailField, SubmitField
from wtforms.validators import DataRequired, Email

app = Flask(__name__)
app.secret_key = 'your_secret_key'  # Required for form protection

class MyForm(FlaskForm):
    name = StringField('Name', validators=[DataRequired()])
    email = EmailField('Email', validators=[DataRequired(), Email()])
    submit = SubmitField('Submit')

@app.route('/', methods=['GET', 'POST'])
def form():
    form = MyForm()
    if form.validate_on_submit():
        name = form.name.data
        email = form.email.data
        return f'Name: {name}, Email: {email}'
    return render_template('form.html', form=form)

if __name__ == '__main__':
    app.run(debug=True)
```

- `DataRequired()`：确保字段不为空。
- `Email()`：验证字段是否为有效的电子邮件地址。

创建模板以支持 Flask-WTF 表单：

```html
<!DOCTYPE html>
<html>
<head>
    <title>Form Example</title>
</head>
<body>
    <form method="post">
        {{ form.hidden_tag() }}
        <div>
            {{ form.name.label }}<br>
            {{ form.name(size=32) }}
        </div>
        <div>
            {{ form.email.label }}<br>
            {{ form.email(size=32) }}
        </div>
        <div>
            {{ form.submit() }}
        </div>
    </form>
</body>
</html>
```

**`{{ form.hidden_tag() }}`**：生成隐藏字段，用于保护表单免受 CSRF 攻击。

## 表单验证

Flask-WTF 和 WTForms 提供了丰富的表单验证功能。你可以使用内置的验证器或自定义验证器来确保表单数据的有效性。

```python
from wtforms import Form, StringField, EmailField, SubmitField
from wtforms.validators import DataRequired, Email, Length

class MyForm(FlaskForm):
    name = StringField('Name', validators=[
        DataRequired(), Length(min=1, max=50)
    ])
    email = EmailField('Email', validators=[
        DataRequired(), Email()
    ])
    submit = SubmitField('Submit')
```

validators 用于定义表单字段的验证规则。

## 文件上传

上传的文件可以通过 **request.files** 访问。

```python
<!DOCTYPE html>
<html>
<head>
    <title>Upload File</title>
</head>
<body>
    <form action="/upload" method="post" enctype="multipart/form-data">
        <label for="file">File:</label>
        <input type="file" id="file" name="file">
        <br>
        <input type="submit" value="Upload">
    </form>
</body>
</html>
```

```python
from flask import Flask, request, redirect, url_for

app = Flask(__name__)
app.secret_key = 'your_secret_key'

@app.route('/upload', methods=['POST'])
def upload():
    file = request.files.get('file')
    if file:
        filename = file.filename
        file.save(f'uploads/{filename}')
        return f'File uploaded successfully: {filename}'
    return 'No file uploaded'

if __name__ == '__main__':
    app.run(debug=True)
```

## CSRF保护

Flask-WTF 自动为表单提供 CSRF 保护。你需要配置一个密钥来启用 CSRF 保护，并在模板中包含隐藏的 CSRF 令牌。

配置 CSRF 保护：

```python
app.secret_key = 'your_secret_key'
```

在模板中添加 CSRF 令牌：

```python
<form method="post">
    {{ form.hidden_tag() }}
    <!-- Form fields here -->
</form>
```

# 数据库操作

## 使用Flask-SQLAlchemy

SQLAlchemy 是一个强大的 ORM（对象关系映射）库，可以简化数据库操作，通过 Python 对象与数据库表进行交互。

借助 SQLAlchemy，你可以通过定义 Python 类来表示数据库里的一张表（类属性表示表中的字段/列），通过对这个类进行各种操作来代替写 SQL 语句。这个类我们称之为模型类，类中的属性我们将称之为字段。

Flask-SQLAlchemy 是 Flask 的一个扩展，用于集成 SQLAlchemy。

安装：

```bash
pip install flask-sqlalchemy
```

### 配置SQLAlchemy

```python
# app.py
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = ' mysql://username:password@localhost/dbname'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)
```

**`SQLALCHEMY_TRACK_MODIFICATIONS`** 主要用于监控并跟踪 SQLAlchemy 模型对象的变动，以便发出信号。

设置为 False 的作用：

- 性能优化：当 `SQLALCHEMY_TRACK_MODIFICATIONS` 设置为 `True` 时，SQLAlchemy 会额外占用一些内存去跟踪对象的修改。这在较大或频繁操作的项目中会导致一定的性能开销。因此，一般将其设置为 `False` 来禁用跟踪，以提升应用性能。
- 消除警告：如果未显式设置此项，Flask-SQLAlchemy 会在应用启动时发出警告，建议将其关闭以减少资源占用。

### 定义模型

模型是数据库表的 Python 类，每个模型类代表数据库中的一张表。

```python
class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)

    def __repr__(self):
        return f'<User {self.username}>'
```

**db.Model**：所有模型类需要继承自 db.Model。

**db.Column**：定义模型的字段，指定字段的类型、是否为主键、是否唯一、是否可以为空等属性。

**`unique`**：

- 作用：当设置为 `True` 时，表示该字段的值在数据库中必须是唯一的。即，同一列中的所有值不能重复。
- 应用场景：适用于需要唯一标识的字段，例如用户名、电子邮件地址等。确保在插入数据时不会出现重复值。
- 数据库约束：当插入或更新数据时，如果试图插入重复值，会抛出数据库错误。

**`nullable`**：

- 作用：当设置为 `True` 时，表示该字段可以接受 `NULL` 值（即不需要提供值）。如果设置为 `False`，则表示该字段不能为空，必须提供一个有效值。
- 应用场景：适用于某些情况下可以省略的字段。例如，某些用户资料可以不提供，但用户名通常需要提供。
- 数据库约束：如果试图插入或更新为 `NULL` 值时，若该字段设置为 `nullable=False`，会抛出数据库错误。

**`__repr__`**：一个特殊的方法，用于定义对象的“官方”字符串表示。它主要用于调试和开发，帮助开发者更好地理解和查看对象的状态。示例：

```python
user = User(username='carl', email='carl@example.com')
print(user)
# 输出
<User carl>
```

### 创建数据表

在定义了模型后，你可以使用 SQLAlchemy 提供的方法来创建数据库和表。

```python
with app.app_context():
    db.create_all()
```

**db.create_all()**：创建所有在当前上下文中定义的模型对应的表。

### 基本的CRUD操作

#### 创建记录

```python
@app.route('/add_user')
def add_user():
    new_user = User(username='john_doe', email='john@example.com')
    db.session.add(new_user)
    db.session.commit()
    return 'User added!'
```

**db.session.add(new_user)**：将新用户对象添加到会话中。

**db.session.commit()**：提交事务，将更改保存到数据库。

#### 读取记录

```python
@app.route('/get_users')
def get_users():
    users = User.query.all()  # 获取所有用户
    return '<br>'.join([f'{user.username} ({user.email})' for user in users])
```

**User.query.all()**：查询所有用户记录。

#### 更新记录

```python
@app.route('/update_user/<int:user_id>')
def update_user(user_id):
    user = User.query.get(user_id)
    if user:
        user.username = 'new_username'
        db.session.commit()
        return 'User updated!'
    return 'User not found!'
```

**User.query.get(user_id)**：通过主键查询单个用户记录。

更新字段值并提交事务。

#### 删除记录

```python
@app.route('/delete_user/<int:user_id>')
def delete_user(user_id):
    user = User.query.get(user_id)
    if user:
        db.session.delete(user)
        db.session.commit()
        return 'User deleted!'
    return 'User not found!'
```

**db.session.delete(user)**：删除用户记录，并提交事务。

### 查询操作

SQLAlchemy 提供了丰富的查询功能，可以通过查询对象来执行各种查询操作。

#### 基本查询

```python
users = User.query.filter_by(username='john_doe').all()
```

**filter_by()**：根据字段值过滤记录。

#### 复杂查询

```python
from sqlalchemy import or_

users = User.query.filter(or_(User.username == 'john_doe', User.email == 'john@example.com')).all()
```

**or_()**：用于执行复杂的查询条件。

> 更多查询操作见后面的“使用 SQLAlchemy 核心模块”的”条件筛选“介绍。

#### 排序和分页

```python
users = User.query.order_by(User.username).paginate(page=1, per_page=10)
```

**order_by()**：按指定字段排序。

**paginate()**：分页查询。

### 原生SQL

```python
@app.route('/raw_sql')
def raw_sql():
    result = db.session.execute('SELECT * FROM user')
    return '<br>'.join([str(row) for row in result])
```

**db.session.execute()**：执行原始 SQL 查询。

## 使用PyMySQL

如果不需要 ORM，可以直接使用 PyMySQL 进行操作，适合轻量级的 SQL 查询。

安装：

```bash
pip install pymysql
```

操作示例：

```python
import pymysql.cursors

connection = pymysql.connect(
    host='localhost',
    user='username',
    password='password',
    database='dbname',
    cursorclass=pymysql.cursors.DictCursor
)

try:
    with connection.cursor() as cursor:
        # 插入数据
        sql = "INSERT INTO `users` (`username`, `email`) VALUES (%s, %s)"
        cursor.execute(sql, ('carl', 'carl@example.com'))
    connection.commit()

    with connection.cursor() as cursor:
        # 查询数据
        sql = "SELECT `id`, `username`, `email` FROM `users` WHERE `username`=%s"
        cursor.execute(sql, ('carl',))
        result = cursor.fetchone()
        print(result)

finally:
    connection.close()
```

## 使用SQLAlchemy核心模块

SQLAlchemy 不仅提供 ORM，还支持核心模式（Core Mode），直接使用 SQL 语句构建和执行查询。

使用 SQLAlchemy 核心模式同样基于 Flask-SQLAlchemy 扩展。

### 初始化配置

创建 dataserver 数据库。

在 config.py 中创建初始化类：

```python
class DBConfig(object):
    HOSTNAME = '127.0.0.1'
    PORT = 3306
    USERNAME = 'root'
    PASSWORD = 'root'
    DATABASE = 'dataserver'
    SQLALCHEMY_DATABASE_URI = f'mysql+pymysql://{USERNAME}:{PASSWORD}@{HOSTNAME}:{PORT}/{DATABASE}?charset=utf8'
```

在 \__init__.py 中导入 DBConfig ：

```python
from flask import Flask
from config import DBConfig

app = Flask(__name__)

#添加配置文件
app.config.from_object(DBConfig)

# 将导入放在文件末尾以避免循环导入
from app import routes  
from app import database
```

### 连接数据库

```python
from sqlalchemy import create_engine
from config import DBConfig
    
engine = create_engine(DBConfig.SQLALCHEMY_DATABASE_URI)
```

### 映射说明

在使用 ORM 时主要有两个配置过程：一是数据库表的信息描述处理，二是将类映射到这些表上。它们在 SQLAlchemy 中一起完成，被称为 Declarative。

使用 Declarative 参与的 ORM 映射的类需要被定义为一个指定基类的子类，这个基类含有 ORM 映射中相关类和表的信息。这样的基类称为 declarative base class。这个基类可以通过 declarative_base 来创建。

```python
from sqlalchemy.orm import declarative_base

Base = declarative_base()
```

数据库与 Python 对象的映射主要在体现三个方面：

- 数据库表 (table）映射为 Python 的类 (class)，称为 model
- 表的字段 (field) 映射为 Column
- 表的记录 (record）以类的实例 (instance) 来表示

 在 sqlalchemy 中表字段的常见类型如下：

```
Interger：整型，映射到数据库中是int类型
Float：浮点类型，float
Double：双精度类型
String：字符串类型，需要指定字符串的长度
Boolean：布尔类型
Decimal：定点类型，专门为解决浮点类型精度丢失的问题而设定。Decimal需要传入两个参数，第一个参数标记该字段能存储多少位数，第二个参数表示小数点后有又多少个小数位
Enum：枚举类型
Date：日期类型，年月日
DateTime：时间类型，年月日时分毫秒
Time：时间类型，时分秒
Text：长字符串，可存储6万多个字符，text
LongText：长文本类型，longtext
```

在指定表字段的映射为 Column 时，不但要指定表字段的数据类型，往往还需要指定字段属性：

```
primary_key    #是否为主键
unique         #是否唯一
index          #如果为True，为该列创建索引，提高查询效率
nullable       #是否允许为空
default        #默认值
name           #在数据表中的字段映射
autoincrement  #是否自动增长
onupdate       #更新时执行的函数
comment        #字段描述
```

### 创建类

```python
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import declarative_base
from sqlalchemy import create_engine
from config import DBConfig
    
engine = create_engine(DBConfig.SQLALCHEMY_DATABASE_URI)
Base = declarative_base()

class Watchlist(Base):
    __tablename__ = 'watchlist'
    id = Column(Integer, primary_key=True, autoincrement=True, comment='ID')
    title = Column(String(100), default=None, nullable=False, comment='标题')
    year = Column(Integer, default=None, nullable=False, comment='年份')
```

### 创建会话

在一个会话中操作数据库，会话建立在连接上，连接被引擎管理。当第一次使用数据库时，从引擎维护的连接池中获取一个连接使用。

SQLAlchemy 的 Session 是用于管理数据库操作的一个像容器一样的工厂对象。Session 工厂对象中提供 `query(), add(), add_all(), commit(), delete(), flush(), rollback(), close()` 等方法。

```python
from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import sessionmaker, declarative_base
from sqlalchemy import create_engine
from config import DBConfig
    
engine = create_engine(DBConfig.SQLALCHEMY_DATABASE_URI)
Base = declarative_base()
sessionFactory = sessionmaker(bind=engine)
Session = sessionFactory()

class Watchlist(Base):
    __tablename__ = 'watchlist'
    id = Column(Integer, primary_key=True, autoincrement=True, comment='ID')
    title = Column(String(100), default=None, nullable=False, comment='标题')
    year = Column(Integer, default=None, nullable=False, comment='年份')
```

### 增加

```python
#增加一个
w = Watchlist(title='AAA', year=1999)
Session.add(w)
Session.commit()

#增加一些
w1 = Watchlist(title='BBB', year=2000)
w2 = Watchlist(title='CCC', year=2001)
w3 = Watchlist(title='DDD', year=2002)
Session.add_all([w1, w2, w3]) #传入列表
Session.commit()
```

### 查询

query() 返回类对象。

```python
#查询全部，返回一个列表
dataList = Session.query(Watchlist).all()
#查询第一个
firstData = Session.query(Watchlist).first()
```

### 条件筛选

Query 对象提供了 filter() 方法和 filter_by() 方法用于数据筛选，filter_by() 适用于简单的关键字参数筛选，filter() 适用于复杂的条件表达式。

```python
Session.query(Student).filter(Student.id<=3).all()
Session.query(Student).filter(Student.name=='张三').first()
Session.query(Student).filter_by(name='张三').first()
```

如果有两个限制条件是 AND 关系，可以直接使用两次 filter() 处理。

```python
Session.query(Student).filter(Student.name=='张三').filter(Student.gender=='男').first()
#或
Session.query(Student).filter_by(name='张三').filter(Student.gender=='男').first()
```

常见的条件筛选：

```python
Session.query(Student).filter(Student.id <= 3).all()
Session.query(Student).filter(Student.id != 2).all()
#通配符查询，如like('%关键字%')
Session.query(Student).filter(Student.id.like('%9')).all()
#在
from sqlalchemy import in_
Session.query(Student).filter(Student.EDUCATION.in_(['Bachelor', 'Master'])).all()
#不在
Session.query(Student).filter(~Student.EDUCATION.in_(['Bachelor', 'Master'])).all()
#==None为空
Session.query(Student).filter(Student.MARITAL_STAT==None).all()
#不为空
Session.query(Student).filter(Student.MARITAL_STAT!=None).all()
#and
Session.query(Student).filter(Student.GENDER=='Female', Student.EDUCATION=='Bachelor').all()
#这个也是and
from sqlalchemy import and_
Session.query(Student).filter(and_(Student.GENDER=='Female', Student.EDUCATION=='Bachelor')).all()
#or
from sqlalchemy import or_
Session.query(Student).filter(or_(Student.MARITAL_STAT=='Single', Student.NR_OF_CHILDREN==0)).all()
```

更多筛选方法：

![](D:\File\My\Python\Flask\img\1.jpg)

![](D:\File\My\Python\Flask\img\2.jpg)

### 更新

```python
#第一步，查询出要修改的数据
w = Session.query(Watchlist).filter(Watchlist.id==1).first()
#第二步，修改
w.title = 'CCC'
#第三步，重新添加
Session.add(w)
#第四步，提交
Session.commit()
```

或

```python
Session.query(Watchlist).filter(Watchlist.id==1).update({'title':'CCC'})
Session.commit()
```

注意没有 `Session.query(Watchlist).filter(Watchlist.id==1).first().update({'title':'CCC'})` 这种用法。因为 `first()` 方法返回的是查询结果的第一个对象，而不是一个可更新的查询对象。原因：

1. `first()` 方法会执行查询并返回结果集中的第一个对象（如果存在），或者返回  `None` 。这意味着你在这个情况下得到了一个 `Watchlist` 对象，而不是一个查询对象。

2. `update()` 方法是用于查询对象（如 `Query` 对象）的方法，而不是用于单个对象的方法。单个对象通常会使用属性赋值来更新，即上述的第一种方法。

### 删除

```python
#查询
w = Session.query(Watchlist).filter(Watchlist.id==2).first()
#删除
Session.delete(w)
#提交
Session.commit()
```

或

```python
#查询并删除
w = Session.query(Watchlist).filter(Watchlist.id==1).delete()
print(w) #输出的是删除的行数
#提交
Session.commit()
```

### 原生SQL

从 SQLAlchemy 中导出 text 方法，可以通过 `text(SQL语句) ` 执行原生 sql 。

**方法一：使用 Session 执行原生的 SQL 语句。**

```python
from sqlalchemy import text

sql = 'select * from watchlist'
rows = Session.execute(text(sql)).fetchall()
result = [dict(row._mapping) for row in rows]
print(result)
#输出：[{"id":3,"title":"AAA","year":1999}]

#插入
sql = 'insert into watchlist (title, year) values (:name, :year)'
params = {
    'name': 'BBB',
    'year': 2001
}
Session.execute(text(sql), params)
Session.commit()
```

 **方法二：通过 Engine 对象执行原生的 SQL 语句。**

```python
from sqlalchemy import text

sql = 'select * from watchlist'
with engine.connect() as conn:
    w = conn.execute(text(sql))
    rows = w.fetchall()
    result = [dict(row._mapping) for row in rows]
```

### 批量插入数据

**方法一：**每插入一条数据进行一次 commit() 。性能极度拉跨，提交操作非常耗时，因为每次提交都会引起数据库事务的开启和关闭。

```python
import time
from app.__init__ import app, db

with app.app_context():
    firstTime = time.time()
    for i in range(10000):
        w = Watchlist(title='AAA', year=i)
        db.session.add(w)
        db.session.commit()
    secondTime = time.time()
    
def test():
    return str(secondTime-firstTime)

#8.015835285186768
```

**方法二：**数据插入完后一起 commit() 提交。创建所有对象后，使用 `bulk_save_objects()` 方法批量保存对象，然后统一提交。但是消耗会更多的内存，因为所有对象都先创建在内存中。

```python
import time
from app.__init__ import app, db

with app.app_context():
    firstTime = time.time()
    db.session.bulk_save_objects(
        [Watchlist(title='AAA', year=i) for i in range(10000)]
    )
    db.session.commit()
    secondTime = time.time()
    
def test():
    return str(secondTime-firstTime)

#0.1895279884338379
```

**方法三：**使用 `bulk_insert_mappings`() 方法批量插入。创建字典列表，然后使用 `bulk_insert_mappings()` 方法进行批量插入。比逐条插入和 `bulk_save_objects`() 更快，因为它直接操作数据库，不需要创建 SQLAlchemy 对象。**没有缺点，适用于大批量插入。**

```python
import time
from app.__init__ import app, db

with app.app_context():
    firstTime = time.time()
    db.session.bulk_insert_mappings(
        Watchlist,
        [dict(title='AAA', year=i) for i in range(10000)]
    )
    db.session.commit()
    secondTime = time.time()
    
def test():
    return str(secondTime-firstTime)

#0.12148857116699219
```

**方法四：**使用原生 SQL 的 insert 方法批量插入。使用 SQLAlchemy 的 `execute` 方法执行原生 SQL 插入操作。这是**最快的方法**，因为它直接生成并执行 SQL 插入语句，最大限度地减少了 Python 层面的开销。

```py
import time
from app.__init__ import app, db

with app.app_context():
    firstTime = time.time()
    db.session.execute(
        Watchlist.__table__.insert(),
        [{'title': 'AAA', 'year': i} for i in range(10000)]
    )
    db.session.commit()
    secondTime = time.time()
    
def test():
    return str(secondTime-firstTime)

#0.07176971435546875
```

### 连接池

连接池（Connection Pool）是一种用于管理数据库连接的设计模式，目的是为了提高数据库操作的性能和效率。它通过维护一组数据库连接，减少了每次数据库操作时创建和销毁连接的开销。

连接池是提高数据库访问效率的重要手段。通过预先创建连接并进行复用，可以显著减少连接创建的开销和资源消耗，适用于高并发和对性能要求较高的应用场景。

#### 工作原理

1. **初始化连接池**：在应用启动时，连接池会预先创建一定数量的数据库连接，并将其放入池中。
2. **获取连接**：当应用需要进行数据库操作时，它从连接池中获取一个可用的连接，而不是每次都创建新连接。
3. **使用连接**：应用执行数据库操作后，使用完的连接不会被关闭，而是返回到连接池中，以便其他请求复用。
4. **释放连接**：连接在被使用后会被释放回连接池，而不是被销毁。连接池可以根据配置自动管理连接的生命周期。

#### 优点

- **性能提升**：重用已有的连接，减少了连接的创建和销毁开销，显著提高了数据库操作的性能。
- **资源管理**：通过限制连接的数量，可以有效控制数据库资源的使用，避免过多连接导致数据库负载过重。
- **连接复用**：提高了数据库连接的利用率，减少了连接等待时间。

#### 配置

```python
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from config import DatabaseConfig

# 创建数据库引擎，配置连接池
engine = create_engine(
    DatabaseConfig.SQLALCHEMY_DATABASE_URI,
    # 连接池中最多10个连接
    pool_size=10,
    # 连接池满后最多额外创建20个连接
    max_overflow=20,
    # 等待连接的超时时间为30秒
    pool_timeout=30,
    # 连接在池中超过多少秒后会被回收，设置为-1表示禁用连接回收
    pool_recycle=-1
)

# 创建会话
Session = sessionmaker(bind=engine)
session = Session()

# 使用示例
def query_users():
    with Session() as session:
        # 查询所有用户
        users = session.query(User).all()
        print("All users:")
        for user in users:
            print(user)
            
# 或
def query_users():
    session = Session()
    try:
        # 执行查询
        users = session.query(User).all()
    finally:
        session.close()  # 确保会话在使用后关闭
```

## 数据库优化

1. 避免 N+1 查询：

   ```python
   # 不好的示例  
   for user in session.query(User).all():  
       print(user.name)  
       print(user.email)  
     
   # 好的示例  
   users = session.query(User).all()  
   for user in users:  
       print(user.name)  
       print(user.email)
   ```

2. 使用原生 SQL：在需要高性能的部分使用原生 SQL ，如大批量的查询。而在常规的数据操作和开发过程中使用 SQLAlchemy 。

## 三种方法对比

### Flask-SQLAlchemy

#### 特点

- 提供对 SQLAlchemy 的高层封装，便于直接在 Flask 中使用。
- 内置了Flask 的上下文管理，自动处理请求生命周期中的数据库会话。
- 提供 ORM 功能，便于对象与关系数据库之间的映射，代码结构更具可读性和可维护性。

#### 使用场景

- **推荐场景**：适用于大部分需要数据库操作的 Flask 项目，尤其是项目规模较大、需要频繁的增删改查操作时。ORM 便于模型定义和对象操作，对开发效率和代码可读性提升较大。
- **优势**：结合 Flask 的生命周期管理数据库会话，自动回收资源，降低会话管理的复杂性。
- **缺点**：对数据库的细粒度控制不如 SQLAlchemy 核心模式（如自定义事务控制），也稍微增加了一些开销。

### PyMySQL

#### 特点

- 直接连接 MySQL 数据库，不使用 ORM，需要手动编写 SQL 语句。
- 不依赖 Flask 的上下文管理，代码相对简单，适合对数据库访问需求较少的场景。

#### 使用场景

- **推荐场景**：适合轻量级的小项目，或仅需少量数据库操作的应用，也适合快速原型开发。
- **优势**：对于简单的查询操作，代码简洁，直接执行 SQL 语句，不涉及对象映射。
- **缺点**：不具备 ORM 的抽象性，对复杂数据结构不够友好，可读性较低，容易造成 SQL 注入风险，需要手动管理数据库连接。

### SQLAlchemy Core

#### 特点

- SQLAlchemy 的原生使用方式，可通过 `declarative_base` 构建 ORM 模型类，也可以直接使用 SQL 语句执行查询。
- 支持手动管理会话（Session）生命周期，可以自定义事务和细粒度控制。
- 不依赖 Flask 的上下文，因此适合在 Flask 之外的独立脚本或异步任务中使用。

#### 使用场景

- **推荐场景**：适合大型项目或复杂数据库操作的需求，尤其是对会话控制、事务管理有较高要求的应用。也适合在 Flask 以外的其他 Python 应用中使用。
- **优势**：相比 Flask-SQLAlchemy 更灵活，直接支持原生 SQLAlchemy 的功能（如手动控制事务），适合多线程和异步环境。
- **缺点**：在 Flask 应用中使用时需要手动管理会话生命周期，可能增加复杂度。

### 总结

- **Flask-SQLAlchemy**：适合大部分 Flask 项目，推荐优先选择。简单、集成性强，特别适合开发速度要求高的项目。
- **PyMySQL**：适合简单需求或快速原型项目，适用范围较窄，缺少 ORM 抽象。
- **SQLAlchemy Core**：适合需要更多灵活性、复杂性控制的项目，对 Flask 依赖较低，适合大型项目或需要在非 Flask 环境中使用的数据库操作。

# 蓝图

Flask 的蓝图（Blueprints）是一种组织代码的机制，允许你将 Flask 应用分解成多个模块。这样可以更好地组织应用逻辑，使得应用更具可维护性和可扩展性。

每个蓝图可以有自己的路由、视图函数、模板和静态文件，这样可以将相关的功能分组。

通过使用蓝图，你可以将 Flask 应用拆分成多个模块，每个模块处理相关的功能，使得代码更加清晰和易于管理。

## 创建蓝图

创建蓝图涉及到以下几个步骤：

**定义蓝图：**在一个独立的模块中定义蓝图。

**注册蓝图：**在主应用中注册蓝图，使其生效。

假设我们要创建一个博客应用，其中包含用户管理和博客功能，我们可以将这些功能分成两个蓝图：auth 和 blog。

项目结构：

```
yourapp/
│
├── app.py
├── auth/
│   ├── __init__.py
│   └── routes.py
│
└── blog/
    ├── __init__.py
    └── routes.py
```

## 定义蓝图

auth/routes.py 文件代码：

```python
from flask import Blueprint, render_template, request, redirect, url_for

auth = Blueprint('auth', __name__)

@auth.route('/login')
def login():
    return render_template('login.html')

@auth.route('/logout')
def logout():
    return redirect(url_for('auth.login'))

@auth.route('/register')
def register():
    return render_template('register.html')
```

**Blueprint('auth', __name__)**：创建一个名为 auth 的蓝图。

蓝图中定义的路由函数可以用来处理请求。

## 注册蓝图

app.py 文件代码：

```python
from flask import Flask

app = Flask(__name__)

# 导入蓝图
from auth.routes import auth
from blog.routes import blog

# 注册蓝图
app.register_blueprint(auth, url_prefix='/auth')
app.register_blueprint(blog, url_prefix='/blog')

if __name__ == '__main__':
    app.run(debug=True)
```

`app.register_blueprint(auth, url_prefix='/auth')`：注册 `auth` 蓝图，并将所有的路由前缀设置为 `/auth`。

## 模板和静态文件

蓝图中的模板和静态文件应放在蓝图的文件夹下的 templates 和 static 子文件夹中。

项目结构：

```
yourapp/
│
├── app.py
├── auth/
│   ├── __init__.py
│   ├── routes.py
│   └── templates/
│       ├── login.html
│       └── register.html
│
└── blog/
    ├── __init__.py
    ├── routes.py
    └── templates/
        ├── index.html
        └── post.html
```

## 请求钩子

蓝图支持请求钩子，例如 **before_request** 和 **after_request**，可以在蓝图中定义这些钩子来处理请求和响应。

auth/routes.py 文件代码：

```python
@auth.before_app_request
def before_request():
    # 执行在每个请求之前的操作

@auth.after_app_request
def after_request(response):
    # 执行在每个请求之后的操作
    return response
```

## 错误处理

蓝图也可以定义自己的错误处理函数。

blog/routes.py 文件代码：

```python
@blog.errorhandler(404)
def page_not_found(error):
    return 'Page not found', 404
```

# 错误处理

## 处理HTTP错误

Flask 允许你定义针对特定 HTTP 状态码的错误处理函数。这些处理函数可以用于捕获并处理应用中的常见错误，如 404 页面未找到错误、500 服务器内部错误等。

app.py 文件代码：

```python
from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def index():
    return 'Welcome to the homepage!'

@app.errorhandler(404)
def page_not_found(error):
    return render_template('404.html'), 404

@app.errorhandler(500)
def internal_server_error(error):
    return render_template('500.html'), 500

if __name__ == '__main__':
    app.run(debug=True)
```

**@app.errorhandler(404)**：捕获 404 错误，并返回自定义的 404 错误页面。

## 蓝图中的错误处理

蓝图（Blueprints）也可以定义自己的错误处理函数。这使得每个模块可以有自己的错误处理逻辑。

auth/routes.py 文件代码：

```python
from flask import Blueprint, render_template

auth = Blueprint('auth', __name__)

@auth.errorhandler(404)
def auth_not_found(error):
    return render_template('auth_404.html'), 404
```

## 自定义错误

在 Flask 中，自定义异常可以帮助你更好地管理应用程序中的错误处理。通过创建自定义异常类，你可以定义特定的错误类型，并在出现错误时返回适当的响应。

**步骤：**

1. 定义自定义异常类：你可以通过继承 Python 的内置异常类（如 `Exception`）来定义自定义异常。
2. 注册错误处理器：使用 Flask 的 `@app.errorhandler` 装饰器来注册自定义异常的处理函数。
3. 引发自定义异常：在你的视图函数中，根据需要引发自定义异常。

**示例：**

```python
from flask import Flask, jsonify

app = Flask(__name__)

# 1. 定义自定义异常类
class CustomError(Exception):
    def __init__(self, message, status_code=400):
        self.message = message
        self.status_code = status_code
        super().__init__(self.message)

# 2. 注册错误处理器
@app.errorhandler(CustomError)
def handle_custom_error(error):
    response = jsonify({'error': error.message})
    response.status_code = error.status_code
    return response

# 3. 使用自定义异常
@app.route('/divide/<int:a>/<int:b>')
def divide(a, b):
    if b == 0:
        raise CustomError("Division by zero is not allowed.", status_code=400)
    result = a / b
    return jsonify({'result': result})

if __name__ == '__main__':
    app.run(debug=True)
```

## 全局错误处理

如果你希望在整个应用中处理所有未处理的异常，可以使用全局错误处理函数。这些处理函数可以捕获所有**未被显式捕获**的错误。

app.py 文件代码：

```python
@app.errorhandler(Exception)
def handle_exception(error):
    # 处理所有异常
    return f'An error occurred: {error}', 500
```

## 使用abort函数

Flask 提供了一个 abort 函数，用于在视图函数中主动触发 HTTP 错误。这可以用于在特定条件下返回错误响应。

```python
from flask import abort

@app.route('/abort_example')
def abort_example():
    abort(403)  # 返回 403 Forbidden 错误
```

**abort(403)**：触发 403 错误，自动调用对应的错误处理函数。

## 渲染自定义错误界面

可以为每个错误码创建自定义的 HTML 页面。

# 中间件

Flask 的中间件（middleware）是对请求和响应进行处理的钩子，通常用于在请求到达视图函数之前或在响应发送到客户端之前执行一些操作。中间件可以用于日志记录、请求修改、响应修改等。

## 请求钩子

请求钩子允许你在处理请求的不同阶段插入代码，Flask 提供了几种钩子来处理请求生命周期的不同阶段：

- **`before_request`**：在每个请求处理之前执行。
- **`after_request`**：在每个请求处理之后执行。
- **`teardown_request`**：请求处理结束后，无论是否发生异常都会执行。
- **`before_first_request`**：仅在应用第一次处理请求之前执行。

## 自定义中间件

Flask 还允许你创建自定义中间件类，这些中间件类可以在请求和响应处理的各个阶段进行操作。

middleware.py 文件代码：

```python
class CustomMiddleware:
    def __init__(self, app):
        self.app = app

    def __call__(self, environ, start_response):
        def custom_start_response(status, headers):
            headers.append(('X-Custom-Header', 'Value'))
            return start_response(status, headers)

        return self.app(environ, custom_start_response)
```

app.py 文件代码：

```python
from flask import Flask
from middleware import CustomMiddleware

app = Flask(__name__)

app.wsgi_app = CustomMiddleware(app.wsgi_app)

@app.route('/')
def index():
    return 'Hello, World!'

if __name__ == '__main__':
    app.run(debug=True)
```

