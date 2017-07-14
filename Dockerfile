# # Sample contents of Dockerfile
# # Stage 1
# FROM microsoft/aspnetcore-build AS builder
# WORKDIR /source

# # caches restore result by copying csproj file separately
# COPY *.csproj .
# RUN dotnet restore

# # copies the rest of your code
# COPY . .
# RUN dotnet publish --output /app/ --configuration Release

# # Stage 2
# FROM microsoft/aspnetcore-build
# WORKDIR /app
# COPY --from=builder /app .
# ENTRYPOINT ["dotnet", "imminoglobulin.dll"]


FROM microsoft/aspnetcore-build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy and build everything else
COPY . ./
RUN dotnet publish -c Release -o out
ENTRYPOINT ["dotnet", "out/imminoglobulin.dll"]