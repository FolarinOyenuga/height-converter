package main

import (
	"fmt"
)

func main() {
	var feet, outcome float64
	const oneCm = 30.48

	// get user input
	fmt.Print("Enter number of feet: ")
	_, err := fmt.Scan(&feet)
	if err != nil {
		fmt.Println("Error reading input: ", err)
		return
	}

	outcome = oneCm * feet
	fmt.Printf("That gives you %.2f cm\n ", outcome)
}
