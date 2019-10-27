# CRI and Kubernetes demo

## Prerequis
One machine with these CHARACTERISTICS:
* 2 GB or more of RAM
* 2 CPUs or more
* Swap disabled
* port 6443/2379-2380/10250/1025110252/30000-32767 should be open


## Step 1 : Install tools
install Kubeadm, Kubelet and Kubectl
```bash
sudo apt-get update && sudo apt-get install -y libseccomp2 apt-transport-https curl
## add key
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
## add repository
sudo touch /etc/apt/sources.list.d/kubernetes.list
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl
```
## Step 2 : Download Containerd Release Tarball
Download release 1.3.0 tarball for the ``containerd`` to install from the GCS bucket.
```bash
echo 'downloading  containerd 1.3.0..'
sudo wget https://storage.googleapis.com/cri-containerd-release/cri-containerd-${containerdVersion}.linux-amd64.tar.gz
```

## Step 3 : Validate checksum
Validate checksum of the release tarball:
```bash
localSha=$(sha256sum cri-containerd-${containerdVersion}.linux-amd64.tar.gz | awk '{ print $1 }')
remoteSha=$(curl https://storage.googleapis.com/cri-containerd-release/cri-containerd-${containerdVersion}.linux-amd64.tar.gz.sha256)
if [ $localSha = $remoteSha ]
then
  echo 'containerd tarball is valid :)'
else
  echo 'containerd tarball is not valid :('
fi
```

## Step 4 : Setup cri-containerd (using systemd)
unpack the tarball to the root directory
```bash
echo 'the tarball is composed from :'
sudo tar -tf cri-containerd-${containerdVersion}.linux-amd64.tar.gz
sudo tar --no-overwrite-dir -C / -xzf cri-containerd-${containerdVersion}.linux-amd64.tar.gz
sudo systemctl start containerd
```

## Step 5 : Setup kubelet configuration
Create kubelet conf file that uses containerd socket `/etc/systemd/system/kubelet.service.d/0-containerd.conf``:
```bash
cat <<EOF | sudo tee /etc/systemd/system/kubelet.service.d/0-containerd.conf
[Service]
Environment="KUBELET_EXTRA_ARGS=--container-runtime=remote --runtime-request-timeout=15m --container-runtime-endpoint=unix:///run/containerd/containerd.sock"
EOF
sudo systemctl daemon-reload                                                
```


## Step 6: Bring-up single-machine Kubernetes cluster with kubeadm
bring-up cluster with kubeadm and Enable pod scheduling on the control-plane node
```bash
#activate bridhe iptable configuration
sudo modprobe br_netfilter
sudo sysctl net.bridge.bridge-nf-call-iptables=1
#enable vm to be a router for other network
echo 1 |  sudo tee  /proc/sys/net/ipv4/ip_forward
sudo kubeadm init
```

## Step 7: configure kubectl
```bash
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

## Step 8: Pod scheduling
add taint to master node in order to enable pod scheduling on this node
```bash
sudo kubectl taint nodes --all node-role.kubernetes.io/master-
```

## Step 9: Setup cluster network
Install weaveworks network solution
```bash
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
```

