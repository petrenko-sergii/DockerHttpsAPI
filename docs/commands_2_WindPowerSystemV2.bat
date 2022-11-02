=============================================================
commands
docker run -d -p 80:80 docker/getting-started
=============================================================

----------------   PUSH IMAGE TO REMOTE REPOSITORY  ------------------
https://www.youtube.com/watch?v=fdQ7MmQNTa0&ab_channel=Refactored  -- nice short tutorial

PS D:\WPS2\WindPowerSystemV2>docker images  -- show all images
PS D:\WPS2\WindPowerSystemV2> docker run -it -d windpowersystemv2:dev  -- creates container

docker ps -a            -- show all containers/apps
docker commit 70dd5c89bb90 petrenkodocker/wps2-image     -- create the image "petrenkodocker/wps2-image"  from the containner "70dd5c89bb90"

docker push petrenkodocker/wps2-image:latest      -- push the image petrenkodocker/wps2-image:latest  to remote repository
================================================================================

cd d:\WPS2\WindPowerSystemV2\

D:\WPS2\WindPowerSystemV2> docker build --help

docker build .
docker build --tag wps2 .
docker build --tag wps2:latest .

docker images   --> show all local images

docker image ls --> show all local images
docker container ls  --> show all local containers

docker run windpowersystemv2    --> fails: is looking for windpowersystemv2:latest
docker run windpowersystemv2:dev   --> after this command a new Container/App has been created

docker logout  --> should appear "Login Succeeded"
docker login  --> should appear "Login Succeeded"

docker ps     --> to check: is anything (processes) runnig on the system
docker ps -a  --> to check: is anything (processes) runnig on the system -- show all processes

docker start vigilant_swirles   --> if everything right, this container ("vigilant_swirles") should appear after command "docker ps "
docker stop vigilant_swirles

docker rm vigilant_swirles --> remove container (app)

# At the begining we did not allow for container to have any access from internet. We need to expose port    --- IMPORTANT !!!!!!!!!!!!!!!!!!!!!!!!!
docker run -p 8080:80 --name wps2port -d windpowersystemv2:dev --> we map port 8080 on the machine to port 80 of the container  ("-d" means we can run our container in the background detached)

docker push microsoft/dotnet:2.1-sdk-nanoserver-1709  --> [RepositoryName]:[TAG]
docker push petrenkodocker/microsoft/dotnet:2.1-sdk-nanoserver-1709
docker push petrenkodocker/"microsoft/dotnet":2.1-sdk-nanoserver-1709