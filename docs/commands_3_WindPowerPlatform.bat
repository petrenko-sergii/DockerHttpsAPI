
docker build -t petrenkodocker/windpowerplatformservice .    --> should be lowercase
docker build -t petrenkodocker/commandsservice .

docker push petrenkodocker/windpowerplatformservice
docker push petrenkodocker/commandsservice

naming to docker.io/petrenkodocker/windpowerplatformservice 

# At the begining we did not allow for container to have any access from internet. We need to expose port 
docker run -p 8080:80 --name wps2port -d windpowersystemv2:dev --> we map port 8080 on the machine to port 80 of the container  ("-d" means we can run our container in the background detached)
docker run -p 8081:80                 -d petrenkodocker/windpowerplatformservice   ---> we map port 8081 on the machine to port 80 of the container     

docker push petrenkodocker/windpowerplatformservice

7de1f141ead2 -- running working container

No valid ports are available.
Ports are not available: listen tcp 0.0.0.0:8080: bind: Only one usage of each socket address (protocol/network address/port) is normally permitted.
unable to expose port TCP 0.0.0.0:8080 -> 0.0.0.0:0: listen tcp 0.0.0.0:8080: bind: 

docker run -p 8081:80 petrenkodocker/commandsservice

==================================================================================================

netstat -aon   -- show all available ports
netstat -ab    -- show all used ports
