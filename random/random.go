package main

import(
	"fmt"
	"math/rand"
	"time"
)
var(
	a,p,q,i int
)

func main(){
	fmt.Println("這是一個終極密碼小遊戲")
	x:=rand.New(rand.NewSource(time.Now().UnixNano()))
	y:=x.Intn(100)
	fmt.Println("請輸入一個數字介於1~100之間")
	fmt.Scanln(&a)
	i=1
	p=100
	q=1
	for a!=y{
	if a>y{
		fmt.Println("錯囉!! 請再輸入一個數字介於",q,"~",a,"之間")
		p=a
	}else if a<y{
		fmt.Println("錯囉!! 請再輸入一個數字介於",a,"~",p,"之間")
		q=a
	}
	fmt.Scanln(&a)
	i++
	}
		fmt.Println("恭喜答對!!")
		fmt.Println("總使用",i,"次")
	
	
}