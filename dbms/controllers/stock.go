package controllers

import (
	"dbms/models"
	"github.com/astaxie/beego"
)

type StockController struct {
	beego.Controller
}

func (this *StockController) Get() {
	this.Data["IsLogin"] = checkAccount(this.Ctx)
	this.TplName = "stock.tpl"
	this.Data["IsStock"] = true
	stocks, err := models.GetAllStocks(true)
	if err != nil {
		beego.Error(err)
	} else {
		this.Data["Stocks"] = stocks
	}

}
