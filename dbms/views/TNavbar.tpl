{{define "navbar"}}
<a class="navbar-brand" href="/">庫存管理系統</a>
<div>
  <ul class="nav navbar-nav">
     <li {{if .IsOrder}}class="active"{{end}}><a href="/order">進貨管理</a>
     </li>
     <li {{if .IsShip}}class="active"{{end}}><a href="/ship">出貨管理</a></li>
     <li {{if .IsNew}}class="active"{{end}}><a href="/new">新增商品</a></li>
     <li {{if .IsStock}}class="active"{{end}}><a href="/stock">庫存管理</a></li>
  </ul>
</div>

  <div class="pull-right">
  	<ul class="nav navbar-nav">
  		{{if .IsLogin}}
  			<li><a href="/login?exit=true">登出</a></li>
  		{{else}}
  			<li><a href="/login">管理員登入</a></li>
  		{{end}}
  	</ul>
  </div>
{{end}}