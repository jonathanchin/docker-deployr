# docker-deployr

<pre>
docker run -d \
-p 8000:8000 \
-p 8001:8001 \
-p 8003:8003 \
-p 8006:8006 \
-e EXPOSE_IP=${expose.ip} \
whylu/docker-deployr
</pre>

${expose.ip} is host machine's public ip <br/>
wait about 30 seconds, then go to http://${expose.ip}:8000/deployr <br/>
enjoy it! <br/>
