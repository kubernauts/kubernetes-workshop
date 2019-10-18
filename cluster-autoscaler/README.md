# CLUSTER AUTOSCALER

## Synopsis 

We are spinning a 3 node cluster on Azure or GCP.
A specfication for the autoscaler is defined in the yaml file.
The cluster autoscaler will look out for pending nodes and then scale up based on the VM flavour defined in the autoscaler yaml
A metrics tools will handle logs and metrics of the cluster for the different autoscaling iterations


## Context

We are using kubernetes cluster autoscaler


## What we are using
+2 node cluster
Master with enabled autoscaler
GCP/Azure dashboard to handle metrics


## Architecture
[TO DO]


## State diagram

![Alt text](https://github.com/fahedouch/kubernetes-workshop/blob/cluster_autoscaler_initial_commit/cluster-autoscaler/state-diagram.png "CA state diagram")



## Sequence diagram:
![Alt text](https://github.com/fahedouch/kubernetes-workshop/blob/cluster_autoscaler_initial_commit/cluster-autoscaler/sequence-diagram.png)
<details> 
GCP/Azure->NODE: scheduling action
NODE->GCP/Azure: no space to schedule pod
CA->GCP/Azure: need more nodes for pending pod
NODE<-GCP/Azure: grant node
GCP/Azure->NODE: schedule pending pod
</details>



## How to concretize the idea

By making workshops about the subject (a real cluster autoscaler with a live metrics dashboard)


