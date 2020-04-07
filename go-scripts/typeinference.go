package main

import "fmt"

func typeinference() {
	i := "teste"
	f := 42.2

	fmt.Printf("%v is of type %T\n", i, i)
	fmt.Printf("%v is of type %T\n", f, f)
}