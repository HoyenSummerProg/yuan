{{template "header"}}
  <title>{{.Topic.Title}}@我的beego的blog</title>
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
        <h1>{{.Topic.Title}}<a href="/topic/modify?tid={{.Tid}}" class="btn btn-default">修改文章</a></h1>
        {{.Topic.Content}}
    </div>

</body>
</html>