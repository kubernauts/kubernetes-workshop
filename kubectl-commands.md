kubectl - the Kubernetes command-line tool, allows you to run commands against Kubernets cluster. You can use kubectl to deploy applications, inspect and manage cluster resources and view logs. 

## Table of Contents 
  1. [Basic Operations](#1-basic-operations)
  2. [App Managment](#2-app-managment)

## 1. Basic Operations
<table>
    <tr>
	<td><a href="#a-create">create</a></td>
	<td><a href="#b-get">get</a></td>
	<td><a href="#c-run">run</a></td>
	<td><a href="#d-expose">expose</a></td>
	<td><a href="#e-delete">delete</a></td>
    </tr>
</table>

### a. `create`
Create a resource from a file or from stdin. Accepted formats are JSON and YAML.

Usage
```bash
kubectl create -f FILENAME 
```

### b. `get`
Display one or many resources

Usage
```bash
kubectl get pods
kubectl get deploments
```

### c. `run`
Create and run a particular image, posibly replicated 

Usage
```bash
kubectl run nginx --image=nginx
```

### d. `expose`
Expose a resource as a new Kubernetes service.

Usage
```bash
kubectl expose rc nginx --port=80 --target-port=8000
```

### e. `delete`
Delete resources by filenames, stdin, resources and names, or by resources and label selector.

Usage
```bash
kubectl delete -f ./pod.json
```


## 2. App Managment
<table>
    <tr>
        <td><a href="#a-apply">apply</a></td>
        <td><a href="#b-edit">edit</a></td>
        <td><a href="#c-set">set</a></td>
        <td><a href="#d-rollout">rollout</a></td>
        <td><a href="#e-label">label</a></td>
    </tr>
</table>


### a. `apply`
Apply a configuration to a resource by filename or stdin. The resource name must be specified. This resource will be created if it doesn't exist yet.

Usage 
```bash
kubectl apply -f ./pod.json
```

### b. `edit`
Edit a resource from the default editor.

Usage 
```bash
kubectl edit svc/docker-registry
```

### c. `set`
Configure application resources

These commands help you make changes to existing application resources.

Usage
```bash
kubectl set env deployment/registry STORAGE_DIR=/local
```

### d. `rollout`
Manage the rollout of a resource.

Usage
```bash
kubectl rollout undo deployment/abc
```

### e. `label`
Update the labels on a resource.

Usage
```bash
kubectl label pods foo unhealthy=true
```





Please feel free to update
