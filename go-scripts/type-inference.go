package main

import "fmt"

func main() {
	i := "teste"
	f := 42.2
	g := 53.0 + 0.5i

	fmt.Printf("%v is of type %T\n", i, i)
	fmt.Printf("%v is of type %T\n", f, f)
	fmt.Printf("%v is of type %T\n", g, g)
}