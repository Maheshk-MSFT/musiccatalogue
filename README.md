# musiccatalogue
Sample .NET Core code to perform CRUD on Azure SQL DB

git clone https://github.com/Maheshk-MSFT/musiccatalogue
cd musiccatalogue
docker build . -t musiccatalogue
docker image ls
docker tag musiccatalogue musiccatalogue.azurecr.io/musiccatalogue:v1
az acr login --name mikkyshoprepo
docker push mikkyshoprepo.azurecr.io/webapp:v1
---
docker pull mikkyshoprepo.azurecr.io/webapp:v1
docker run -d webapp
---
az login
az acr login --name mikkyshoprepo.azurecr.io
docker run --rm -d -p 8080:80 mikkyshoprepo.azurecr.io/musiccatalogue:v1   [-p 8080:80: map port 80 on container to external 8080 on host]
---
ip a show eth0
