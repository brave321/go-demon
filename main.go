package main

import "fmt"

var pageIndex int
var pageSize int

func init()  {
	pageIndex=1
	pageSize=20
	fmt.Println("First init function called.")
}

func anotherInit()  {
	// 注意这里并不是 init 函数，因此不会自动调用
	fmt.Println("This is not an init function, so it's not automatically called.")
}

func init()  {
	fmt.Printf("Page index initialized to %d\n", pageIndex)

	fmt.Printf("Page size initialized to %d\n", pageSize)

	fmt.Println("Second init function called.")
}









func main()  {
	fmt.Println("caa1")
	fmt.Println("main ,page index=%d, page size=%d\n",pageIndex,pageSize)
	anotherInit()
}
