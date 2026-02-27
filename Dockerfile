
FROM loongsongd/dotnet:8.0.102-sdk-loong64

WORKDIR /app

RUN dotnet --info

RUN git clone https://github.com/snltty/linker.git
RUN dotnet publish src/linker -c release -f net8.0 -o public/publish/loongarch64 -r linux-loongarch64 -p:PublishSingleFile=true  --self-contained true  -p:TrimMode=partial -p:TieredPGO=true  -p:DebugType=full -p:EventSourceSupport=false -p:DebugSymbols=true -p:EnableCompressionInSingleFile=true -p:DebuggerSupport=false -p:EnableUnsafeBinaryFormatterSerialization=false -p:EnableUnsafeUTF7Encoding=false -p:HttpActivityPropagationSupport=false -p:InvariantGlobalization=true  -p:MetadataUpdaterSupport=false  -p:UseSystemResourceKeys=true -p:MetricsSupport=false -p:StackTraceSupport=false -p:XmlResolverIsNetworkingEnabledByDefault=false

