# container-tools
Docker image with tools for debugging and troubleshooting:
* curl
* dig
* docker
* host
* [jq](https://stedolan.github.io/jq/)
* kubectl
* [mc](https://docs.min.io/docs/minio-client-complete-guide.html)
* netcat (OpenBSD version)
* nslookup
* ping
* [skopeo](https://github.com/containers/skopeo) 
* telnet
* traceroute
* vim
* wget
* [yq](https://github.com/mikefarah/yq)

# Run directly from the command line:

```
kubectl run container-tools --image=vpartington/container-tools --rm --tty --stdin bash
```

# Create an alias:

```
alias k8s-ct='kubectl run container-tools-$RANDOM --image=vpartington/container-tools --rm --tty --stdin bash'
```

# Run [the script](k8s-ct-on-node)

```
k8s-ct-on-node -h <nodename>
```

The script starts the container-tools image on a specific node, with `/var/run/docker.sock` mounted into the container. This allows the `docker` command line client to be used to interact with the Docker daemon on the node.

