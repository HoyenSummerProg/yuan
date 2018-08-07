package main

import(
	"fmt"
)

func main(){

	var(sum,x int
	)
		fmt.Println("請輸入一個整數\n")
		fmt.Scanln(&x)
		if x>5{
			sum=x*x
		}else if x==5{
			fmt.Println("此數為5，不做任何事")
		}else{
			for i:=1;i<=x;i++{
				sum=sum+i
			}
		}
				if x!=5{
					fmt.Println("輸出值為",sum)
				}
}