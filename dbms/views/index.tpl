{{template "header"}}
  <title>首頁@庫存管理系統</title>
</head>

<body>
    <br />
    <br />
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
          {{template "navbar" .}}
        </div>
    </div>

    <table border="0" align="center" style="margin-top: 40px">
    　<tr>
    　<td style="padding-right: 35px"><a href="/order" class="thumbnail">
          <img src="/static/img/kanahei.jpg" width="300px" height="300px">
        </a>
      </td>
    　<td><a href="/ship" class="thumbnail">
          <img src="/static/img/gurashi.jpg" width="300px" height="300px">
        </a>
      </td>
    　</tr>
    　<tr>
    　<td style="padding-right: 35px"><a href="/new" class="thumbnail">
          <img src="/static/img/pika.jpg" width="300px" height="300px">
        </a>
      </td>
    　<td><a href="/stock" class="thumbnail">
          <img src="/static/img/egg.png" width="300px" height="300px">
        </a>
      </td>
    　</tr>
    </table>
</body>
</html>