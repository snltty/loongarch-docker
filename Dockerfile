
FROM ghcr.io/loong64/debian:trixie-slim

RUN apt-get update && \
    apt-get install -y wget curl libicu-dev xz-utils

#RUN curl -fsSL https://github.com/loongson-community/dotnet-unofficial-build/releases/download/v9.0.201%2Bloong.20250313.build.20250313/dotnet-sdk-9.0.104-linux-loongarch64.tar.gz -o dotnet-sdk-9.0.104-linux-loongarch64.tar.gz
#RUN ls
#RUN mkdir -p /dotnet
#RUN tar xf dotnet-sdk-9.0.104-linux-loongarch64.tar.gz -C /dotnet
#RUN ln -s /dotnet/dotnet /usr/bin/dotnet
#RUN dotnet --version


RUN curl -fsSL https://ftp.loongnix.cn/dotnet/8.0.22/8.0.22-1/pkg/aspnetcore-runtime-8.0.22-linux-loongarch64.tar.xz -o dotnet-sdk.tar.gz
RUN mkdir -p /dotnet
RUN ls
RUN tar xf dotnet-sdk.tar.gz -C /dotnet
RUN ln -s /dotnet/dotnet /usr/bin/dotnet
RUN dotnet --version


