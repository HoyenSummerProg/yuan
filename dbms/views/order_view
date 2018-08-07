{{template "header"}}
  <title>進貨@庫存管理系統</title>
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
      <h1>進貨頁面</h1>
      <hr>
      <table class="table table-striped">
            <thead>
                <tr>
                    <th>編號</th>
                    <th>產品類型</th>
                    <th>產品名稱</th>
                    <th>產品型號</th>
                    <th>單價成本</th>
                </tr>
            </thead>
            <tbody>
                {{range.News}}
                <tr>
                   <th>{{.Id}}</th>
                   <th>{{.Type}}</th>
                   <th>{{.Name}}</th>
                   <th>{{.Model}}</th>
                   <th>{{.Cost}}</th>
                   <th>
                       <a href="/order/modify?tid={{.Id}}">進貨</a>
                   </th>
                   </tr>
                {{end}}
            </tbody>
        </table>
    </div>
    
</body>
</html>