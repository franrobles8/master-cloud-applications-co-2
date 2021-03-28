#!/usr/bin/env bash

INFRA_DIRECTORY=infrastructure

declare -a helper_services=("mysql" "mongodb" "rabbitmq")

# Apply db and queue infra first
for i in "${helper_services[@]}"
do
   echo "$i"
   echo "Applying deployment for ${i}"
   kubectl apply -f "${INFRA_DIRECTORY}/${i}/deployment.yml"
   echo "Applying service for ${i}"
   kubectl apply -f "${INFRA_DIRECTORY}/${i}/service.yml"
done

echo "Infrastructure for helper services has been applied successfully"

declare -a app_services=("toposervice" "weatherservice" "planner" "server")

# Apply app services
for i in "${app_services[@]}"
do
   echo "$i"
   echo "Applying deployment for ${i}"
   kubectl apply -f "${INFRA_DIRECTORY}/${i}/deployment.yml"
   echo "Applying service for ${i}"
   kubectl apply -f "${INFRA_DIRECTORY}/${i}/service.yml"
done

echo "Infrastructure for app services has been applied successfully"

exit 0