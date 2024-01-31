# 使用官方Golang镜像作为基础镜像
FROM golang:1.20 AS build-env

# 设置工作目录为/app
WORKDIR /app

# 将当前主机目录下的整个项目复制到容器的/app下
COPY . .

# 在容器内执行go mod init，假设你的模块名是your-module-name
RUN go mod init your-module-name

# 下载依赖包并确保go.mod和go.sum文件正确无误
RUN go mod tidy

# 构建时禁用CGO以生成静态链接的二进制文件
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

# 编译主程序到可执行文件main
RUN go build -o main .

# 最终镜像仅包含编译好的程序和必要的运行时依赖
FROM alpine:latest
WORKDIR /app
COPY --from=build-env /app/main /app/

# 声明运行时入口点
CMD ["./main"]
