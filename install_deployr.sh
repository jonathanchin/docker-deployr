#!/bin/bash

echo ${JAVA_HOME}

mkdir -P /opt/deployrdownload
cd /opt/deployrdownload
wget https://deployr.revolutionanalytics.com/download/bundles/release/DeployR-Open-Linux-${DEPLOYR_VERSION}.tar.gz
tar -xzf DeployR-Open-Linux-${DEPLOYR_VERSION}.tar.gz
cd installFiles
./installDeployROpen.sh --no-ask --nolicense
cd /opt
rm -rf /opt/deployrdownload
#chmod 777 -R /opt/deployr/8.0.0/tomcat/tomcat7
chmod 777 /opt/deployr/8.0.0/tomcat/tomcat7/logs
chmod 777 /opt/deployr/8.0.0/tomcat/tomcat7/webapps
chmod 777 /opt/deployr/8.0.0/tomcat/tomcat7/temp

echo "deployr installed."

