FROM cr.loongnix.cn/loongson/loongnix:20
WORKDIR /root

# 使用 ADD 下载文件（Docker 内置功能）
ADD http://ftp.loongnix.cn/dotnet/8.0.22/8.0.22-1/pkg/dotnet-sdk-8.0.122-linux-loongarch64.tar.xz /root/

# 解压安装
RUN mkdir dotnet && \
    tar -xvf dotnet-sdk-8.0.122-linux-loongarch64.tar.xz -C dotnet && \
    ln -s /root/dotnet/dotnet /usr/bin/dotnet && \
    rm dotnet-sdk-8.0.122-linux-loongarch64.tar.xz

# 验证安装
RUN dotnet --info