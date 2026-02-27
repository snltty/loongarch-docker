# 第一阶段：准备解压工具和文件
FROM alpine:latest as preparer
RUN apk add --no-cache curl xz
WORKDIR /download
RUN curl -o dotnet-sdk.tar.xz http://ftp.loongnix.cn/dotnet/8.0.22/8.0.22-1/pkg/dotnet-sdk-8.0.122-linux-loongarch64.tar.xz && \
    mkdir dotnet && \
    tar -xvf dotnet-sdk.tar.xz -C dotnet

# 第二阶段：目标镜像
FROM cr.loongnix.cn/loongson/loongnix:20
WORKDIR /root

# 直接复制解压后的文件
COPY --from=preparer /download/dotnet /root/dotnet

# 创建软链接
RUN ln -s /root/dotnet/dotnet /usr/bin/dotnet

# 验证安装
RUN dotnet --info