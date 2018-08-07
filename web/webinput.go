package main

import(
	"fmt"
	"html/template"
	"log"
	"net/http"
	"strings"
)

func main(){
	http.HandleFunc("/",index)
	http.HandleFunc("/login",login)
	log.Println("Start")
	err :=http.ListenAndServe(":9090",  nil)
	if err!=nil {
		log.Fatal("ListenAndServe:", err)	
	}
}


func index(w http.ResponseWriter, r *http.Request){
	r.ParseForm()
	fmt.Println(r.Form)
	fmt.Println("path", r.URL.Path)
	fmt.Println("scheme", r.URL.Scheme)
	fmt.Println(r.Form["url_long"])
	for k, v := range r.Form {
        fmt.Println("key:", k)
        fmt.Println("val:", strings.Join(v, ""))
	}	

		fmt.Fprintf(w, "Hello astaxie!")
}	

func login(w http.ResponseWriter, r *http.Request){
	fmt.Println("method:", r.Method)
	if r.Method == "GET" {
		t, _ :=template.ParseFiles("login.gtpl")
		t.Execute(w,nil)
	}else {
		r.ParseForm()
		fmt.Println("username:", r.Form["username"])
		fmt.Println("password:", r.Form["password"])
	}
}