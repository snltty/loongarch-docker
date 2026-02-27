FROM cr.loongnix.cn/loongson/loongnix:20
WORKDIR /root

# 直接使用允许未认证的方式安装基础工具
RUN apt-get update -o Acquire::AllowInsecureRepositories=true -o Acquire::AllowDowngradeToInsecureRepositories=true
RUN apt-get install -y --no-install-recommends --allow-unauthenticated wget xz-utils ca-certificates
RUN apt-get clean

# 下载并安装dotnet
RUN wget http://ftp.loongnix.cn/dotnet/8.0.22/8.0.22-1/pkg/dotnet-sdk-8.0.122-linux-loongarch64.tar.xz && \
    mkdir dotnet && \
    tar -xvf dotnet-sdk-8.0.122-linux-loongarch64.tar.xz -C dotnet && \
    ln -s /root/dotnet/dotnet /usr/bin/dotnet && \
    rm dotnet-sdk-8.0.122-linux-loongarch64.tar.xz

# 验证安装
RUN dotnet --info