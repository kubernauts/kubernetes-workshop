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

