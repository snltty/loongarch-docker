FROM cr.loongnix.cn/loongson/loongnix:20
WORKDIR /root

# 直接尝试使用 curl 或 wget（基础镜像应该自带其中之一）
RUN if command -v curl >/dev/null 2>&1; then \
        curl -O http://ftp.loongnix.cn/dotnet/8.0.22/8.0.22-1/pkg/dotnet-sdk-8.0.122-linux-loongarch64.tar.xz; \
    elif command -v wget >/dev/null 2>&1; then \
        wget http://ftp.loongnix.cn/dotnet/8.0.22/8.0.22-1/pkg/dotnet-sdk-8.0.122-linux-loongarch64.tar.xz; \
    else \
        echo "No download tool found" && exit 1; \
    fi

# 解压安装
RUN mkdir dotnet && \
    tar -xvf dotnet-sdk-8.0.122-linux-loongarch64.tar.xz -C dotnet && \
    ln -s /root/dotnet/dotnet /usr/bin/dotnet && \
    rm dotnet-sdk-8.0.122-linux-loongarch64.tar.xz

# 验证安装
RUN dotnet --info