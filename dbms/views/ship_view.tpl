{{template "header"}}
  <title>出貨@庫存管理系統</title>
</head>

<body>
    <br />
    <br />
    <br />
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
          {{template "navbar" .}}
        </div>
    </div>

    <div class="container">
      <h1>出貨頁面</h1>
      <hr>
      <table class="table table-striped">
            <thead>
                <tr>
                    <th>產品類型</th>
                    <th>產品名稱</th>
                    <th>產品型號</th>
                    <th>售價</th>
                </tr>
            </thead>
            <tbody>
                {{range.News}}
                <tr>
                   <th>{{.Type}}</th>
                   <th>{{.Name}}</th>
                   <th>{{.Model}}</th>
                   <th>{{.Price}}</th>
                   <th>
                       <a href="/ship/modify?tid={{.Id}}">出貨</a>
                   </th>
                   </tr>
                {{end}}
            </tbody>
        </table>
    </div>
</body>
</html>