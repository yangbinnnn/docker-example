package main

import (
	"net/http"
)

const (
	// VERSTION app version
	VERSTION = "0.0.1"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte("Hello!"))
		return
	})

	http.HandleFunc("/version", func(w http.ResponseWriter, r *http.Request) {
		w.Write([]byte(VERSTION))
		return
	})

	http.ListenAndServe(":8000", nil)
}
