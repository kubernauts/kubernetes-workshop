kubectl - the Kubernetes command-line tool, allows you to run commands against Kubernets cluster. You can use kubectl to deploy applications, inspect and manage cluster resources and view logs. 

## Table of Contents 
  1. [Basic Operations] (#1-basic-operations)
    1.1 [Create](#11-create)
    1.2 [Get](#12-get)
    1.3 [Run](#13-run)
    1.4 [Expose](#14-expose)
    1.5 [Delete](#15-delete)

# 1. Basic Operations
<table>
    <tr>
	<td><a href="#1.1-create">create</a></td>
	<td><a href="#1.2-get">get</a></td>
	<td><a href="#1.3-run">run</a></td>
	<td><a href="#1.4-expose">expose</a></td>
	<td><a href="#1.5-delete">delete</a></td>
    </tr>
</table>

## 1.1  `create`
Create a resource from a file or from stdin. Acceted formats are JSON and YAML.

Usage
```bash
kubectl create -f FILENAME 
