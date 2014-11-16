#!/bin/bash

if [ -z "${CONTROLLER}" ]; then
	export CONTROLLER="controller";
fi

if [ -z "${APPD_PORT}" ]; then
	export APPD_PORT=8090;
fi

if [ -z "${APP_NAME}" ]; then
	export APP_NAME="Fulfillment";
fi

if [ -z "${NODE_NAME}" ]; then
	export NODE_NAME="SynapseESB1";
fi
		
if [ -z "${TIER_NAME}" ]; then
	export TIER_NAME="FulfillmentESB";
fi

JAVA_OPTS="-Dappdynamics.controller.hostName=${CONTROLLER} -Dappdynamics.controller.port=${APPD_PORT} -Dappdynamics.agent.applicationName=${APP_NAME} -Dappdynamics.agent.tierName=${TIER_NAME} -Dappdynamics.agent.nodeName=${NODE_NAME}";

echo java ${JAVA_OPTS} -jar ${MACHINE_AGENT_HOME}/machineagent.jar

nohup java ${JAVA_OPTS} -jar ${MACHINE_AGENT_HOME}/machineagent.jar  > ${MACHINE_AGENT_HOME}/machine_agent.log 2>&1 &


cd ${SYNAPSE_HOME};
bin/synapse.sh	
