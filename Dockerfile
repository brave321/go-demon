# 使用官方的Golang基础镜像作为构建环境
FROM golang:1.20 AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main .

# 创建一个新的干净镜像用于运行应用程序
FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/main /app/main

CMD ["./main"]
