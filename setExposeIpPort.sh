#!/bin/bash

echo "Now set public ip:port to $1:$2"
${DEPLOYR_HOME}/mongo/mongo/bin/mongo deployr -u deployr -p 32d855e016856164fcd732e9782bb227- --host localhost --port 8003 << FOO > /dev/null 2>&1
db.server.update( {}, {\$set: {webContext: 'http://$1:$2/deployr'}} )
db.server.update( {}, {\$set: {disableautoip: true}} )
exit
FOO


