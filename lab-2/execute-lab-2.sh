#!/bin/bash

###########################################
# Lab 2: Analyze an application
###########################################

CURRENT="$(pwd)"

rm ${RHAMT_HOME}/rules/my*.xml

PACKAGES="com.rhc"
INPUT="${CURRENT}/websphere-app-ear-1.0.0.ear"
OUTPUT="${CURRENT}/report"
SOURCE="websphere"
TARGET="eap7"

${RHAMT_HOME}/bin/rhamt-cli --batchMode --overwrite --input ${INPUT} --output ${OUTPUT} --packages ${PACKAGES} --source ${SOURCE} --target ${TARGET}
