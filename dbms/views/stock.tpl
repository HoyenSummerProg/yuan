{{template "header"}}
  <title>首頁@庫存管理系統</title>
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
     <h1>庫存量</h1> 
     <hr />
     <form method="Get" action="/stock">
     <div style="margin-top: 10px; width: 170px" class="pull-left">
            <label>產品類型</label>
            <select class="form-control" style="width: 100px" id="browsers" name="browsers">
              <option>----請選擇----</option>
              <option>原料</option>
              <option>半成品</option>
              <option>成品</option>
            </select>
     </div>

     <div class="pull-left" style="width: 170px; margin-top: 35px">
           <button type="submit" class="btn btn-default">搜尋</button>
      </div>
      </form>
    </div>

    <div class="container">
      <hr>
      <table class="table table-striped">
            <thead>
                <tr>
                    <th>產品類型</th>
                    <th>產品名稱</th>
                    <th>產品型號</th>
                    <th>數量</th>
                </tr>
            </thead>
            <tbody>
                {{range.Stocks}}
                <tr>
                   <th>{{.Type}}</th>
                   <th>{{.Name}}</th>
                   <th>{{.Model}}</th>
                   <th>{{.Stock}}</th>
                   </tr>
                {{end}}
            </tbody>
        </table>
    </div>


</body>
</html>