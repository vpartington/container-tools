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

# Start with
```
kubectl run container-tools --image=vpartington/container-tools --rm --tty --stdin bash
```

# Or create an alias:
```
alias k8sct='kubectl run container-tools-$RANDOM --image=vpartington/container-tools --rm --tty --stdin bash'
```
