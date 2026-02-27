
FROM ghcr.io/loong64/debian:trixie-slim

RUN apt-get update && \
    apt-get install -y curl libicu-dev

#RUN curl -fsSL https://github.com/loongson-community/dotnet-unofficial-build/releases/download/v9.0.201%2Bloong.20250313.build.20250313/dotnet-sdk-9.0.104-linux-loongarch64.tar.gz -o dotnet-sdk-9.0.104-linux-loongarch64.tar.gz
#RUN ls
#RUN mkdir -p /dotnet
#RUN tar xf dotnet-sdk-9.0.104-linux-loongarch64.tar.gz -C /dotnet
#RUN ln -s /dotnet/dotnet /usr/bin/dotnet
#RUN dotnet --version

RUN wget https://dot.net/v1/dotnet-install.sh
RUN    chmod +x dotnet-install.sh
RUN    mkdir -p /usr/local/dotnet
RUN    ./dotnet-install.sh --channel 8.0 --install-dir /usr/local/dotnet --version latest