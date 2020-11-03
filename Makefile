all:
	GOOS=js GOARCH=wasm go build -o dist/wasm.wasm cmd/wasm/main.go

test:
	@PATH=$(shell go env GOROOT)/misc/wasm:$(PATH) GOOS=js GOARCH=wasm go test -cover -coverprofile=coverage.out -covermode=atomic github.com/shiguredo/sora-e2ee-go/internal/e2ee
	go tool cover -html=coverage.out -o coverage.html

brotli:
	brotli wasm.wasm
