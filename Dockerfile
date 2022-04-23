#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["musiccatalogue.csproj", "."]
RUN dotnet restore "./musiccatalogue.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "musiccatalogue.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "musiccatalogue.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENV ASPNETCORE_URLS=http://+:5000
EXPOSE 5000
ENTRYPOINT ["dotnet", "musiccatalogue.dll"]


#RUN dotnet publish net6api.csproj -c release -o /app --no-restore
#
#FROM mcr.microsoft.com/dotnet/aspnet:6.0-focal
#WORKDIR /app
#COPY --from=build /app ./
#
#ENV ASPNETCORE_URLS=http://+:5000
#EXPOSE 5000
#ENTRYPOINT ["dotnet","net6api.dll"]