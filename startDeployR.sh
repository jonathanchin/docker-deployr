#!/bin/bash

IP_FILE=/opt/expose_ip


set_webcontext() {
echo "Now set public ip:port to ${EXPOSE_IP}:${EXPOSE_PORT}"
${DEPLOYR_HOME}/mongo/mongo/bin/mongo deployr -u deployr -p 32d855e016856164fcd732e9782bb227- --host localhost --port 8003 << FOO > /dev/null 2>&1
db.server.update( {}, {\$set: {webContext: 'http://${EXPOSE_IP}:${EXPOSE_PORT}/deployr'}} )
db.server.update( {}, {\$set: {disableautoip: true}} )
exit
FOO
}

if [ ! -z ${EXPOSE_IP} ]; then
    if [ ! -f "${IP_FILE}" ]; then

        /opt/deployr/8.0.0/mongo/mongod.sh start
        sleep 5
        
        set_webcontext

        sleep 5
        /opt/deployr/8.0.0/mongo/mongod.sh stop
        sleep 5

        echo ${EXPOSE_IP} > ${IP_FILE}
        echo "set expose ip to ${EXPOSE_IP}"
    fi
    
fi

/bin/bash -c "${DEPLOYR_HOME}/startAll.sh"

tail -f ${DEPLOYR_HOME}/tomcat/tomcat7/logs/catalina.out

