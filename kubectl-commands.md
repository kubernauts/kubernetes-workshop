kubectl - the Kubernetes command-line tool, allows you to run commands against Kubernets cluster. You can use kubectl to deploy applications, inspect and manage cluster resources and view logs. 

## Table of Contents 
  1. [Basic Operations](#1-basic-operations)
    1.1. [Create](#11-create)
    1.2. [Get](#12-get)
    1.3. [Run](#13-run)
    1.4. [Expose](#14-expose)
    1.5. [Delete](#15-delete)
  2. [App Managment](#2-app-managment)
    2.1. [apply](#21-apply)

 1. [Basic Operations](#1-basic-operations)
    1.1. [File Operations](#11-file-operations)
    1.2. [Text Operations](#12-text-operations)
    1.3. [Directory Operations](#13-directory-operations)
    1.4. [SSH, System Info & Network Operations](#14-ssh-system-info--network-operations)
    1.5. [Process Monitoring Operations](#15-process-monitoring-operations)
  2. [Basic Shell Programming](#2-basic-shell-programming)
    2.1. [Variables](#21-variables)
    2.2. [Array](#22-array)
    2.3. [String Substitution](#23-string-substitution)
    2.4. [Functions](#24-functions)
    2.5. [Conditionals](#25-conditionals)
    2.6. [Loops](#26-loops)
  3. [Tricks](#3-tricks)
  4. [Debugging](#4-debugging)



## 1. Basic Operations
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
Create a resource from a file or from stdin. Accepted formats are JSON and YAML.

Usage
```bash
kubectl create -f FILENAME 
```

## 2. App Managment

