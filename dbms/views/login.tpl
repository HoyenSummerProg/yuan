{{template "header"}}
  <title>使用者登入@庫存管理系統</title>
</head>

<body>
    <br />
    <br />
    <br />
    <br />
    <div class="navbar navbar-default navbar-fixed-top">
        <div class="container">
          {{template "navbar" .}}
        </div>
    </div>

    <div class="container" style="width: 500px">
      <form method="POST" action="/login">
        <div class="form-group">
          <label>帳號</label>
          <input id="uname" class="form-control" placeholder="Enter account" name="uname">
        </div>
        <div class="form-group">
          <label>密碼</label>
          <input id="pwd" type="password" class="form-control" placeholder="Password" name="pwd">
        </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" name="autoLogin">記住帳密
          </label>
        </div>
        <button type="submit" class="btn btn-default" onclick="return checkInput();">登入</button>
        <button  class="btn btn-default" onclick="return backToHome();">返回</button>
      </form>

      <script type="text/javascript">
      function checkInput(){
        var uname = document.getElementById("uname");
        if (uname.value.length == 0) {
          alert("請輸入帳號");
          return false
        }
        var pwd = document.getElementById("pwd");
        if (pwd.value.length == 0) {
          alert("請輸入密碼");
          return false
        }
        return true
      }

      function backToHome(){
        window.location.href = "/";
        return false;
      }
    </script>

  </div>
</body>
</html>