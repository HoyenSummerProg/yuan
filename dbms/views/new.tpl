{{template "header"}}
  <title>新增@庫存管理系統</title>
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
      <h1>新增貨物</h1>
      <hr />
      <form method="post" action="/new">
      <div class="pull-left" style="width: 150px; margin-top: 10px">
           <label>產品類型</label>
           <select class="form-control" style="width: 100px" id="browsers" name="browsers">
             <option value="原料">原料</option>
             <option value="半成品">半成品</option>
             <option value="成品">成品</option>
           </select>
         </div>

        <div class="pull-left" style="width: 150px; margin-top: 10px">
             <label>產品名稱</label>
             <input id="name" class="form-control" placeholder="請輸入" name="name" style="width: 100px">
           </div>

        <div class="pull-left" style="width: 150px; margin-top: 10px">
              <label>產品型號</label>
              <input id="model" class="form-control" placeholder="請輸入" name="model" style="width: 100px">
            </div>

        <div class="pull-left" style="width: 150px; margin-top: 10px">
                 <label>成本</label>
                 <input id="cost" class="form-control" placeholder="Enter Number" name="cost" style="width: 100px">
               </div>

        <div class="pull-left" style="width: 150px; margin-top: 10px">
                  <label>售價</label>
                  <input id="price" class="form-control" placeholder="Enter Number" name="price" style="width: 100px">
              </div>

        <div class="pull-left" style="width: 150px; margin-top: 35px">
                  <button type="submit" class="btn btn-default">新增</button>
             </div>
      </form>
    </div>

    <div class="container">
      <hr>
      <table class="table table-striped">
            <thead>
                <tr>
                    <th>編號</th>
                    <th>產品類型</th>
                    <th>產品名稱</th>
                    <th>產品型號</th>
                    <th>單價成本</th>
                    <th>售價</th>
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
                   <th>{{.Price}}</th>
                   </tr>
                {{end}}
            </tbody>
        </table>
    </div>
         

</body>
</html>