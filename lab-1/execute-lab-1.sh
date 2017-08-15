#!/bin/bash

###########################################
# Lab 1: Your first windup run!
###########################################

CURRENT="$(pwd)"

rm -f ${RHAMT_HOME}/rules/my*.xml

PACKAGES="com.acme"
INPUT="${CURRENT}/simple-sample-app.ear"
OUTPUT="${CURRENT}/report"
SOURCE="weblogic"
TARGET="eap7"

${RHAMT_HOME}/bin/rhamt-cli --batchMode --overwrite --input ${INPUT} --output ${OUTPUT} --packages ${PACKAGES} --source ${SOURCE} --target ${TARGET}
