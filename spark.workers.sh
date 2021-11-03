#!/bin/bash
export SPARK_HOME=<SPARK_HOME path>
export WORKDIR=<path to this repository>
export PATH=$PATH:$SPARK_HOME/bin
export JAVA_HOME=<JAVA_HOME path>

function finish
{
  [ ! -z $WORKER ] && kill $WORKER && wait $WORKER
}
trap finish exit

MasterAddress=`cat $WORKDIR/spark-master.url`
. $SPARK_HOME/sbin/start-slave.sh --webui-port 0 --cores 56 --memory 120G $MasterAddress &
WORKER=$!

while cat $WORKDIR/spark-master.url
do sleep 120; done
