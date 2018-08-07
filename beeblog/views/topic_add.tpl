{{template "header"}}
  <title>添加文章@我的beego的blog</title>
</head>

<body>
    <br />
    <br />
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
          {{template "navbar" .}}
        </div>
    </div>

    <div class="container">
        <h1>添加文章</h1>
        <form method="post" action="/topic">
          <div class="form-group">
            <label>文章標題:</label>
            <input type="text" name="title" class="form-control">
          </div>

          <div class="form-group">
            <label>文章內容:</label>
            <textarea name="content" cols="30" rows="10" class="form-control"></textarea>
          </div>
          <button type="submit" class="btn btn-default">添加文章</button>
          
        </form>
        
    </div>

</body>
</html>