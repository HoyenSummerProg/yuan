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
        <h1>進貨</h1>
        <form method="post" action="/order">

           <hr>
      <table class="table table-striped">
            <thead>
                <tr>
                    <th>編號</th>
                    <th>產品類型</th>
                    <th>產品名稱</th>
                    <th>產品型號</th>
                    <th>單價成本</th>
                    <th>製造商</th>
                    <th>數量</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                  <form method="post" action="/order">
                   <th>
                    <input type="text" name="id" style="border-width:0;background-color:transparent;width:100px" readonly value="{{.Database.Id}}">
                  </th>
                   <th>
                    <input type="text" name="type" style="border-width:0;background-color:transparent;width:100px" readonly value="{{.Database.Type}}">
                  </th>
                   <th>
                    <input type="text" name="name" style="border-width:0;background-color:transparent;width:100px" readonly value="{{.Database.Name}}">
                  </th>
                   <th><input type="text" name="model" style="border-width:0;background-color:transparent;width:100px" readonly value="{{.Database.Model}}">
                   </th>
                   <th>
                    <input type="text" name="cost" style="border-width:0;background-color:transparent;width:100px" readonly value="{{.Database.Cost}}">
                  </th>
                   <th>
                     <input type="text" id="manufacturer" name="manufacturer" style="width: 100px" class="form-control">
                   </th>
                   <th>
                       <input type="text" id="ordernum" name="ordernum" placeholder="Enter Number" style="width: 100px" class="form-control">
                   </th>
                     <input type="hidden" name="sum" value="{{.Database.Stock}}">
                   <th>
                       <button type="submit" class="btn btn-default">確認</button>
                   </th>
                  </form>
                   </tr>
            </tbody>
        </table>
      </form>
    </div>

</body>
</html>