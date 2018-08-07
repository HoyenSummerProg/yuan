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
      <h1>進貨明細</h1>
      <a href="/order/view" class="btn btn-default">進貨頁面</a>
    </div>

    <div class="container">
      <hr>
      <table class="table table-striped">
            <thead>
                <tr>
                    <th>產品類型</th>
                    <th>產品名稱</th>
                    <th>產品型號</th>
                    <th>製造商</th>
                    <th>單價成本</th>
                    <th>數量</th>
                    <th>進貨時間</th>
                </tr>
            </thead>
            <tbody>
                {{range.Orders}}
                <tr>
                   <th>{{.Type}}</th>
                   <th>{{.Name}}</th>
                   <th>{{.Model}}</th>
                   <th>{{.Manufacturer}}</th>
                   <th>{{.Cost}}</th>
                   <th>{{.CostNum}}</th>
                   <th>{{.CostCreated}}</th>
                   </tr>
                {{end}}
            </tbody>
        </table>
    </div>
     


</body>
</html>