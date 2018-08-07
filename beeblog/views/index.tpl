{{template "header"}}
  <title>首頁@我的beego的blog</title>
</head>

<body>
    <br />
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
          {{template "navbar" .}}
        </div>
    </div>

    <div class="container">
        {{range .Topics}}
        <div class="page-header">
            <h1>{{.Title}}</h1>
            <h6 class="text-muted">文章發表於{{.Created}}, 共有{{.Views}}次瀏覽, {{.ReplyCount}}個評論</h6>
            <p>
              {{.Content}}
            </p>
        </div>
        {{end}}
      
    </div>

</body>
</html>