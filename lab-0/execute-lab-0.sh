#!/bin/bash

###########################################
# Lab 0: Reset and setup your environment
###########################################

cd ..
rm -Rf ./bin
mkdir -p bin/jbds

#############  Setup Red Hat JBoss EAP 7.0.7

EAP_ADMIN_USERNAME='eapadmin'
EAP_ADMIN_PASSWORD='verysimplebutlongpassword'

# Unpack Red Hat JBoss EAP 7
unzip dist/eap/jboss-eap-7.0.0.zip -d bin 2>&1 >> /dev/null

# Set JBOSS_HOME
echo "export JBOSS_HOME=$(pwd)/bin/jboss-eap-7.0" >> ~/.bashrc; source ~/.bashrc

# Patch Red Hat JBoss EAP 7 to the latest version (should output “success” in a JSON structure)
${JBOSS_HOME}/bin/jboss-cli.sh "patch apply $(pwd)/dist/eap/jboss-eap-7.0.7-patch.zip"

# Create an EAP admin user with password (change the user and password)
${JBOSS_HOME}/bin/add-user.sh -a -u ${EAP_ADMIN_USERNAME} -p ${EAP_ADMIN_PASSWORD}

${JBOSS_HOME}/bin/standalone.sh --version

#############  Setup RHAMT

unzip dist/rhamt/rhamt-cli-4.0.0-SNAPSHOT-offline.zip -d ./bin 2>&1 >> /dev/null

echo "export RHAMT_HOME=$(pwd)/bin/rhamt-cli-4.0.0-SNAPSHOT" >> ~/.bashrc
echo "export RHAMT_HOME=$(pwd)/bin/rhamt-cli-4.0.0-SNAPSHOT" >> ~/.bashrc
echo "alias rhamt-cli='\${RHAMT_HOME}/bin/rhamt-cli'" >> ~/.bashrc;
source ~/.bashrc

${RHAMT_HOME}/bin/rhamt-cli --version

exec bash
