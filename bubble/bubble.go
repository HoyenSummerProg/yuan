package main

import(
	"fmt"
)

func main(){
	var bubble [5] int
	var i,x,temp int
	end:=len(bubble)
	fmt.Println("請輸入5個數字")
	for i=0;i<end;i++{
		fmt.Println("第",i+1,"個數字為")
		fmt.Scanln(&x)
		bubble[i]=x
	}
		for i=0;i<end;i++{
			for j:=i+1;j<end;j++{
				if bubble[i]>bubble[j]{
					temp=bubble[j]
					bubble[j]=bubble[i]
					bubble[i]=temp
				}	
			}
		}
				for i=0;i<end;i++{
					fmt.Print(bubble[i],",")
				}
	
	
	
}