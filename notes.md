# Creating Basic Kubernetes and Openshift Resources

**podman** is lowest level of accessing resources

## Kubernetes (K8) Architecture

**pod** = consists of one or more containers
**master node** = provides basic cluster functions
**worker node** = where the actual pods are deployed to
**service** = define a single, persistent IP/port combonation that provides access to a pool of pods
**controller** = kubernetes that process monitors pods and reacts at certain times
(replication controller controls the exact number of containers in the pod)
**persistent volumes** = define storage areas to be used by kubernetes pods
**persistent volume claims** = represent a request for storage by a pod. PVC links a PV to a pod so its containers can make use of it

## OpenShift Resource Types
**Deployment config (dc)** = represents the set of containers included 
**Build config (bc)** = used by OpenShift Source-to-Image
**Routes** - represents a DNS host name recognized by openshift router
