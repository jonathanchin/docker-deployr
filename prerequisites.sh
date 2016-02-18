#!/bin/bash
#https://deployr.revolutionanalytics.com/documents/admin/install/#preparing

yum clean all 

cd /opt 
#install RRO
wget https://mran.revolutionanalytics.com/install/RRO-${RRO_VERSION}.${OS_VERSION}.x86_64.rpm
yum install -y RRO-${RRO_VERSION}.${OS_VERSION}.x86_64.rpm
rm -f RRO-${RRO_VERSION}.${OS_VERSION}.x86_64.rpm
echo "RRO installed."

#install MKL
wget https://mran.revolutionanalytics.com/install/RevoMath-${MKL_VERSION}.tar.gz
tar -xzf RevoMath-${MKL_VERSION}.tar.gz
rm -f RevoMath-${MKL_VERSION}.tar.gz
cd RevoMath
echo 3 | source RevoMath.sh; installMklLibraries

cd /opt
rm -rf RevoMath
echo "MKL installed."

#install deployrRserve
wget https://github.com/deployr/deployr-rserve/releases/download/v${RSERVER_VERSION}/deployrRserve_${RSERVER_VERSION}.tar.gz

ln -s /usr/lib64/libicuuc.so.42 /usr/lib64/libicuuc.so 
ln -s /usr/lib64/libicui18n.so.42 /usr/lib64/libicui18n.so
R CMD INSTALL deployrRserve_${RSERVER_VERSION}.tar.gz
echo "deployrRserve installed."

yum install -y make gcc gcc-gfortran which
echo "prerequesties for deployr done."
