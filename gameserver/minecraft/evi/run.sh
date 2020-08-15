#!/bin/sh

TMP_PROP_LOC="./_server.properties"
FIN_PROP_LOC="./server.properties"

set -x
set -e

if [ -f $TMP_PROP_LOC ] &&\
   [ -f $FIN_PROP_LOC ] &&\ 
   [ $(cat $FIN_PROP_LOC | wc -c) -eq 0 ]
then
    echo "Synchronizing pre-deployed server.properties..."
    cat $TMP_PROP_LOC >> $FIN_PROP_LOC
fi

java -jar -Xms${XMS} -Xmx${XMX} ./forge.jar
