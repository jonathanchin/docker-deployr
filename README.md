# docker-deployr

## Run
```shell
docker run -d \
-p ${expose.port}:8000 \
-p 8006:8006 \
-e EXPOSE_IP=${expose.ip} \
-e EXPOSE_PORT=${expose.port} \
whylu/docker-deployr
```

${expose.ip} is host machine's public ip for web. <br/>
${expose.port} is host machine's public port for web. <br/>
port 8006 is fixed and must. <br/>
wait about 30 seconds, then go to http://${expose.ip}:${expose.port}/deployr <br/>
enjoy it! <br/>


##Change expose ip
```shell
docker exec ${containername} /opt/setExposeIpPort.sh ${expose.ip} ${expose.port}
docker restart ${containername}
```

