package controllers

import (
	"github.com/astaxie/beego"
)

type MainController struct {
	beego.Controller
}

func (this *MainController) Get() {
	this.Data["IsLogin"] = checkAccount(this.Ctx)
	this.TplName = "index.tpl"
	this.Data["IsHome"] = true
}
