package main

import (
	"dbms/controllers"
	"dbms/models"
	_ "dbms/routers"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
)

func init() {
	models.RegisterDB()
}

func main() {
	orm.Debug = true
	orm.RunSyncdb("default", false, true)

	beego.Router("/", &controllers.MainController{})
	beego.Router("/login", &controllers.LoginController{})
	beego.Router("/order", &controllers.OrderController{})
	beego.AutoRouter(&controllers.OrderController{})
	beego.AutoRouter(&controllers.ShipController{})
	beego.Router("/ship", &controllers.ShipController{})
	beego.Router("/new", &controllers.NewController{})
	beego.Router("/stock", &controllers.StockController{})

	beego.Run()
}
