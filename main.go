package main

import (
	"fmt"
	"os"
)

func main() {
	githubRef := os.Getenv("GITHUB_REF")
	fmt.Printf("githubRef: %q\n", githubRef)
}
