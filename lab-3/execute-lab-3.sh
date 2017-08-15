#!/bin/bash

##########################################################################################################
# Lab 3: Transform an application with the eclipse plugin
#######################################################################################################

CURRENT="$(pwd)"

# Configure the application and application server
cp -f solution/jboss-ejb3.xml sample-app-websphere/websphere-app-ejb/src/main/resources/META-INF/jboss-ejb3.xml
cp -f solution/jboss-web.xml sample-app-websphere/websphere-app-web/src/main/webapp/WEB-INF/jboss-web.xml
cp -f solution/standalone-full-ha.xml ${JBOSS_HOME}/standalone/configuration/standalone-full-ha.xml

# Builds the maven project
mvn clean eclipse:clean eclipse:eclipse install -f sample-app-websphere/pom.xml

cp -f sample-app-websphere/websphere-app-ear/target/websphere-app-ear-1.0.0.ear ${JBOSS_HOME}/standalone/deployments

echo "# Start the EAP server by starting EAP 7 in another terminal ..."
echo "${JBOSS_HOME}/bin/standalone.sh -c standalone-full-ha.xml"
echo "# ... and then execute"
echo "curl -fsSL 'http://localhost:8080/websphere-app-web/rest/BookingService/sendNotification?message=This%20is%20awesome!'"
