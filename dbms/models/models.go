package models

import (
	"github.com/Unknwon/com"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
	"os"
	"path"
	"strconv"
	"time"
)

const (
	_DB_name      = "root:123456789@tcp(127.0.0.1:3306)/dbms?charset=utf8&loc=Asia%2FShanghai"
	_MYSQL_DRIVER = "mysql"
)

type Database struct {
	Id           int64
	Type         string
	Name         string
	Model        string
	Cost         int64
	CostNum      int64
	CostCreated  time.Time `orm:"index"`
	Price        int64
	PriceNum     int64
	PriceCreated time.Time `orm:"index"`
	Stock        int64
	Manufacturer string
}

type OrderPage struct {
	Id           int64
	Type         string
	Name         string
	Model        string
	Manufacturer string
	Cost         int64
	CostNum      int64
	CostCreated  time.Time `orm:"index"`
}

type ShipPage struct {
	Id           int64
	Type         string
	Name         string
	Model        string
	Price        int64
	PriceNum     int64
	PriceCreated time.Time `orm:"index"`
}

func RegisterDB() {
	if !com.IsExist(_DB_name) {
		os.MkdirAll(path.Dir(_DB_name), os.ModePerm)
		os.Create(_DB_name)
	}

	orm.RegisterModel(new(Database), new(OrderPage), new(ShipPage))
	orm.RegisterDriver(_MYSQL_DRIVER, orm.DRMySQL)
	orm.RegisterDataBase("default", _MYSQL_DRIVER, _DB_name, 10)

}

func OrderProduct(browsers, name, model, cost, manufacturer, ordernum string) error {
	costNum, cerr := strconv.ParseInt(cost, 10, 64)
	orderNum, oerr := strconv.ParseInt(ordernum, 10, 64)
	if cerr != nil {
		return cerr
	}
	if oerr != nil {
		return oerr
	}

	o := orm.NewOrm()

	order := &OrderPage{
		Type:         browsers,
		Name:         name,
		Model:        model,
		Cost:         costNum,
		Manufacturer: manufacturer,
		CostNum:      orderNum,
		CostCreated:  time.Now(),
	}
	_, err := o.Insert(order)
	return err

}

func ShipProduct(browsers, name, model, price, shipnum string) error {
	priceNum, perr := strconv.ParseInt(price, 10, 64)
	shipNum, serr := strconv.ParseInt(shipnum, 10, 64)
	if perr != nil {
		return perr
	}
	if serr != nil {
		return serr
	}

	o := orm.NewOrm()

	ship := &ShipPage{
		Type:         browsers,
		Name:         name,
		Model:        model,
		Price:        priceNum,
		PriceNum:     shipNum,
		PriceCreated: time.Now(),
	}
	_, err := o.Insert(ship)
	return err

}

func NewProduct(browsers, name, model, cost, price string) error {
	costNum, cerr := strconv.ParseInt(cost, 10, 64)
	priceNum, perr := strconv.ParseInt(price, 10, 64)
	if cerr != nil {
		return cerr
	}
	if perr != nil {
		return perr
	}
	o := orm.NewOrm()

	new := &Database{
		Type:  browsers,
		Name:  name,
		Model: model,
		Cost:  costNum,
		Price: priceNum,
	}

	_, err := o.Insert(new)
	return err
}

func GetAllOrders(isDesc bool) ([]*OrderPage, error) {
	o := orm.NewOrm()

	orders := make([]*OrderPage, 0)

	qs := o.QueryTable("orderPage")

	var err error
	if isDesc {
		_, err = qs.OrderBy("-id").All(&orders)
	} else {
		_, err = qs.All(&orders)
	}
	return orders, err
}

func GetAllShips(isDesc bool) ([]*ShipPage, error) {
	o := orm.NewOrm()

	ships := make([]*ShipPage, 0)

	qs := o.QueryTable("shipPage")

	var err error
	if isDesc {
		_, err = qs.OrderBy("-id").All(&ships)
	} else {
		_, err = qs.All(&ships)
	}
	return ships, err
}

func GetAllNews(isDesc bool) ([]*Database, error) {
	o := orm.NewOrm()

	news := make([]*Database, 0)

	qs := o.QueryTable("database")

	var err error
	if isDesc {
		_, err = qs.OrderBy("-id").All(&news)
	} else {
		_, err = qs.All(&news)
	}
	return news, err
}

func GetAllStocks(isDesc bool) ([]*Database, error) {
	o := orm.NewOrm()

	stocks := make([]*Database, 0)

	qs := o.QueryTable("database")

	var err error
	if isDesc {
		_, err = qs.OrderBy("-type").All(&stocks)
	} else {
		_, err = qs.All(&stocks)
	}
	return stocks, err
}

func GetOrder(tid string) (*Database, error) {
	tidNum, err := strconv.ParseInt(tid, 10, 64)
	if err != nil {
		return nil, err
	}
	o := orm.NewOrm()

	order := new(Database)
	qs := o.QueryTable("database")
	err = qs.Filter("id", tidNum).One(order)
	if err != nil {
		return nil, err
	}

	return order, err
}

func GetShip(tid string) (*Database, error) {
	tidNum, err := strconv.ParseInt(tid, 10, 64)
	if err != nil {
		return nil, err
	}
	o := orm.NewOrm()

	ship := new(Database)
	qs := o.QueryTable("database")
	err = qs.Filter("id", tidNum).One(ship)
	if err != nil {
		return nil, err
	}

	return ship, err
}

func GetPlusSum(tid, ordernum, sum string) error {
	tidNum, err := strconv.ParseInt(tid, 10, 64)
	orderNum, oerr := strconv.ParseInt(ordernum, 10, 64)
	sums, serr := strconv.ParseInt(sum, 10, 64)
	if err != nil {
		return err
	}
	if oerr != nil {
		return oerr
	}
	if serr != nil {
		return serr
	}
	o := orm.NewOrm()

	total := &Database{Id: tidNum}
	if o.Read(total) == nil {
		sums = sums + orderNum
		total.Stock = sums
		o.Update(total)
	}
	return err
}

func GetMinusSum(tid, shipnum, sum string) error {
	tidNum, err := strconv.ParseInt(tid, 10, 64)
	shipNum, oerr := strconv.ParseInt(shipnum, 10, 64)
	sums, serr := strconv.ParseInt(sum, 10, 64)
	if err != nil {
		return err
	}
	if oerr != nil {
		return oerr
	}
	if serr != nil {
		return serr
	}
	o := orm.NewOrm()

	total := &Database{Id: tidNum}
	if o.Read(total) == nil {
		sums = sums - shipNum
		total.Stock = sums
		o.Update(total)
	}
	return err
}
