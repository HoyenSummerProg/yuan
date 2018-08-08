package controllers

import (
	"dbms/models"
	"github.com/astaxie/beego"
)

type ShipController struct {
	beego.Controller
}

func (this *ShipController) Get() {
	this.Data["IsLogin"] = checkAccount(this.Ctx)
	this.TplName = "ship.tpl"
	this.Data["IsShip"] = true

	ships, err := models.GetAllShips(true)
	if err != nil {
		beego.Error(err)
	} else {
		this.Data["Ships"] = ships
	}
}

func (this *ShipController) View() {
	this.Data["IsLogin"] = checkAccount(this.Ctx)
	this.TplName = "ship_view.tpl"

	news, err := models.GetAllNews(true)
	if err != nil {
		beego.Error(err)
	} else {
		this.Data["News"] = news
	}
}

func (this *ShipController) Post() {

	tid := this.Input().Get("id")
	browsers := this.Input().Get("type")
	name := this.Input().Get("name")
	model := this.Input().Get("model")
	price := this.Input().Get("price")
	shipnum := this.Input().Get("shipnum")
	sum := this.Input().Get("sum")

	err := models.ShipProduct(browsers, name, model, price, shipnum)
	if err != nil {
		beego.Error(err)
	}
	serr := models.GetMinusSum(tid, shipnum, sum)
	if serr != nil {
		beego.Error(serr)
	}

	this.Redirect("/ship", 302)
}

func (this *ShipController) Modify() {
	this.Data["IsLogin"] = checkAccount(this.Ctx)
	this.TplName = "ship_modify.tpl"

	tid := this.Input().Get("tid")
	ship, err := models.GetShip(tid)
	if err != nil {
		beego.Error(err)
		this.Redirect("/ship", 302)
		return
	}
	this.Data["Database"] = ship
	this.Data["Id"] = tid
}
