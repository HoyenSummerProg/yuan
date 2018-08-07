{{template "header"}}
  <title>文章@我的beego的blog</title>
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
        <h1>文章類表</h1>
        <a href="/topic/add" class="btn btn-default">添加文章</a>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>#</th>
                    <th>文章名稱</th>
                    <th>最後更新</th>
                    <th>瀏覽</th>
                    <th>回復數</th>
                </tr>
            </thead>
            <tbody>
                {{range.Topics}}
                <tr>
                   <th>{{.Id}}</th>
                   <th>{{.Title}}</th>
                   <th>{{.Updated}}</th>
                   <th>{{.Views}}</th>
                   <th>{{.ReplyCount}}</th>
                   <th>
                     <a href="/topic/modify?tid={{.Id}}">修改</a>
                   </th>
                   </tr>
                {{end}}
            </tbody>
        </table>

    </div>

</body>
</html>