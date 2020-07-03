#!/bin/bash

TMP_CONF_LOC="./_config"
FIN_CONF_LOC="./config"

set -x

if [ -d $TMP_CONF_LOC ]; then
    echo "Synchronising pre deployed configurations..."
    mv $TMP_CONF_LOC/* $FIN_CONF_LOC/
fi

java -jar -Xms${XMS} -Xmx${XMX} ./forge.jar
