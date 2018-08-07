package controllers

import (
	"dbms/models"
	"github.com/astaxie/beego"
)

type NewController struct {
	beego.Controller
}

func (this *NewController) Get() {
	this.Data["IsLogin"] = checkAccount(this.Ctx)
	this.TplName = "new.tpl"
	this.Data["IsNew"] = true
	news, err := models.GetAllNews(true)
	if err != nil {
		beego.Error(err)
	} else {
		this.Data["News"] = news
	}
}

func (this *NewController) Post() {
	browsers := this.Input().Get("browsers")
	name := this.Input().Get("name")
	model := this.Input().Get("model")
	cost := this.Input().Get("cost")
	price := this.Input().Get("price")

	err := models.NewProduct(browsers, name, model, cost, price)
	if err != nil {
		beego.Error(err)
	}
	this.Redirect("/new", 302)
}
