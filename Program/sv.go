package main

import (
	"fmt"
	"net/http"
	"sync"
)

var (
	numberConnection int
	mu               sync.Mutex
)

func handler(w http.ResponseWriter, r *http.Request) {
	mu.Lock()
	numberConnection++
	fmt.Fprintf(w, "Connection number: %d", numberConnection)
	mu.Unlock()
}

func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Listenning")
	http.ListenAndServe(":8080", nil)
}
