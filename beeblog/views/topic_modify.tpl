{{template "header"}}
  <title>修改文章@我的beego的blog</title>
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
        <h1>修改文章</h1>
        <form method="post" action="/topic">
          <input type="hidden" name="tid" value="{{.Tid}}">
          <div class="form-group">
            <label>文章標題:</label>
            <input type="text" name="title" class="form-control" value="{{.Topic.Title}}">
          </div>

          <div class="form-group">
            <label>文章內容:</label>
            <textarea name="content" cols="30" rows="10" class="form-control">{{.Topic.Content}}</textarea>
          </div>
          <button type="submit" class="btn btn-default">修改文章</button>
          
        </form>
        
    </div>

</body>
</html>