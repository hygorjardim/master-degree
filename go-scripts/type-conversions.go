package main 

import "fmt"

func main() {
	var i int = 42
	var f float64 = float64(i)

	z := i + int(f)
	x := float64(z)
	y := uint(x)
	fmt.Printf("%v %v %v\n", z, x, y)
}