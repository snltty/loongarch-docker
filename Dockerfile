
FROM ghcr.io/loong64/debian:trixie-slim

RUN apt-get update && \
    apt-get install -y wget curl libicu-dev xz-utils

RUN curl -fsSL https://ftp.loongnix.cn/dotnet/8.0.28/8.0.28-1/pkg/dotnet-sdk-8.0.128-linux-loongarch64.tar.xz -o dotnet-sdk-8.0.128-linux-loongarch64.tar.xz
RUN ls
RUN mkdir -p /dotnet
RUN tar xf dotnet-sdk-8.0.128-linux-loongarch64.tar.xz -C /dotnet
RUN ln -s /dotnet/dotnet /usr/bin/dotnet
RUN dotnet --version
