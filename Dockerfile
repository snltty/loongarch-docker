
FROM ghcr.io/loong64/debian:trixie-slim

RUN curl -fsSL https://github.com/loongson-community/dotnet-unofficial-build/releases/download/v9.0.201%2Bloong.20250313.build.20250313/dotnet-sdk-9.0.104-linux-loongarch64.tar.gz -o dotnet-sdk-9.0.104-linux-loongarch64.tar.gz
RUN tar xf dotnet-sdk-9.0.104-linux-loongarch64.tar.gz -C /dotnet
RUN cd dotnet
RUN ls
RUN /dotnet/dotnet