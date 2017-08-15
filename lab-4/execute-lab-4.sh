#!/bin/bash

###########################################
# Lab 4: Craft and change some rules
###########################################

CURRENT="$(pwd)"

#resets custom rules
rm ${RHAMT_HOME}/rules/*.xml
cp -f ${CURRENT}/*.xml ${RHAMT_HOME}/rules

PACKAGES="com.rhc"
INPUT="${CURRENT}/../lab-2/websphere-app-ear-1.0.0.ear"
OUTPUT="${CURRENT}/report"
SOURCE="websphere"
TARGET="eap7"

${RHAMT_HOME}/bin/rhamt-cli --batchMode --overwrite --input ${INPUT} --output ${OUTPUT} --packages ${PACKAGES} --source ${SOURCE} --target ${TARGET}

rm -f ${RHAMT_HOME}/rules/*.xml
