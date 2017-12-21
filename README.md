ref: https://github.com/jnovack/docker-autossh

# AutoSSH Local Forwarding

## Environment Variables

### **SSH_HOSTUSER** (default: `root`)

Specify the username to remote endpoint

### **SSH_HOSTNAME**

Specify address for to the remote endpoint

### **SSH_HOSTPORT** (default: 22)

Specify ssh port to the remote endpoint

### **SSH_TUNNEL_REMOTE_HOST**

Specify the remote endpoint service host

### **SSH_TUNNEL_REMOTE_PORT** 

Specify the remote endoint service port


### **SSH_TUNNEL_LOCAL_HOST** (default: `127.0.0.1`)

Specify listening address on the local

### **SSH_TUNNEL_LOCAL_PORT** (default: `3000`)

Specify listening port on the local