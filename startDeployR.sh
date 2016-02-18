#!/bin/bash

IP_FILE=/opt/expose_ip

if [ ! -z ${EXPOSE_IP} ]; then
    if [ ! -f "${IP_FILE}" ]; then

        /opt/deployr/8.0.0/mongo/mongod.sh start
        sleep 5
        /bin/bash -c "echo y | ${DEPLOYR_HOME}/deployr/tools/setWebContext.sh -ip ${EXPOSE_IP} -disableauto"
        sleep 5
        /opt/deployr/8.0.0/mongo/mongod.sh stop
        sleep 5

        echo ${EXPOSE_IP} > ${IP_FILE}
        echo "set expose ip to ${EXPOSE_IP}"
    fi
    
fi

/bin/bash -c "${DEPLOYR_HOME}/startAll.sh"

tail -f ${DEPLOYR_HOME}/tomcat/tomcat7/logs/catalina.out

