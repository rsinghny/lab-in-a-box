# sigsci-artillery

## Load Test Tools

This includes the following tools:

- [Artillery](https://artillery.io/)
- [Loadtest](https://github.com/alexfernandez/loadtest)

## Getting Started

1. Run `make build`
2. Run `make run`
3. Checkout docs and example scripts
    - Artillery docs: https://artillery.io/docs/gettingstarted.html, examples `scripts/`
    - Loadtest docs: https://github.com/alexfernandez/loadtest/blob/master/README.md, example: `loadtest -n 100000 -c 10 --rps 100 "http://192.168.99.100:3000/?t=<script>alert()</script>"`
