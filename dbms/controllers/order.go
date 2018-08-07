package controllers

import (
	"dbms/models"
	"github.com/astaxie/beego"
)

type OrderController struct {
	beego.Controller
}

func (this *OrderController) Get() {
	this.Data["IsLogin"] = checkAccount(this.Ctx)
	this.TplName = "order.tpl"
	this.Data["IsOrder"] = true
	orders, err := models.GetAllOrders(true)
	if err != nil {
		beego.Error(err)
	} else {
		this.Data["Orders"] = orders
	}
}

func (this *OrderController) View() {
	this.TplName = "order_view.tpl"

	news, err := models.GetAllNews(true)
	if err != nil {
		beego.Error(err)
	} else {
		this.Data["News"] = news
	}
}

func (this *OrderController) Post() {

	tid := this.Input().Get("id")
	browsers := this.Input().Get("type")
	name := this.Input().Get("name")
	model := this.Input().Get("model")
	cost := this.Input().Get("cost")
	manufacturer := this.Input().Get("manufacturer")
	ordernum := this.Input().Get("ordernum")
	sum := this.Input().Get("sum")

	err := models.OrderProduct(browsers, name, model, cost, manufacturer, ordernum)
	if err != nil {
		beego.Error(err)
	}

	serr := models.GetPlusSum(tid, ordernum, sum)
	if serr != nil {
		beego.Error(serr)
	}

	this.Redirect("/order", 302)
}

func (this *OrderController) Modify() {
	this.TplName = "order_modify.tpl"

	tid := this.Input().Get("tid")
	order, err := models.GetOrder(tid)
	if err != nil {
		beego.Error(err)
		this.Redirect("/order", 302)
		return
	}
	this.Data["Database"] = order
	this.Data["Id"] = tid
}
