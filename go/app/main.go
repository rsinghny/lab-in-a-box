package main

import (
	"fmt"
	"log"
	"net/http"
	"time"

	sigsci "github.com/signalsciences/sigsci-module-golang"
)

func helloworld(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, `<!DOCTYPE html>
		<html lang="en">
		<head>
			<meta charset="utf-8">
			<meta name="description" content="Signal Sciences">
			<meta name="author" content="Signal Sciences">
			<title>Lab-In-A-Box - Go</title>
		</head>
		<body>
			<p>Welcome to lab-in-a-box Go!</p>
		</body>
		</html>`)
}

func main() {
	mux := http.NewServeMux()
	mux.HandleFunc("/", helloworld)

	h, err := sigsci.NewModule(mux, sigsci.Timeout(50*time.Millisecond))
	if err != nil {
		log.Fatal(err)
	}
	s := &http.Server{
		Handler: h,
		Addr:    ":8080",
	}
	log.Fatal(s.ListenAndServe())
}
