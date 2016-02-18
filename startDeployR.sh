#!/bin/bash

IP_FILE=/opt/expose_ip

if [ ! -z ${EXPOSE_IP} ]; then
    if [ ! -f "${IP_FILE}" ]; then
        /bin/bash -c "${DEPLOYR_HOME}/startAll.sh"
        /bin/bash -c "echo y | ${DEPLOYR_HOME}/deployr/tools/setWebContext.sh -ip ${EXPOSE_IP} -disableauto"
        sleep 5
        echo ${EXPOSE_IP} > ${IP_FILE}
        /bin/bash -c "${DEPLOYR_HOME}/stopAll.sh"
        sleep 20
        echo "set expose ip to ${EXPOSE_IP}"
    fi
    
fi

/bin/bash -c "${DEPLOYR_HOME}/startAll.sh"

tail -f ${DEPLOYR_HOME}/tomcat/tomcat7/logs/catalina.out

