#!/bin/sh

touch /id_rsa
chmod 0400 /id_rsa

SSH_TUNNEL_LOCAL_HOST=${SSH_TUNNEL_LOCAL_HOST:=127.0.0.1}
SSH_TUNNEL_LOCAL_PORT=${SSH_TUNNEL_LOCAL_PORT:=3000}
SSH_TUNNEL_REMOTE_HOST=${SSH_TUNNEL_REMOTE_HOST:=127.0.0.1}
SSH_TUNNEL_REMOTE_PORT=${SSH_TUNNEL_REMOTE_PORT:=3000}

# Pick a random port above 32768
DEFAULT_PORT=$RANDOM
let "DEFAULT_PORT += 32768"
echo [INFO] Tunneling ${SSH_HOSTUSER:=root}@${SSH_HOSTNAME:=localhost}:${SSH_TUNNEL_REMOTE_PORT} to ${SSH_TUNNEL_LOCAL_HOST}:${SSH_TUNNEL_LOCAL_PORT:=22}

echo autossh \
 -M 0 \
 -o StrictHostKeyChecking=no \
 -o ServerAliveInterval=5 \
 -o ServerAliveCountMax=1 \
 -t -t \
 -i /id_rsa \
 -L ${SSH_TUNNEL_LOCAL_HOST}:${SSH_TUNNEL_LOCAL_PORT}:${SSH_TUNNEL_REMOTE_HOST}:${SSH_TUNNEL_REMOTE_PORT} \
 -p ${SSH_HOSTPORT:=22} \
 ${SSH_HOSTUSER}@${SSH_HOSTNAME}

AUTOSSH_PIDFILE=/autossh.pid \
AUTOSSH_POLL=10 \
AUTOSSH_LOGLEVEL=0 \
AUTOSSH_LOGFILE=/dev/stdout \
autossh \
 -M 0 \
 -o StrictHostKeyChecking=no \
 -o ServerAliveInterval=5 \
 -o ServerAliveCountMax=1 \
 -t -t \
 -i /id_rsa \
 -L ${SSH_TUNNEL_LOCAL_HOST}:${SSH_TUNNEL_LOCAL_PORT}:${SSH_TUNNEL_REMOTE_HOST}:${SSH_TUNNEL_REMOTE_PORT} \
 -p ${SSH_HOSTPORT:=22} \
 ${SSH_HOSTUSER}@${SSH_HOSTNAME}
