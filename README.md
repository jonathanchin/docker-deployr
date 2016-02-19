# docker-deployr

## Run
```shell
docker run -d \
-p 8000:8000 \
-p 8001:8001 \
-p 8003:8003 \
-p 8006:8006 \
-e EXPOSE_IP=${expose.ip} \
whylu/docker-deployr
```

${expose.ip} is host machine's public ip <br/>
wait about 30 seconds, then go to http://${expose.ip}:8000/deployr <br/>
enjoy it! <br/>

##Change expose ip
```shell
docker exec ${containername} /bin/bash -c "echo y | /opt/deployr/8.0.0/deployr/tools/setWebContext.sh -ip ${EXPOSE_IP} -disableauto"
docker restart ${containername}
```

