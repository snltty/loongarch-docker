FROM cr.loongnix.cn/library/debian:buster
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        curl \
        git \
        wget \
        tzdata \
        openssh-client \
        xz-utils \
        libicu67

RUN wget http://ftp.loongnix.cn/dotnet/8.0.22/8.0.22-1/pkg/dotnet-sdk-8.0.122-linux-loongarch64.tar.xz 
RUN mkdir dotnet && tar -xvf dotnet-sdk-8.0.122-linux-loongarch64.tar.xz -C dotnet
RUN ln -s /root/dotnet/dotnet /usr/bin/dotnet