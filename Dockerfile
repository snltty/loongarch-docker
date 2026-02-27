FROM cr.loongnix.cn/loongson/loongnix:20
WORKDIR /root

# 配置APT忽略签名问题
RUN echo 'APT::Get::AllowUnauthenticated "true";' > /etc/apt/apt.conf.d/99temp && \
    echo 'Acquire::AllowInsecureRepositories "true";' >> /etc/apt/apt.conf.d/99temp && \
    echo 'Acquire::AllowDowngradeToInsecureRepositories "true";' >> /etc/apt/apt.conf.d/99temp

# 修改源为http
RUN sed -i 's/https:/http:/g' /etc/apt/sources.list

# 清理缓存并更新
RUN rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get update -o Acquire::AllowInsecureRepositories=true -o Acquire::AllowDowngradeToInsecureRepositories=true

# 安装基础工具 - 使用更基础的包，避免版本问题
RUN apt-get install -y --no-install-recommends --allow-unauthenticated \
    wget \
    xz-utils \
    ca-certificates || \
    (apt-get update && apt-get install -y --no-install-recommends --allow-unauthenticated wget xz-utils ca-certificates)

# 下载并安装dotnet
RUN wget http://ftp.loongnix.cn/dotnet/8.0.22/8.0.22-1/pkg/dotnet-sdk-8.0.122-linux-loongarch64.tar.xz && \
    mkdir dotnet && \
    tar -xvf dotnet-sdk-8.0.122-linux-loongarch64.tar.xz -C dotnet && \
    ln -s /root/dotnet/dotnet /usr/bin/dotnet && \
    rm dotnet-sdk-8.0.122-linux-loongarch64.tar.xz

# 验证安装
RUN dotnet --info