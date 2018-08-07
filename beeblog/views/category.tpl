{{template "header"}}
  <title>分類@我的beego的blog</title>
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
        <h1>分類類表</h1>
        <form method="Get" action="/category">
          <div class="form-group">
            <label>分類名稱</label>
            <input id="name" class="form-control"placeholder="輸入分類名稱" name="name">
          </div>
            <input type="hidden" name="op" value="add">
            <button type="submit" class="btn btn-default" onclick="return checkInput();">添加</button>
        </form>

        <script type="text/javascript">
            function checkInput(){
                var name = document.getElementById("name");
                if (name.value.length == 0) {
                    alert("請輸入分類名稱");
                    return false
                }
                return true
            }
        </script>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>名稱</th>
                    <th>文章數</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                {{range.Categories}}
                <tr>
                   <th>{{.Id}}</th>
                   <th>{{.Title}}</th>
                   <th>{{.TopicCount}}</th>
                   <th>
                       <a href="/category?op=del&id={{.Id}}">刪除</a>
                   </th>
                   </tr>
                {{end}}
            </tbody>
        </table>

    </div>

</body>
</html>