# container-tools
Docker image with tools for debugging and troubleshooting:
* curl
* dig
* docker
* host
* kubectl
* netcat
* nslookup
* ping
* [skopeo](https://github.com/containers/skopeo) 
* telnet
* traceroute
* vim
* wget

# Run directly from the command line:
```
kubectl run container-tools --image=vpartington/container-tools --rm --tty --stdin bash
```

# Create an alias:
```
alias k8s-ct='kubectl run container-tools-$RANDOM --image=vpartington/container-tools --rm --tty --stdin bash'
```

# Run [the script](k8s-ct-on-node) to run container-tools on a specific node
```
k8s-ct-on-node <nodename>
```
