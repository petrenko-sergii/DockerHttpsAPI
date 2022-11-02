
Run ASP.NET Core 3.1 Apps in Docker with HTTPS. (Les Jackson)
https://www.youtube.com/watch?v=lcaDDxJv260&ab_channel=LesJackson

DOTNET / DOCKER -- COMMANDS

dotnet --version
dotnet new
dotnet new webapi -n DockerHttpsAPI
dotnet run
      
docker build -t dockerhttpsapi .   ---- create image for project
docker run dockerhttpsapi
docker run -p 49900:80 dockerhttpsapi   -- 49900 -- register random free port for http

dotnet dev-certs https -ep $env:USERPROFILE\.aspnet\https\aspnetapp.pfx -p <CREDENTIAL_PLACEHOLDER>   -- - creates https-certifacate
dotnet dev-certs https -ep $env:USERPROFILE\.aspnet\https\DockerHttpsAPI.pfx -p pa55w0rd!             -- - creates https-certifacate
dotnet dev-certs https --trust   --- TO CREATE HTTPS DEV CERTIFICATE FOR LOCALHOST

dotnet user-secrets -p aspnetapp\aspnetapp.csproj set "Kestrel:Certificates:Development:Password" "<CREDENTIAL_PLACEHOLDER>"
dotnet user-secrets set "Kestrel:Certificates:Development:Password" "pa55w0rd!"                  ---- creates user-secrets

docker run --rm -it -p 49900:80 -p 49901:443 -e ASPNETCORE_URLS="https://+;http://+" -e ASPNETCORE_HTTPS_PORT=49901 -e ASPNETCORE_ENVIRONMENT=Development -v $env:APPDATA\microsoft\UserSecrets\:/root/.microsoft/usersecrets -v $env:USERPROFILE\.aspnet\https:/root/.aspnet/https/ dockerhttpsapi -- works fine  --- register port 49901:443 for https 

docker-compose up --build     --- creates separate image according to yaml-file for app and runs a container 
docker-compose up              --- runs a container 

docker ps -a            -- show all containers/apps
docker container ls  --> show all local containers
docker commit 9c01590f782c petrenkodocker/dockerhttpsapi     -- create the image "petrenkodocker/dockerhttpsapi"  from the containner "9c01590f782c"

docker push petrenkodocker/dockerhttpsapi:latest       -- push the image petrenkodocker/dockerhttpsapi:latest  to remote repository -- to push: image must have prefix/segment "petrenkodocker/" 
====================================================
DockerHttpsAPI  ( dockerhttpsapi )

https://localhost:44387/swagger/index.html
https://localhost:44387/WeatherForecast

https://localhost:5001/WeatherForecast
http://localhost:5000/WeatherForecast  ==> redirects to https

http://localhost:49900/WeatherForecast  -- works (runs from container)
https://localhost:49901/WeatherForecast  -- works (runs from container)
====================================================

c:\Users\Petrenko\AppData\Roaming\ASP.NET\Https\   --- certificates for IIS
C:\Users\Petrenko\.aspnet\https  -- certificate for project "DockerHttpsAPI"

docs.docker.com/engine/examples/dotnetcore
https://github.com/dotnet/dotnet-docker/blob/main/samples/run-aspnetcore-https-development.md
