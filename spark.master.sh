#!/bin/sh -x
HOSTNAME=`hostname`
PORT=59081

## TODO
#function finish
#{
#  rm -f spark-master.url
#  rm -f spark-webui.url
#}
# trap finish exit

if echo spark://$HOSTNAME:$PORT > spark-master.url
then
    WEBUI=44464
    echo http://$HOSTNAME:$WEBUI > spark-webui.url
    . $SPARK_HOME/sbin/start-master.sh --host $HOSTNAME --port $PORT --webui-port $WEBUI
fi
