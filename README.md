# EoloPlanner

Infrastructure files are located under the root folder called `/infrastructure` and are structured by their service name.

To deploy all the components to make the application work, an additional script called `apply_all_infrastructure.sh` has been added. This script will create all the deployments and services associated in your Kubernetes cluster.

The service called **server** exposes a client webapp that works in the **port 3000**.

Optionally, you could also apply them one by one if necessary by using the kubectl command `kubectl apply -f infrastructure/<service_name>/deployment.yml` and `kubectl apply -f infrastructure/<service_name>/service.yml`.