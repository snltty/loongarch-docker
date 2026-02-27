
FROM loongsongd/dotnet:8.0.102-sdk-loong64

WORKDIR /app

RUN dotnet --info

COPY . .

RUN export DOTNET_CLI_TELEMETRY_OPTOUT=1 && \
    export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1 && \
    export NUGET_XMLDOC_MODE=skip && \
    # 预先创建必要的目录和文件
    mkdir -p /root/.dotnet /root/.nuget /tmp/NuGet-Scratch && \
    touch /root/.dotnet/FirstTimeUseNoticeSentinel && \
    # 清理 NuGet 缓存
    dotnet nuget locals all --clear && \
    dotnet restore src/linker -r linux-loongarch64 && \
    dotnet publish src/linker -c release -f net8.0 -o public/publish/loongarch64 -r linux-loongarch64 -p:PublishSingleFile=true  --self-contained true  -p:TrimMode=partial -p:TieredPGO=true  -p:DebugType=full -p:EventSourceSupport=false -p:DebugSymbols=true -p:EnableCompressionInSingleFile=true -p:DebuggerSupport=false -p:EnableUnsafeBinaryFormatterSerialization=false -p:EnableUnsafeUTF7Encoding=false -p:HttpActivityPropagationSupport=false -p:InvariantGlobalization=true  -p:MetadataUpdaterSupport=false  -p:UseSystemResourceKeys=true -p:MetricsSupport=false -p:StackTraceSupport=false -p:XmlResolverIsNetworkingEnabledByDefault=false

