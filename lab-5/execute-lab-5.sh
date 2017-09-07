#!/bin/bash

###########################################
# Lab 5: Use the RHAMT Web Console
###########################################

CURRENT="$(pwd)"

cd ..
mkdir -p bin
rm -Rf ./bin/rhamt-web-distribution*

unzip dist/rhamt/rhamt-web-distribution-4.0.0-SNAPSHOT.zip -d ./bin

# Start the web console
echo "Please execute the following command to start the RHAMT Web Console: "
echo "  cd bin/rhamt-web-distribution-4.0.0-SNAPSHOT/; ./run_rhamt.sh"
echo "Then access the Web Consule by opening http://localhost:8080"

exec bash
