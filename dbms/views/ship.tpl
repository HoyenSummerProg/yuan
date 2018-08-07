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
      <h1>出貨明細</h1>
      <a href="/ship/view" class="btn btn-default">出貨頁面</a>
    </div>

    <div class="container">
      <hr>
      <table class="table table-striped">
            <thead>
                <tr>
                    <th>產品類型</th>
                    <th>產品名稱</th>
                    <th>產品型號</th>
                    <th>售價</th>
                    <th>數量</th>
                    <th>出貨時間</th>
                </tr>
            </thead>
            <tbody>
                {{range.Ships}}
                <tr>
                   <th>{{.Type}}</th>
                   <th>{{.Name}}</th>
                   <th>{{.Model}}</th>
                   <th>{{.Price}}</th>
                   <th>{{.PriceNum}}</th>
                   <th>{{.PriceCreated}}</th>
                   </tr>
                {{end}}
            </tbody>
        </table>
    </div>
     


</body>
</html>