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
        <h1>出貨</h1>
        <form method="post" action="/ship">

           <hr>
      <table class="table table-striped">
            <thead>
                <tr>
                    <th>產品類型</th>
                    <th>產品名稱</th>
                    <th>產品型號</th>
                    <th>售價</th>
                    <th>數量</th>
                    <th>操作</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                  <form method="post" action="/ship">

                     <input type="hidden" name="id" readonly value="{{.Database.Id}}">
                   <th>
                    <input type="text" name="type" style="border-width:0;background-color:transparent;width:100px" readonly value="{{.Database.Type}}">
                  </th>
                   <th>
                    <input type="text" name="name" style="border-width:0;background-color:transparent;width:100px" readonly value="{{.Database.Name}}">
                  </th>
                   <th><input type="text" name="model" style="border-width:0;background-color:transparent;width:100px" readonly value="{{.Database.Model}}">
                   </th>
                   <th>
                    <input type="text" name="price" style="border-width:0;background-color:transparent;width:100px" readonly value="{{.Database.Price}}">
                  </th>
                    <input type="hidden" name="sum" value="{{.Database.Stock}}">
                   <th>
                       <input type="text" id="shipnum" name="shipnum" placeholder="Enter Number" style="width: 100px" class="form-control">
                   </th>
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