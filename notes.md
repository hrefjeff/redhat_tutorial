# Creating Basic Kubernetes and Openshift Resources

**podman** is lowest level of accessing resources

## Kubernetes (K8) Architecture

**pod** = consists of one or more containers

**master node** = provides basic cluster functions

**worker node** = where the actual pods are deployed to

**service** = define a single, persistent IP/port combonation that provides access to a pool of pods

**controller** = kubernetes that process monitors pods and reacts at certain times (replication controller controls the exact number of containers in the pod)

**persistent volumes** = define storage areas to be used by kubernetes pods

**persistent volume claims** = represent a request for storage by a pod. PVC links a PV to a pod so its containers can make use of it

**config maps & secrets** = contains a set of keys where they're encrypted and holds password and stuff

## OpenShift Resource Types
**Deployment config (dc)** = represents the set of containers included in a pod, and strategy to be used

**Build config (bc)** = used by OpenShift Source-to-Image (provide openshift with a git repository and build an image based on the source code)

**Routes** - represents a DNS host name recognized by openshift router (takes a kubernetes service and exposes it to the internet)


## The oc Utility

The main method of interacting with an RHOCP cluster

**oc login**
**oc new-app** can create and run a containerized application based on an image, a github repo, or both
**oc get** command allows users to get info about resources
**oc get pods** returns all the running pods
**oc get all** prints out a summary of all resource types
**oc describe** provides additional info about a particular resource
**oc export** will export a resource into a YAML definition file
**oc create** will create a resource based on a resource def file
**oc edit**
**oc delete**
**oc exec** allows users to execute commands inside a container

## Demo

Gets a mysql service running in openshift

already logged into cluster

`oc status`
`oc new-project mysql-openshift`
`oc new-app --docker-image=someregistry --name=mysql-openshift -e MYSQL_USER=user1 -e MYSQL_PASSWORD=mypa55 -e MYSQL_DATABASE=testdb -e MYSQL_ROOT_PASSWORD=r00tpa55 --insecure-registry`
`oc get pods` (check what has been created)
`oc describe pod (whichever pod)`
`oc get pods -w`
`oc get svc`
`oc expose service mysql-openshift`
`oc get route`
`oc port-forward (name of pod) 3306:3306`

NEW TAB

`mysql --uuser1 -pmypa55 --protocol tcp -h localhost` (connecting to my sql instance)
`show databases;`
`exit`
